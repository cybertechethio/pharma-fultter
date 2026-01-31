import 'package:flutter/material.dart';

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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              // Draggable handle
              Container(
                margin: const EdgeInsets.only(top: 8, bottom: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: colorScheme.onSurface.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Advanced Filters',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                      tooltip: 'Close',
                    ),
                  ],
                ),
              ),

              const Divider(),

              // Content
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Sort Section
                      _buildSortSection(theme, colorScheme),

                      const SizedBox(height: 24),

                      // Categories Section
                      _buildCategoriesSection(theme, colorScheme),

                      const SizedBox(height: 24),

                      // Product Information Section
                      _buildProductInfoSection(theme, colorScheme),

                      const SizedBox(height: 24),

                      // Status Section
                      _buildStatusSection(theme, colorScheme),

                      const SizedBox(height: 24),

                      // Price Ranges Section
                      _buildPriceRangesSection(theme, colorScheme),

                      const SizedBox(height: 24),

                      // Attributes Section
                      _buildAttributesSection(theme, colorScheme),
                    ],
                  ),
                ),
              ),

              // Footer buttons
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  border: Border(
                    top: BorderSide(
                      color: colorScheme.outline.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _clearAllFilters,
                        child: const Text('Clear All'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _applyFilters,
                        child: const Text('Apply Filters'),
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

  Widget _buildSortSection(ThemeData theme, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sort:',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: _selectedSort,
          decoration: InputDecoration(
            hintText: 'Name (A-Z)',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            isDense: true,
          ),
          items: const [
            DropdownMenuItem(value: 'name_asc', child: Text('Name (A-Z)')),
            DropdownMenuItem(value: 'name_desc', child: Text('Name (Z-A)')),
            DropdownMenuItem(value: 'created_desc', child: Text('Created Date (Newest)')),
            DropdownMenuItem(value: 'created_asc', child: Text('Created Date (Oldest)')),
            DropdownMenuItem(value: 'unit_price_asc', child: Text('Unit Price (Low to High)')),
            DropdownMenuItem(value: 'unit_price_desc', child: Text('Unit Price (High to Low)')),
            DropdownMenuItem(value: 'cost_price_asc', child: Text('Cost Price (Low to High)')),
            DropdownMenuItem(value: 'cost_price_desc', child: Text('Cost Price (High to Low)')),
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

  Widget _buildCategoriesSection(ThemeData theme, ColorScheme colorScheme) {
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
              const SizedBox(width: 8),
              Text(
                'Categories',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        if (_categoriesExpanded) ...[
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: _selectedCategory,
            decoration: InputDecoration(
              labelText: 'Category',
              hintText: 'All Categories',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              isDense: true,
            ),
            items: const [
              DropdownMenuItem(value: 'all', child: Text('All Categories')),
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
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: _selectedSubCategory,
            decoration: InputDecoration(
              labelText: 'Sub Category',
              hintText: 'All Sub Categories',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              isDense: true,
            ),
            items: const [
              DropdownMenuItem(value: 'all', child: Text('All Sub Categories')),
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

  Widget _buildProductInfoSection(ThemeData theme, ColorScheme colorScheme) {
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
              const SizedBox(width: 8),
              Text(
                'Product Information',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        if (_productInfoExpanded) ...[
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: _selectedBrand,
            decoration: InputDecoration(
              labelText: 'Brand',
              hintText: 'All Brands',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              isDense: true,
            ),
            items: const [
              DropdownMenuItem(value: 'all', child: Text('All Brands')),
              // TODO: Load actual brands
            ],
            onChanged: (value) {
              setState(() {
                _selectedBrand = value;
              });
            },
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: _selectedUnit,
            decoration: InputDecoration(
              labelText: 'Unit',
              hintText: 'All Units',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              isDense: true,
            ),
            items: const [
              DropdownMenuItem(value: 'all', child: Text('All Units')),
              // TODO: Load actual units
            ],
            onChanged: (value) {
              setState(() {
                _selectedUnit = value;
              });
            },
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: _selectedModel,
            decoration: InputDecoration(
              labelText: 'Model',
              hintText: 'All Models',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              isDense: true,
            ),
            items: const [
              DropdownMenuItem(value: 'all', child: Text('All Models')),
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

  Widget _buildStatusSection(ThemeData theme, ColorScheme colorScheme) {
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
              const SizedBox(width: 8),
              Text(
                'Status',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        if (_statusExpanded) ...[
          const SizedBox(height: 12),
          Text(
            'Active Status',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: RadioListTile<bool>(
                  title: const Text('Active'),
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
                  title: const Text('Inactive'),
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
          const SizedBox(height: 16),
          Text(
            'Tax Status',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: RadioListTile<bool>(
                  title: const Text('Taxable'),
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
                  title: const Text('Non-taxable'),
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

  Widget _buildPriceRangesSection(ThemeData theme, ColorScheme colorScheme) {
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
              const SizedBox(width: 8),
              Text(
                'Price Ranges',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        if (_priceRangesExpanded) ...[
          const SizedBox(height: 12),
          Text(
            'Unit Price',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _unitPriceMinController,
                  decoration: InputDecoration(
                    labelText: 'Min',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    isDense: true,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  controller: _unitPriceMaxController,
                  decoration: InputDecoration(
                    labelText: 'Max',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    isDense: true,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Cost Price',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _costPriceMinController,
                  decoration: InputDecoration(
                    labelText: 'Min',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    isDense: true,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  controller: _costPriceMaxController,
                  decoration: InputDecoration(
                    labelText: 'Max',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    isDense: true,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Tax Rate',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _taxRateMinController,
                  decoration: InputDecoration(
                    labelText: 'Min',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    isDense: true,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  controller: _taxRateMaxController,
                  decoration: InputDecoration(
                    labelText: 'Max',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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

  Widget _buildAttributesSection(ThemeData theme, ColorScheme colorScheme) {
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
              const SizedBox(width: 8),
              Text(
                'Attributes',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        if (_attributesExpanded) ...[
          const SizedBox(height: 12),
          TextField(
            controller: _colorController,
            decoration: InputDecoration(
              labelText: 'Color',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              isDense: true,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _sizeController,
            decoration: InputDecoration(
              labelText: 'Size',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              isDense: true,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _materialController,
            decoration: InputDecoration(
              labelText: 'Material',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              isDense: true,
            ),
          ),
        ],
      ],
    );
  }
}

