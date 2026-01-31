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
import '../../../../shared/components/common/fab_button.dart';
import '../../../../shared/components/forms/search_bar.dart' as search;
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../providers/expense_notifier.dart';
import '../providers/expense_events.dart';
import '../widgets/expense_card.dart';
import '../widgets/expense_category_dropdown.dart' show ExpenseCategorySelectionDialog;

class ExpenseListScreen extends ConsumerStatefulWidget {
  const ExpenseListScreen({super.key});

  @override
  ConsumerState<ExpenseListScreen> createState() => _ExpenseListScreenState();
}

class _ExpenseListScreenState extends ConsumerState<ExpenseListScreen> {
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
      final notifier = ref.read(expenseProvider.notifier);
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
    ref.listen<ExpenseUiEvent?>(
      expenseUiEventsProvider,
      (prev, next) {
        if (next == null) return;
        final snackbar = ref.read(snackbarServiceProvider);
        if (next is ExpenseFailure) {
          snackbar.showError(next.failure);
        } else if (next is ExpenseCreated) {
          snackbar.showSuccess(next.message);
        } else if (next is ExpenseUpdated) {
          snackbar.showSuccess(next.message);
        } else if (next is ExpenseDeleted) {
          snackbar.showSuccess(next.message);
        }
        ref.read(expenseUiEventsProvider.notifier).clear();
      },
    );

    final asyncList = ref.watch(expenseProvider);
    final notifier = ref.read(expenseProvider.notifier);
    final canLoadMore = notifier.canLoadMore;

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.expenses,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: search.AppSearchBar(
                    hintText: 'Search by name...',
                    onSearch: (query) => ref.read(expenseProvider.notifier).search(search: query),
                    onClear: () => ref.read(expenseProvider.notifier).refresh(),
                    padding: const EdgeInsets.all(8.0),
                  ),
                ),
                const SizedBox(width: 8.0),
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () => _showCategoryFilterDialog(context),
                  tooltip: 'Filter expenses',
                ),
              ],
            ),
          ),
        ),
      ),
      body: asyncList.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (expenses) {
          if (expenses.isEmpty) {
            return Center(
              child: EmptyWidget(
                icon: Icons.attach_money_rounded,
                title: l10n.noExpenses,
                message: l10n.noExpensesMessage,
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () => ref.read(expenseProvider.notifier).refresh(),
            color: BrandColors.primary,
            child: ListView.separated(
              controller: _scrollController,
              padding: const EdgeInsets.all(AppSizes.lg),
              itemCount: expenses.length + (canLoadMore ? 1 : 0),
              separatorBuilder: (context, index) {
                // Don't show divider before loading indicator
                if (index == expenses.length - 1 && canLoadMore) {
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
                if (index == expenses.length) {
                  return const Padding(
                    padding: EdgeInsets.all(AppSizes.lg),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                return ExpenseCard(expense: expenses[index]);
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
                onPressed: () => ref.read(expenseProvider.notifier).refresh(),
                child: Text(l10n.retry),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () => _openCreateExpense(context),
      ),
    );
  }

  void _openCreateExpense(BuildContext context) {
    context.push(RouteName.expenseForm);
  }

  void _showCategoryFilterDialog(BuildContext context) async {
    final selectedCategoryId = await showDialog<String>(
      context: context,
      builder: (dialogContext) => const ExpenseCategorySelectionDialog(),
    );

    // Apply category filter (null means clear filter)
    ref.read(expenseProvider.notifier).search(categoryId: selectedCategoryId);
  }
}
