import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../expense_category/domain/entities/expense_category.dart';
import '../../../expense_category/presentation/providers/expense_category_notifier.dart';

/// Expense Category selection dialog with search functionality
class ExpenseCategorySelectionDialog extends ConsumerStatefulWidget {
  final String? selectedCategoryId;

  const ExpenseCategorySelectionDialog({
    super.key,
    this.selectedCategoryId,
  });

  @override
  ConsumerState<ExpenseCategorySelectionDialog> createState() => _ExpenseCategorySelectionDialogState();
}

class _ExpenseCategorySelectionDialogState extends ConsumerState<ExpenseCategorySelectionDialog> {
  final TextEditingController _searchController = TextEditingController();
  List<ExpenseCategory> _filteredCategories = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterCategories);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterCategories() {
    final categoriesAsync = ref.read(expenseCategoryProvider);
    categoriesAsync.whenData((categories) {
      final query = _searchController.text.toLowerCase().trim();

      setState(() {
        if (query.isEmpty) {
          _filteredCategories = categories;
        } else {
          _filteredCategories = categories
              .where((category) => category.name.toLowerCase().contains(query))
              .toList();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final categoriesAsync = ref.watch(expenseCategoryProvider);

    // Initialize filtered list
    if (_filteredCategories.isEmpty && categoriesAsync.hasValue) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _filterCategories();
        }
      });
    }

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400, maxHeight: 600),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(AppSizes.lg),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    l10n.expenseCategories,
                    style: context.subtitle(bold: true),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                    tooltip: l10n.cancel,
                  ),
                ],
              ),
            ),

            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: l10n.searchExpenseCategories,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSizes.radius),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: AppSizes.lg, vertical: AppSizes.md),
                ),
              ),
            ),

            const SizedBox(height: AppSizes.sm),

            // Categories list
            Expanded(
              child: categoriesAsync.when(
                loading: () => const Center(
                  child: Padding(
                    padding: EdgeInsets.all(AppSizes.lg),
                    child: CircularProgressIndicator(),
                  ),
                ),
                error: (error, stackTrace) => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSizes.xxxl),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: AppSizes.xxxxl + AppSizes.lg,
                          color: BrandColors.error,
                        ),
                        const SizedBox(height: AppSizes.lg),
                        Text(
                          l10n.failedToLoadExpenseCategories,
                          style: context.body(color: BrandColors.error),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                data: (categories) => _filteredCategories.isEmpty && _searchController.text.isNotEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(AppSizes.xxxl),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.search_off,
                                size: AppSizes.xxxxl + AppSizes.lg,
                                color: BrandColors.textPrimary.withOpacity(0.3),
                              ),
                              const SizedBox(height: AppSizes.lg),
                              Text(
                                l10n.noExpenseCategoriesMatchSearch,
                                style: context.body(color: BrandColors.textPrimary.withOpacity(0.6)),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: _filteredCategories.length + 1, // +1 for "All Categories" option
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            // "All Categories" option
                            return ListTile(
                              title: Text(l10n.allCategories),
                              subtitle: Text(l10n.showExpensesFromAllCategories),
                              onTap: () => Navigator.of(context).pop(null),
                            );
                          }

                          final category = _filteredCategories[index - 1];
                          final isSelected = widget.selectedCategoryId == category.id;

                          return ListTile(
                            title: Text(category.name),
                            subtitle: Text(category.description),
                            selected: isSelected,
                            selectedTileColor: BrandColors.primaryBackgroundLight.withOpacity(0.3),
                            onTap: () => Navigator.of(context).pop(category.id),
                            trailing: isSelected
                                ? Icon(
                                    Icons.check_circle,
                                    color: BrandColors.primary,
                                  )
                                : null,
                          );
                        },
                      ),
              ),
            ),

            // Clear selection button
            if (widget.selectedCategoryId != null)
              Padding(
                padding: const EdgeInsets.all(AppSizes.lg),
                child: OutlinedButton.icon(
                  onPressed: () => Navigator.of(context).pop(null),
                  icon: const Icon(Icons.clear),
                  label: Text(l10n.clearSelection),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
