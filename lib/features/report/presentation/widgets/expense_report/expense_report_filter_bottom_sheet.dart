import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../../../shared/components/forms/dropdown.dart';
import '../../../../expense_category/presentation/providers/expense_category_notifier.dart';
import '../../../../expense_category/domain/entities/expense_category.dart';

/// Filter data model for expense report
class ExpenseReportFilter {
  final int? categoryId;

  const ExpenseReportFilter({
    this.categoryId,
  });

  ExpenseReportFilter copyWith({
    int? categoryId,
  }) {
    return ExpenseReportFilter(
      categoryId: categoryId ?? this.categoryId,
    );
  }
}

/// Bottom sheet for filtering expense report
class ExpenseReportFilterBottomSheet extends ConsumerStatefulWidget {
  final ExpenseReportFilter initialFilter;
  final ValueChanged<ExpenseReportFilter> onApply;

  const ExpenseReportFilterBottomSheet({
    super.key,
    required this.initialFilter,
    required this.onApply,
  });

  @override
  ConsumerState<ExpenseReportFilterBottomSheet> createState() =>
      _ExpenseReportFilterBottomSheetState();
}

class _ExpenseReportFilterBottomSheetState
    extends ConsumerState<ExpenseReportFilterBottomSheet> {
  late ExpenseReportFilter _filter;

  @override
  void initState() {
    super.initState();
    _filter = widget.initialFilter;
  }

  void _clearFilters() {
    setState(() {
      _filter = const ExpenseReportFilter();
    });
  }

  void _applyFilters() {
    widget.onApply(_filter);
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  Widget _buildCategoryDropdown(List<ExpenseCategory> categories, AppLocalizations l10n) {
    final dropdownItems = categories
        .map((category) {
          final id = int.tryParse(category.id);
          if (id == null) return null;
          return DropdownItem<int?>(
            value: id,
            label: category.name,
          );
        })
        .whereType<DropdownItem<int?>>()
        .toList();

    return CustomDropdown<int?>(
      value: _filter.categoryId,
      items: [
        DropdownItem<int?>(value: null, label: l10n.allCategories),
        ...dropdownItems,
      ],
      onChanged: (value) {
        setState(() {
          _filter = _filter.copyWith(categoryId: value);
        });
      },
      label: l10n.category,
      hintText: l10n.selectCategory,
      required: false,
      searchable: true,
      searchHint: l10n.searchCategories,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final categories = ref.watch(expenseCategoryProvider).value ?? [];

    return Container(
      decoration: BoxDecoration(
        color: BrandColors.cardBackground,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppSizes.radiusLg),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Draggable handle
          Container(
            margin: const EdgeInsets.only(top: AppSizes.sm, bottom: AppSizes.sm),
            width: AppSizes.xxxxl,
            height: AppSizes.xs,
            decoration: BoxDecoration(
              color: BrandColors.divider,
              borderRadius: BorderRadius.circular(AppSizes.xxs),
            ),
          ),

          // Header
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.lg,
              vertical: AppSizes.md,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.filterExpenseReport,
                  style: context.title(bold: true),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                  iconSize: AppSizes.iconSize,
                  color: BrandColors.textSecondary,
                ),
              ],
            ),
          ),

          const Divider(height: 1),

          // Content
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSizes.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category Filter
                  _buildCategoryDropdown(categories, l10n),
                ],
              ),
            ),
          ),

          // Footer buttons
          Container(
            padding: const EdgeInsets.all(AppSizes.lg),
            decoration: BoxDecoration(
              color: BrandColors.cardBackground,
              border: Border(
                top: BorderSide(
                  color: BrandColors.divider,
                  width: AppSizes.br,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _clearFilters,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: AppSizes.md),
                      side: BorderSide(color: BrandColors.divider),
                    ),
                    child: Text(
                      l10n.clearAll,
                      style: context.body(bold: true),
                    ),
                  ),
                ),
                const SizedBox(width: AppSizes.md),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: _applyFilters,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: BrandColors.primary,
                      foregroundColor: BrandColors.textLight,
                      padding: const EdgeInsets.symmetric(vertical: AppSizes.md),
                    ),
                    child: Text(
                      l10n.applyFilters,
                      style: context.body(bold: true, color: BrandColors.textLight),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

