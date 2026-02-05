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
import '../providers/sub_category_notifier.dart';
import '../providers/sub_category_events.dart';
import '../widgets/sub_category_card.dart';
import '../widgets/sub_category_form_dialog.dart';

class SubCategoryListScreen extends ConsumerStatefulWidget {
  final String? categoryId;
  
  const SubCategoryListScreen({
    super.key,
    this.categoryId,
  });

  @override
  ConsumerState<SubCategoryListScreen> createState() => _SubCategoryListScreenState();
}

class _SubCategoryListScreenState extends ConsumerState<SubCategoryListScreen> {
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
      final notifier = ref.read(subCategoryProvider(widget.categoryId).notifier);
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
    
    // Listen to UI events
    ref.listen<SubCategoryUiEvent?>(
      subCategoryUiEventsProvider,
      (prev, next) {
        if (next == null) return;
        final snackbar = ref.read(snackbarServiceProvider);
        if (next is SubCategoryFailure) {
          snackbar.showError(next.failure);
        } else if (next is SubCategoryCreated) {
          snackbar.showSuccess(next.message);
        } else if (next is SubCategoryUpdated) {
          snackbar.showSuccess(next.message);
        } else if (next is SubCategoryDeleted) {
          snackbar.showSuccess(next.message);
        }
        ref.read(subCategoryUiEventsProvider.notifier).clear();
      },
    );
    
    // Use parameterized provider - each categoryId gets its own state instance
    // This prevents showing wrong data when navigating between views
    final asyncList = ref.watch(subCategoryProvider(widget.categoryId));
    final notifier = ref.read(subCategoryProvider(widget.categoryId).notifier);
    final canLoadMore = notifier.canLoadMore;

    return Scaffold(
      appBar: CustomAppBar(
        title: widget.categoryId != null ? l10n.subCategories : l10n.allSubCategories,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: search.AppSearchBar(
            hintText: l10n.searchByName,
            onSearch: (query) => ref.read(subCategoryProvider(widget.categoryId).notifier).search(query),
            onClear: () => ref.read(subCategoryProvider(widget.categoryId).notifier).refresh(),
          ),
        ),
      ),
      body: asyncList.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (items) {
          if (items.isEmpty) {
            return Center(
              child: EmptyWidget(
                icon: Icons.category_outlined,
                title: l10n.noSubCategories,
                message: widget.categoryId != null
                    ? l10n.noSubCategoriesInCategoryMessage
                    : l10n.noSubCategoriesMessage,
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () {
              return ref.read(subCategoryProvider(widget.categoryId).notifier).refresh();
            },
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

                return SubCategoryCard(
                  item: items[index],
                  categoryId: widget.categoryId,
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
                failure: error is Failure ? error : Failure.unexpectedError(error.toString()),
              ),
              const SizedBox(height: AppSizes.lg),
              ElevatedButton(
                onPressed: () {
                  ref.read(subCategoryProvider(widget.categoryId).notifier).refresh();
                },
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
    showDialog(
      context: context,
      builder: (context) {
        final l10n = AppLocalizations.of(context);
        return SubCategoryFormDialog(
          title: l10n.createSubCategory,
          buttonText: 'Create',
          categoryId: widget.categoryId != null ? int.tryParse(widget.categoryId!) : null,
          currentViewCategoryId: widget.categoryId, // Pass the current view's categoryId for provider updates
        );
      },
    );
  }
}
