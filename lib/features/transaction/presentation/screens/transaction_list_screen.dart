import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../routes/route_name.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/common/error_widget.dart' as app_err;
import '../../../../shared/components/common/empty_widget.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../shared/components/common/fab_button.dart';
import '../providers/transaction_notifier.dart';
import '../providers/transaction_events.dart';
import '../widgets/transaction_card.dart';

class TransactionListScreen extends ConsumerStatefulWidget {
  const TransactionListScreen({super.key});

  @override
  ConsumerState<TransactionListScreen> createState() => _TransactionListScreenState();
}

class _TransactionListScreenState extends ConsumerState<TransactionListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Listen to scroll events for infinite scroll
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  /// Detect when user scrolls near bottom, then load more
  void _onScroll() {
    if (_isBottom) {
      final notifier = ref.read(transactionProvider.notifier);
      if (notifier.canLoadMore) {
        notifier.loadMore();
      }
    }
  }

  /// Check if user has scrolled to bottom (with threshold)
  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    // Load more when 80% scrolled
    return currentScroll >= (maxScroll * 0.8);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    
    // Listen to UI events for user feedback
    ref.listen<TransactionUiEvent?>(
      transactionUiEventsProvider,
      (prev, next) {
        if (next == null) return;
        final snackbar = ref.read(snackbarServiceProvider);
        if (next is TransactionFailure) {
          snackbar.showError(next.failure);
        } else if (next is TransactionCreated) {
          snackbar.showSuccess(next.message);
        }
        ref.read(transactionUiEventsProvider.notifier).clear();
      },
    );

    final asyncList = ref.watch(transactionProvider);
    final notifier = ref.read(transactionProvider.notifier);
    final canLoadMore = notifier.canLoadMore;

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.transactions,
      ),
      body: asyncList.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (transactions) {
          if (transactions.isEmpty) {
            return Center(
              child: EmptyWidget(
                icon: Icons.swap_horiz,
                title: l10n.noTransactions,
                message: l10n.noTransactionsMessage,
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(transactionProvider.notifier).refresh(),
            color: BrandColors.primary,
            child: ListView.separated(
              controller: _scrollController,
              padding: const EdgeInsets.all(AppSizes.lg),
              itemCount: transactions.length + (canLoadMore ? 1 : 0),
              separatorBuilder: (context, index) {
                // Don't show divider before loading indicator
                if (index == transactions.length - 1 && canLoadMore) {
                  return const SizedBox.shrink();
                }
                return const Divider(
                  height: 1,
                  thickness: 1,
                  color: BrandColors.divider,
                );
              },
              itemBuilder: (context, index) {
                // Show loading indicator at the end if loading more
                if (index == transactions.length) {
                  return const Padding(
                    padding: EdgeInsets.all(AppSizes.lg),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                final transaction = transactions[index];
                return TransactionCard(
                  transaction: transaction,
                  onTap: () {
                    context.push(
                      RouteName.transactionDetail,
                      extra: transaction.id,
                    );
                  },
                );
              },
            ),
          );
        },
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              app_err.ErrorsWidget(
                failure: error is Failure
                    ? error
                    : Failure.unexpectedError(error.toString()),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.read(transactionProvider.notifier).refresh(),
                child: Text(l10n.retry),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () => context.push(RouteName.transactionForm),
      ),
    );
  }
}

