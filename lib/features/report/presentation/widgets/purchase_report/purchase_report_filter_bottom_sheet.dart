import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../../../shared/components/forms/dropdown.dart';
import '../../../../supplier_customer/domain/entities/supplier_customer.dart';
import '../../../../supplier_customer/presentation/providers/supplier_customer_notifier.dart';
import '../../../../category/presentation/providers/category_notifier.dart';
import '../../../../category/domain/entities/category.dart';

/// Filter data model for purchase report
class PurchaseReportFilter {
  final int? supplierId;
  final int? categoryId;
  final String? status;
  final DateTime? startDate;
  final DateTime? endDate;

  const PurchaseReportFilter({
    this.supplierId,
    this.categoryId,
    this.status,
    this.startDate,
    this.endDate,
  });

  PurchaseReportFilter copyWith({
    int? supplierId,
    int? categoryId,
    String? status,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return PurchaseReportFilter(
      supplierId: supplierId ?? this.supplierId,
      categoryId: categoryId ?? this.categoryId,
      status: status ?? this.status,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }
}

/// Bottom sheet for filtering purchase report
class PurchaseReportFilterBottomSheet extends ConsumerStatefulWidget {
  final PurchaseReportFilter initialFilter;
  final ValueChanged<PurchaseReportFilter> onApply;

  const PurchaseReportFilterBottomSheet({
    super.key,
    required this.initialFilter,
    required this.onApply,
  });

  @override
  ConsumerState<PurchaseReportFilterBottomSheet> createState() =>
      _PurchaseReportFilterBottomSheetState();
}

class _PurchaseReportFilterBottomSheetState
    extends ConsumerState<PurchaseReportFilterBottomSheet> {
  late PurchaseReportFilter _filter;

  @override
  void initState() {
    super.initState();
    _filter = widget.initialFilter;
  }

  void _clearFilters() {
    setState(() {
      _filter = const PurchaseReportFilter();
    });
  }

  void _applyFilters() {
    widget.onApply(_filter);
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  Widget _buildSupplierDropdown(List<SupplierCustomer> suppliers, AppLocalizations l10n) {
    final dropdownItems = suppliers
        .map((supplier) {
          final id = int.tryParse(supplier.id);
          if (id == null) return null;
          return DropdownItem<int?>(
            value: id,
            label: supplier.name,
          );
        })
        .whereType<DropdownItem<int?>>()
        .toList();

    return CustomDropdown<int?>(
      value: _filter.supplierId,
      items: [
        const DropdownItem<int?>(value: null, label: 'All Suppliers'),
        ...dropdownItems,
      ],
      onChanged: (value) {
        setState(() {
          _filter = _filter.copyWith(supplierId: value);
        });
      },
      label: l10n.supplier,
      hintText: l10n.selectSupplier,
      required: false,
      searchable: true,
      searchHint: 'Search suppliers...',
    );
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
    final suppliers = ref.watch(
      supplierCustomerProvider(SupplierCustomerType.supplier),
    ).value ?? [];
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
                  l10n.filterPurchaseReport,
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
                  // Supplier Filter
                  _buildSupplierDropdown(suppliers, l10n),

                  const SizedBox(height: AppSizes.lg),

                  // Category Filter
                  _buildCategoryDropdown(categories, l10n),

                  const SizedBox(height: AppSizes.lg),

                  // Status Filter
                  CustomDropdown<String?>(
                    value: _filter.status,
                    items: const [
                      DropdownItem<String?>(value: null, label: 'All Status'),
                      DropdownItem<String?>(value: 'completed', label: 'Completed'),
                      DropdownItem<String?>(value: 'reversed', label: 'Reversed'),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _filter = _filter.copyWith(status: value);
                      });
                    },
                    label: l10n.status,
                    hintText: l10n.selectStatus,
                    required: false,
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

