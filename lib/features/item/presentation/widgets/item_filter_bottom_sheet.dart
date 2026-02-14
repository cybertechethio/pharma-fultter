import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';

/// Bottom sheet for filtering items
/// 
/// Displays various filter options including:
/// - Sort options
/// - Category filters
/// - Product information filters
/// - Status filters
/// - Price range filters
/// - Attribute filters
class ItemFilterBottomSheet extends StatefulWidget {
  const ItemFilterBottomSheet({super.key});

  @override
  State<ItemFilterBottomSheet> createState() => _ItemFilterBottomSheetState();
}

class _ItemFilterBottomSheetState extends State<ItemFilterBottomSheet> {
  // Sort state
  String? _selectedSort;

  // Category states
  String? _selectedCategory;
  String? _selectedSubCategory;

  // Product info states
  String? _selectedBrand;
  String? _selectedUnit;
  String? _selectedModel;

  // Status states
  bool? _isActive; // null = all, true = active, false = inactive
  bool? _isTaxable; // null = all, true = taxable, false = non-taxable

  // Price range states
  final TextEditingController _unitPriceMinController = TextEditingController();
  final TextEditingController _unitPriceMaxController = TextEditingController();
  final TextEditingController _costPriceMinController = TextEditingController();
  final TextEditingController _costPriceMaxController = TextEditingController();
  final TextEditingController _taxRateMinController = TextEditingController();
  final TextEditingController _taxRateMaxController = TextEditingController();

  // Attribute states
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();
  final TextEditingController _materialController = TextEditingController();

  // Section expansion states
  bool _categoriesExpanded = true;
  bool _productInfoExpanded = true;
  bool _statusExpanded = true;
  bool _priceRangesExpanded = true;
  bool _attributesExpanded = true;

  @override
  void dispose() {
    _unitPriceMinController.dispose();
    _unitPriceMaxController.dispose();
    _costPriceMinController.dispose();
    _costPriceMaxController.dispose();
    _taxRateMinController.dispose();
    _taxRateMaxController.dispose();
    _colorController.dispose();
    _sizeController.dispose();
    _materialController.dispose();
    super.dispose();
  }

  void _clearAllFilters() {
    setState(() {
      _selectedSort = null;
      _selectedCategory = null;
      _selectedSubCategory = null;
      _selectedBrand = null;
      _selectedUnit = null;
      _selectedModel = null;
      _isActive = null;
      _isTaxable = null;
      _unitPriceMinController.clear();
      _unitPriceMaxController.clear();
      _costPriceMinController.clear();
      _costPriceMaxController.clear();
      _taxRateMinController.clear();
      _taxRateMaxController.clear();
      _colorController.clear();
      _sizeController.clear();
      _materialController.clear();
    });
  }

