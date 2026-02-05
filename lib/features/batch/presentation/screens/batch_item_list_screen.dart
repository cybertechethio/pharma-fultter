import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/common/error_widget.dart' as app_err;
import '../../../../shared/components/common/empty_widget.dart';
import '../../../../shared/components/forms/search_bar.dart' as search;
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../item/presentation/providers/item_notifier.dart';
import '../../../item/presentation/widgets/category_dropdown.dart';
import '../widgets/batch_item_card.dart';
// import '../widgets/item_filter_bottom_sheet.dart'; // Kept for future use

class BatchItemListScreen extends ConsumerStatefulWidget {
  const BatchItemListScreen({super.key});

  @override
  ConsumerState<BatchItemListScreen> createState() => _BatchItemListScreenState();
}

class _BatchItemListScreenState extends ConsumerState<BatchItemListScreen> {
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
      final notifier = ref.read(itemProvider.notifier);
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
    
    final asyncList = ref.watch(itemProvider);
    final notifier = ref.read(itemProvider.notifier);
    final canLoadMore = notifier.canLoadMore;

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.items,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(AppSizes.searchBarHeight),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
            child: Row(
              children: [
                Expanded(
                  child: search.AppSearchBar(
                    hintText: l10n.searchByNameCodeSku,
                    onSearch: (query) => ref.read(itemProvider.notifier).search(query),
                    onClear: () => ref.read(itemProvider.notifier).refresh(),
                    padding: const EdgeInsets.all(AppSizes.sm),
                  ),
                ),
                const SizedBox(width: AppSizes.sm),
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () => _showCategoryFilterDialog(context),
                  tooltip: l10n.filterItems,
                ),
              ],
            ),
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
                title: l10n.noItems,
                message: l10n.noItemsMessage,
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(itemProvider.notifier).refresh(),
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

                return BatchItemCard(item: items[index]);
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
              const SizedBox(height: AppSizes.lg),
              ElevatedButton(
                onPressed: () => ref.read(itemProvider.notifier).refresh(),
                child: Text(l10n.retry),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCategoryFilterDialog(BuildContext context) async {
    final selectedCategoryId = await showDialog<int>(
      context: context,
      builder: (dialogContext) => const CategorySelectionDialog(),
    );

    // Apply category filter (null means clear filter)
    if (selectedCategoryId != null || selectedCategoryId == null) {
      ref.read(itemProvider.notifier).filterByCategory(selectedCategoryId);
    }
  }
}

