import 'package:cyber_pos/shared/components/forms/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../routes/route_name.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../shared/components/common/error_widget.dart' as app_err;
import '../../../../shared/components/common/empty_widget.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../shared/components/common/fab_button.dart';
import '../../../../core/enums/transaction_type_enum.dart';
import '../providers/transaction_notifier.dart';
import '../providers/transaction_events.dart';
import '../widgets/transaction_card.dart';
import '../widgets/transaction_type_filter_card.dart';

class TransactionListScreen extends ConsumerStatefulWidget {
  const TransactionListScreen({super.key});

  @override
  ConsumerState<TransactionListScreen> createState() =>
      _TransactionListScreenState();
}

class _TransactionListScreenState extends ConsumerState<TransactionListScreen> {
  final ScrollController _scrollController = ScrollController();
  TransactionType? _selectedType;
  bool _showMoreTypes = false;

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
    ref.listen<TransactionUiEvent?>(transactionUiEventsProvider, (prev, next) {
      if (next == null) return;
      final snackbar = ref.read(snackbarServiceProvider);
      if (next is TransactionFailure) {
        snackbar.showError(next.failure);
      } else if (next is TransactionCreated) {
        snackbar.showSuccess(next.message);
      }
      ref.read(transactionUiEventsProvider.notifier).clear();
    });

    final asyncList = ref.watch(transactionProvider);
    final notifier = ref.read(transactionProvider.notifier);
    final canLoadMore = notifier.canLoadMore;