  void _applyFilters() {
    // TODO: Apply filters logic
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: BrandColors.background,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(AppSizes.xl)),
          ),
          child: Column(
            children: [
              // Draggable handle
              Container(
                margin: const EdgeInsets.only(top: AppSizes.sm, bottom: AppSizes.sm),
                width: AppSizes.xxxxl,
                height: AppSizes.xxs,
                decoration: BoxDecoration(
                  color: BrandColors.textPrimary.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(AppSizes.xxs),
                ),
              ),

              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg, vertical: AppSizes.sm),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      l10n.advancedFilters,
                      style: context.subtitle(bold: true),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                      tooltip: l10n.close,
                    ),
                  ],
                ),
              ),

              const Divider(),

              // Content
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(AppSizes.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Sort Section
                      _buildSortSection(),

                      const SizedBox(height: AppSizes.xxl),

                      // Categories Section
                      _buildCategoriesSection(),

                      const SizedBox(height: AppSizes.xxl),

                      // Product Information Section
                      _buildProductInfoSection(),

                      const SizedBox(height: AppSizes.xxl),

                      // Status Section
                      _buildStatusSection(),

                      const SizedBox(height: AppSizes.xxl),

                      // Price Ranges Section
                      _buildPriceRangesSection(),

                      const SizedBox(height: AppSizes.xxl),

                      // Attributes Section
                      _buildAttributesSection(),
                    ],
                  ),
                ),
              ),

              // Footer buttons
              Container(
                padding: const EdgeInsets.all(AppSizes.lg),
                decoration: BoxDecoration(
                  color: BrandColors.background,
                  border: Border(
                    top: BorderSide(
                      color: BrandColors.outline.withValues(alpha: 0.2),
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _clearAllFilters,
                        child: Text(l10n.clearAll),
                      ),
                    ),
                    const SizedBox(width: AppSizes.lg),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _applyFilters,
                        child: Text(l10n.applyFilters),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSortSection() {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.sortLabel,
          style: context.subtitle(bold: true),
        ),
        const SizedBox(height: AppSizes.sm),
        DropdownButtonFormField<String>(
          value: _selectedSort,
          decoration: InputDecoration(
            hintText: l10n.nameAZ,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.radiusSm),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.sm),
            isDense: true,
          ),
          items: [
            DropdownMenuItem(value: 'name_asc', child: Text(l10n.nameAZ)),
            DropdownMenuItem(value: 'name_desc', child: Text(l10n.nameZA)),
            DropdownMenuItem(value: 'created_desc', child: Text(l10n.createdDateNewest)),
            DropdownMenuItem(value: 'created_asc', child: Text(l10n.createdDateOldest)),
            DropdownMenuItem(value: 'unit_price_asc', child: Text(l10n.unitPriceAsc)),
            DropdownMenuItem(value: 'unit_price_desc', child: Text(l10n.unitPriceDesc)),
            DropdownMenuItem(value: 'cost_price_asc', child: Text(l10n.costPriceAsc)),
            DropdownMenuItem(value: 'cost_price_desc', child: Text(l10n.costPriceDesc)),
          ],
          onChanged: (value) {
            setState(() {
              _selectedSort = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildCategoriesSection() {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _categoriesExpanded = !_categoriesExpanded;
            });
          },
          child: Row(
            children: [
              Icon(
                _categoriesExpanded ? Icons.expand_more : Icons.chevron_right,
                size: 20,
              ),
              const SizedBox(width: AppSizes.sm),
              Text(
                l10n.categories,
                style: context.subtitle(bold: true),
              ),
            ],
          ),
        ),
        if (_categoriesExpanded) ...[
          const SizedBox(height: AppSizes.md),
          DropdownButtonFormField<String>(
            value: _selectedCategory,
            decoration: InputDecoration(
              labelText: l10n.category,
              hintText: l10n.allCategories,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.radiusSm),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.sm),
              isDense: true,
            ),
            items: [
              DropdownMenuItem(value: 'all', child: Text(l10n.allCategories)),
              // TODO: Load actual categories
            ],
            onChanged: (value) {
              setState(() {
                _selectedCategory = value;
                if (value != 'all') {
                  _selectedSubCategory = null; // Reset sub category
                }
              });
            },
          ),
          const SizedBox(height: AppSizes.md),
          DropdownButtonFormField<String>(
            value: _selectedSubCategory,
            decoration: InputDecoration(
              labelText: l10n.subCategory,
              hintText: l10n.allSubCategories,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.radiusSm),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.sm),
              isDense: true,
            ),
            items: [
              DropdownMenuItem(value: 'all', child: Text(l10n.allSubCategories)),
              // TODO: Load actual sub categories based on selected category
            ],
            onChanged: _selectedCategory == null || _selectedCategory == 'all'
                ? null
                : (value) {
                    setState(() {
                      _selectedSubCategory = value;
                    });
                  },
          ),
        ],
      ],
    );
  }

  Widget _buildProductInfoSection() {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _productInfoExpanded = !_productInfoExpanded;
            });
          },
          child: Row(
            children: [
              Icon(
                _productInfoExpanded ? Icons.expand_more : Icons.chevron_right,
                size: 20,
              ),
              const SizedBox(width: AppSizes.sm),
              Text(
                l10n.productInformation,
                style: context.subtitle(bold: true),
              ),
            ],
          ),
        ),
        if (_productInfoExpanded) ...[
          const SizedBox(height: AppSizes.md),
          DropdownButtonFormField<String>(
            value: _selectedBrand,
            decoration: InputDecoration(
              labelText: l10n.brand,
              hintText: l10n.allBrands,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.radiusSm),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.sm),
              isDense: true,
            ),
            items: [
              DropdownMenuItem(value: 'all', child: Text(l10n.allBrands)),
              // TODO: Load actual brands
            ],
            onChanged: (value) {
              setState(() {
                _selectedBrand = value;
              });
            },
          ),
          const SizedBox(height: AppSizes.md),
          DropdownButtonFormField<String>(
            value: _selectedUnit,
            decoration: InputDecoration(
              labelText: l10n.unit,
              hintText: l10n.allUnits,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.radiusSm),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.sm),
              isDense: true,
            ),
            items: [
              DropdownMenuItem(value: 'all', child: Text(l10n.allUnits)),
              // TODO: Load actual units
            ],
            onChanged: (value) {
              setState(() {
                _selectedUnit = value;
              });
            },
          ),
          const SizedBox(height: AppSizes.md),
          DropdownButtonFormField<String>(
            value: _selectedModel,
            decoration: InputDecoration(
              labelText: l10n.model,
              hintText: l10n.allModels,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.radiusSm),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.sm),
              isDense: true,
            ),
            items: [
              DropdownMenuItem(value: 'all', child: Text(l10n.allModels)),
              // TODO: Load actual models
            ],
            onChanged: (value) {
              setState(() {
                _selectedModel = value;
              });
            },
          ),
        ],
      ],
    );
  }

  Widget _buildStatusSection() {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _statusExpanded = !_statusExpanded;
            });
          },
          child: Row(
            children: [
              Icon(
                _statusExpanded ? Icons.expand_more : Icons.chevron_right,
                size: 20,
              ),
              const SizedBox(width: AppSizes.sm),
              Text(
                l10n.status,
                style: context.subtitle(bold: true),
              ),
            ],
          ),
        ),
        if (_statusExpanded) ...[
          const SizedBox(height: AppSizes.md),
          Text(
            l10n.activeStatus,
style: context.body(bold: true),
          ),
          const SizedBox(height: AppSizes.sm),
          Row(
            children: [
              Expanded(
                child: RadioListTile<bool>(
                  title: Text(l10n.active),
                  value: true,
                  groupValue: _isActive,
                  onChanged: (value) {
                    setState(() {
                      _isActive = value;
                    });
                  },
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                ),
              ),
              Expanded(
                child: RadioListTile<bool>(
                  title: Text(l10n.inactive),
                  value: false,
                  groupValue: _isActive,
                  onChanged: (value) {
                    setState(() {
                      _isActive = value;
                    });
                  },
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.lg),
          Text(
            l10n.taxStatus,
style: context.body(bold: true),
          ),
          const SizedBox(height: AppSizes.sm),
          Row(
            children: [
              Expanded(
                child: RadioListTile<bool>(
                  title: Text(l10n.taxable),
                  value: true,
                  groupValue: _isTaxable,
                  onChanged: (value) {
                    setState(() {
                      _isTaxable = value;
                    });
                  },
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                ),
              ),
              Expanded(
                child: RadioListTile<bool>(
                  title: Text(l10n.nonTaxable),
                  value: false,
                  groupValue: _isTaxable,
                  onChanged: (value) {
                    setState(() {
                      _isTaxable = value;
                    });
                  },
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildPriceRangesSection() {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _priceRangesExpanded = !_priceRangesExpanded;
            });
          },
          child: Row(
            children: [
              Icon(
                _priceRangesExpanded ? Icons.expand_more : Icons.chevron_right,
                size: 20,
              ),
              const SizedBox(width: AppSizes.sm),
              Text(
                l10n.priceRanges,
                style: context.subtitle(bold: true),
              ),
            ],
          ),
        ),
        if (_priceRangesExpanded) ...[
          const SizedBox(height: AppSizes.md),
          Text(
            l10n.unitPrice,
style: context.body(bold: true),
          ),
          const SizedBox(height: AppSizes.sm),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _unitPriceMinController,
                  decoration: InputDecoration(
                    labelText: l10n.min,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.sm),
                    isDense: true,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: AppSizes.md),
              Expanded(
                child: TextField(
                  controller: _unitPriceMaxController,
                  decoration: InputDecoration(
                    labelText: l10n.max,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.sm),
                    isDense: true,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.lg),
          Text(
            l10n.costPrice,
style: context.body(bold: true),
          ),
          const SizedBox(height: AppSizes.sm),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _costPriceMinController,
                  decoration: InputDecoration(
                    labelText: l10n.min,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.sm),
                    isDense: true,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: AppSizes.md),
              Expanded(
                child: TextField(
                  controller: _costPriceMaxController,
                  decoration: InputDecoration(
                    labelText: l10n.max,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.sm),
                    isDense: true,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.lg),
          Text(
            l10n.taxRate,
style: context.body(bold: true),
          ),
          const SizedBox(height: AppSizes.sm),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _taxRateMinController,
                  decoration: InputDecoration(
                    labelText: l10n.min,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.sm),
                    isDense: true,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: AppSizes.md),
              Expanded(
                child: TextField(
                  controller: _taxRateMaxController,
                  decoration: InputDecoration(
                    labelText: l10n.max,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.sm),
                    isDense: true,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildAttributesSection() {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _attributesExpanded = !_attributesExpanded;
            });
          },
          child: Row(
            children: [
              Icon(
                _attributesExpanded ? Icons.expand_more : Icons.chevron_right,
                size: 20,
              ),
              const SizedBox(width: AppSizes.sm),
              Text(
                l10n.attributes,
                style: context.subtitle(bold: true),
              ),
            ],
          ),
        ),
        if (_attributesExpanded) ...[
          const SizedBox(height: AppSizes.md),
          TextField(
            controller: _colorController,
            decoration: InputDecoration(
              labelText: l10n.color,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.radiusSm),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.sm),
              isDense: true,
            ),
          ),
          const SizedBox(height: AppSizes.md),
          TextField(
            controller: _sizeController,
            decoration: InputDecoration(
              labelText: l10n.size,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.radiusSm),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.sm),
              isDense: true,
            ),
          ),
          const SizedBox(height: AppSizes.md),
          TextField(
            controller: _materialController,
            decoration: InputDecoration(
              labelText: l10n.material,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.radiusSm),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.sm),
              isDense: true,
            ),
          ),
        ],
      ],
    );
  }
}

