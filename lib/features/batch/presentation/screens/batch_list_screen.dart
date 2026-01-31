import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/common/error_widget.dart' as app_err;
import '../../../../shared/components/common/empty_widget.dart';
import '../../../../shared/components/common/fab_button.dart';
import '../../../../shared/components/forms/search_bar.dart' as search;
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../providers/batch_notifier.dart';
import '../providers/batch_events.dart';
import '../widgets/batch_card.dart';
import '../widgets/batch_form_dialog.dart';

class BatchListScreen extends ConsumerStatefulWidget {
  const BatchListScreen({super.key});

  @override
  ConsumerState<BatchListScreen> createState() => _BatchListScreenState();
}

class _BatchListScreenState extends ConsumerState<BatchListScreen> {
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
      final notifier = ref.read(batchProvider.notifier);
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
    ref.listen<BatchUiEvent?>(
      batchUiEventsProvider,
      (prev, next) {
        if (next == null) return;
        final snackbar = ref.read(snackbarServiceProvider);
        if (next is BatchFailure) {
          snackbar.showError(next.failure);
        } else if (next is BatchCreated) {
          snackbar.showSuccess(next.message);
        } else if (next is BatchUpdated) {
          snackbar.showSuccess(next.message);
        }
        ref.read(batchUiEventsProvider.notifier).clear();
      },
    );
    
    final asyncList = ref.watch(batchProvider);
    final notifier = ref.read(batchProvider.notifier);
    final canLoadMore = notifier.canLoadMore;

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.batches,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: search.AppSearchBar(
            hintText: 'Search by batch name...',
            onSearch: (query) => ref.read(batchProvider.notifier).search(query),
            onClear: () => ref.read(batchProvider.notifier).refresh(),
          ),
        ),
      ),
      body: asyncList.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (items) {
          if (items.isEmpty) {
            return Center(
              child: EmptyWidget(
                icon: Icons.inventory_2_outlined,
                title: l10n.noBatches,
                message: l10n.noBatchesMessage,
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(batchProvider.notifier).refresh(),
            color: BrandColors.primary,
            child: ListView.separated(
              controller: _scrollController,
              padding: const EdgeInsets.all(AppSizes.lg),
              itemCount: items.length + (canLoadMore ? 1 : 0),
              separatorBuilder: (context, index) {
                // Don't show divider before loading indicator
                if (index == items.length - 1 && canLoadMore) {
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
                if (index == items.length) {
                  return const Padding(
                    padding: EdgeInsets.all(AppSizes.lg),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                return BatchCard(batch: items[index]);
              },
            ),
          );
        },
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              app_err.ErrorsWidget(
                failure: error is Failure ? error : Failure.unexpectedError(error.toString()),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.read(batchProvider.notifier).refresh(),
                child: Text(l10n.retry),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () => _openCreateDialog(context),
      ),
    );
  }

  void _openCreateDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (context) => BatchFormDialog(
        title: l10n.createBatch,
        buttonText: l10n.create,
      ),
    );
  }
}