    return Scaffold(
      body: asyncList.when(
        loading: () => Column(
          children: [
            // Header title
            Padding(
              padding: const EdgeInsets.fromLTRB(AppSizes.sm2, AppSizes.sm2, AppSizes.sm2, AppSizes.sm2),
              child: Text(
                l10n.yourTransactions,
                style: context.title(color: BrandColors.textPrimary),
              ),
            ),
            // Transaction type filter cards (always visible)
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                children: [
                  // All types card
                  TransactionTypeFilterCard(
                    label: 'All',
                    icon: Icons.list_rounded,
                    isSelected: _selectedType == null,
                    onTap: () {
                      setState(() {
                        _selectedType = null;
                      });
                      notifier.applyFilter(null);
                    },
                  ),
                  // Purchase card
                  TransactionTypeFilterCard(
                    label: TransactionType.purchase.getDisplayLabel(),
                    icon: TransactionType.purchase.getIcon(),
                    color: TransactionType.purchase.getColor(),
                    isSelected: _selectedType == TransactionType.purchase,
                    onTap: () {
                      setState(() {
                        _selectedType = TransactionType.purchase;
                      });
                      notifier.applyFilter(TransactionType.purchase);
                    },
                  ),
                  // Sale card
                  TransactionTypeFilterCard(
                    label: TransactionType.sale.getDisplayLabel(),
                    icon: TransactionType.sale.getIcon(),
                    color: TransactionType.sale.getColor(),
                    isSelected: _selectedType == TransactionType.sale,
                    onTap: () {
                      setState(() {
                        _selectedType = TransactionType.sale;
                      });
                      notifier.applyFilter(TransactionType.sale);
                    },
                  ),
                  // Other transaction types (shown when More is clicked)
                  if (_showMoreTypes)
                    ...TransactionType.values
                        .where((type) => type != TransactionType.purchase && type != TransactionType.sale)
                        .map((type) {
                      return TransactionTypeFilterCard(
                        label: type.getDisplayLabel(),
                        icon: type.getIcon(),
                        color: type.getColor(),
                        isSelected: _selectedType == type,
                        onTap: () {
                          setState(() {
                            _selectedType = type;
                          });
                          notifier.applyFilter(type);
                        },
                      );
                    }),
                  // More card (always at the end)
                  TransactionTypeFilterCard(
                    label: 'More',
                    icon: _showMoreTypes ? Icons.expand_less : Icons.expand_more,
                    isSelected: false,
                    onTap: () {
                      setState(() {
                        _showMoreTypes = !_showMoreTypes;
                      });
                    },
                  ),
                ],
              ),
            ),
            const Expanded(
              child: Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
        data: (transactions) {
          return RefreshIndicator(
            onRefresh: () => ref.read(transactionProvider.notifier).refresh(),
            color: BrandColors.primary,
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                // Header title
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(AppSizes.sm2, AppSizes.sm2, AppSizes.sm2, AppSizes.sm2),
                    child: Text(
                      l10n.yourTransactions,
                      style: context.title(color: BrandColors.textPrimary),
                    ),
                  ),
                ),

                // Transaction type filter cards (always visible)
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                      children: [
                        // All types card
                        TransactionTypeFilterCard(
                          label: 'All',
                          icon: Icons.list_rounded,
                          isSelected: _selectedType == null,
                          onTap: () {
                            setState(() {
                              _selectedType = null;
                            });
                            notifier.applyFilter(null);
                          },
                        ),
                        // Purchase card
                        TransactionTypeFilterCard(
                          label: TransactionType.purchase.getDisplayLabel(),
                          icon: TransactionType.purchase.getIcon(),
                          color: TransactionType.purchase.getColor(),
                          isSelected: _selectedType == TransactionType.purchase,
                          onTap: () {
                            setState(() {
                              _selectedType = TransactionType.purchase;
                            });
                            notifier.applyFilter(TransactionType.purchase);
                          },
                        ),
                        // Sale card
                        TransactionTypeFilterCard(
                          label: TransactionType.sale.getDisplayLabel(),
                          icon: TransactionType.sale.getIcon(),
                          color: TransactionType.sale.getColor(),
                          isSelected: _selectedType == TransactionType.sale,
                          onTap: () {
                            setState(() {
                              _selectedType = TransactionType.sale;
                            });
                            notifier.applyFilter(TransactionType.sale);
                          },
                        ),
                        // Other transaction types (shown when More is clicked)
                        if (_showMoreTypes)
                          ...TransactionType.values
                              .where((type) => type != TransactionType.purchase && type != TransactionType.sale)
                              .map((type) {
                            return TransactionTypeFilterCard(
                              label: type.getDisplayLabel(),
                              icon: type.getIcon(),
                              color: type.getColor(),
                              isSelected: _selectedType == type,
                              onTap: () {
                                setState(() {
                                  _selectedType = type;
                                });
                                notifier.applyFilter(type);
                              },
                            );
                          }),
                        // More card (always at the end)
                        TransactionTypeFilterCard(
                          label: 'More',
                          icon: _showMoreTypes ? Icons.expand_less : Icons.expand_more,
                          isSelected: false,
                          onTap: () {
                            setState(() {
                              _showMoreTypes = !_showMoreTypes;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                // Transactions list or empty state
                if (transactions.isEmpty)
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: EmptyWidget(
                        icon: Icons.swap_horiz,
                        title: l10n.noTransactions,
                        message: l10n.noTransactionsMessage,
                      ),
                    ),
                  )
                else
                  SliverPadding(
                    padding: const EdgeInsets.all(AppSizes.sm),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        // Loading indicator at bottom
                        if (index == transactions.length) {
                          return const Padding(
                            padding: EdgeInsets.all(AppSizes.lg),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }

                        final transaction = transactions[index];

                        return Column(
                          children: [
                            TransactionCard(
                              transaction: transaction,
                              onTap: () {
                                context.push(
                                  RouteName.transactionDetail,
                                  extra: transaction.id,
                                );
                              },
                            ),
                            if (index < transactions.length - 1)
                              const Divider(
                                height: 1,
                                thickness: 1,
                                color: BrandColors.divider,
                              ),
                          ],
                        );
                      }, childCount: transactions.length + (canLoadMore ? 1 : 0)),
                    ),
                  ),
              ],
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
              const SizedBox(height: AppSizes.lg),
              CustomButton(
                onPressed: () =>
                    ref.read(transactionProvider.notifier).refresh(),
                text: l10n.retry,
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
