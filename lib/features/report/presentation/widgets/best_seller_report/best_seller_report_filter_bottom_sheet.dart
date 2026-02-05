import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../../../shared/components/forms/dropdown.dart';
import '../../../../category/presentation/providers/category_notifier.dart';
import '../../../../category/domain/entities/category.dart';

/// Filter data model for best seller report
class BestSellerReportFilter {
  final int? categoryId;
  final int? limit;

  const BestSellerReportFilter({
    this.categoryId,
    this.limit,
  });

  BestSellerReportFilter copyWith({
    int? categoryId,
    int? limit,
  }) {
    return BestSellerReportFilter(
      categoryId: categoryId ?? this.categoryId,
      limit: limit ?? this.limit,
    );
  }
}

/// Bottom sheet for filtering best seller report
class BestSellerReportFilterBottomSheet extends ConsumerStatefulWidget {
  final BestSellerReportFilter initialFilter;
  final ValueChanged<BestSellerReportFilter> onApply;

  const BestSellerReportFilterBottomSheet({
    super.key,
    required this.initialFilter,
    required this.onApply,
  });

  @override
  ConsumerState<BestSellerReportFilterBottomSheet> createState() =>
      _BestSellerReportFilterBottomSheetState();
}

class _BestSellerReportFilterBottomSheetState
    extends ConsumerState<BestSellerReportFilterBottomSheet> {
  late BestSellerReportFilter _filter;
  final TextEditingController _limitController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filter = widget.initialFilter;
    _limitController.text = _filter.limit?.toString() ?? '';
  }

  @override
  void dispose() {
    _limitController.dispose();
    super.dispose();
  }

  void _clearFilters() {
    setState(() {
      _filter = const BestSellerReportFilter();
      _limitController.clear();
    });
  }

  void _applyFilters() {
    final limit = _limitController.text.trim().isEmpty
        ? null
        : int.tryParse(_limitController.text.trim());
    
    widget.onApply(_filter.copyWith(limit: limit));
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  Widget _buildCategoryDropdown(List<Category> categories, AppLocalizations l10n) {
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
    final categories = ref.watch(categoryProvider).value ?? [];

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
                  l10n.filterBestSellerReport,
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

                  const SizedBox(height: AppSizes.lg),

                  // Limit Field
                  TextField(
                    controller: _limitController,
                    decoration: InputDecoration(
                      labelText: l10n.limit,
                      hintText: l10n.enterLimit,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                      ),
                      filled: true,
                      fillColor: BrandColors.cardBackground,
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
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

