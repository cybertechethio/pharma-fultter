import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/forms/custom_text_field.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../shared/components/forms/dropdown.dart';
import '../../../../shared/components/forms/custom_button.dart';
import '../../../../shared/components/common/error_widget.dart' as app_err;
import '../../../../core/errors/failure.dart';
import '../../domain/entities/item.dart';
import '../../../category/presentation/providers/category_notifier.dart';
import '../../../sub_category/presentation/providers/sub_category_notifier.dart';
import '../../../brand/presentation/providers/brand_notifier.dart';
import '../../../unit/presentation/providers/unit_notifier.dart';
import '../../../model/presentation/providers/model_notifier.dart';
import '../providers/item_notifier.dart';
import '../providers/item_loading_providers.dart';
import '../providers/item_events.dart';

class ItemUpdateScreen extends ConsumerStatefulWidget {
  final Item item;

  const ItemUpdateScreen({
    super.key,
    required this.item,
  });

  @override
  ConsumerState<ItemUpdateScreen> createState() => _ItemUpdateScreenState();
}

class _ItemUpdateScreenState extends ConsumerState<ItemUpdateScreen> {
  final _formKey = GlobalKey<FormState>();
  
  // Controllers - initialized with item data
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _skuController;
  late final TextEditingController _codeController;
  late final TextEditingController _barcodeController;
  late final TextEditingController _colorController;
  late final TextEditingController _sizeController;
  late final TextEditingController _materialController;
  late final TextEditingController _weightController;
  late final TextEditingController _taxRateController;

  // State variables - initialized with item data
  late int? _selectedCategoryId;
  late int? _selectedSubCategoryId;
  late int? _selectedBrandId;
  late int? _selectedUnitId;
  late int? _selectedModelId;
  late bool _isTaxable;
  late bool _isActive;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with item data
    _nameController = TextEditingController(text: widget.item.name);
    _descriptionController = TextEditingController(text: widget.item.description ?? '');
    _skuController = TextEditingController(text: widget.item.sku ?? '');
    _codeController = TextEditingController(text: widget.item.code);
    _barcodeController = TextEditingController(text: widget.item.barcode ?? '');
    _colorController = TextEditingController(text: widget.item.color ?? '');
    _sizeController = TextEditingController(text: widget.item.size ?? '');
    _materialController = TextEditingController(text: widget.item.material ?? '');
    _weightController = TextEditingController(text: widget.item.weight.toString());
    _taxRateController = TextEditingController(text: widget.item.taxRate.toString());

    // Initialize state variables with item data
    _selectedCategoryId = widget.item.categoryId;
    _selectedSubCategoryId = widget.item.subCategoryId;
    _selectedBrandId = widget.item.brandId;
    _selectedUnitId = widget.item.unitId;
    _selectedModelId = widget.item.modelId;
    _isTaxable = widget.item.isTaxable;
    _isActive = widget.item.isActive;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _skuController.dispose();
    _codeController.dispose();
    _barcodeController.dispose();
    _colorController.dispose();
    _sizeController.dispose();
    _materialController.dispose();
    _weightController.dispose();
    _taxRateController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    final updating = ref.read(itemUpdateLoadingProvider).contains(widget.item.id);
    if (updating) return;

    final weight = double.tryParse(_weightController.text.trim());
    if (weight == null || weight <= 0) {
      return;
    }

    final taxRate = _isTaxable 
        ? (int.tryParse(_taxRateController.text.trim()) ?? 0)
        : 0;

    await ref.read(itemProvider.notifier).updateItem(
      id: widget.item.id,
      name: _nameController.text.trim(),
      description: _descriptionController.text.trim(),
      sku: _skuController.text.trim(),
      code: _codeController.text.trim(),
      barcode: _barcodeController.text.trim(),
      color: _colorController.text.trim(),
      size: _sizeController.text.trim(),
      material: _materialController.text.trim(),
      weight: weight,
      isTaxable: _isTaxable,
      taxRate: taxRate,
      isActive: _isActive,
      imageUrl: widget.item.imageUrl,
      categoryId: _selectedCategoryId,
      subCategoryId: _selectedSubCategoryId,
      brandId: _selectedBrandId,
      unitId: _selectedUnitId,
      modelId: _selectedModelId,
    );
  }

  @override
  Widget build(BuildContext context) {
    final updating = ref.watch(itemUpdateLoadingProvider).contains(widget.item.id);

    // Listen to events
    ref.listen<ItemUiEvent?>(
      itemUiEventsProvider,
      (prev, next) {
        if (next == null) return;
        if (next is ItemUpdated) {
          if (mounted) {
            context.pop();
          }
        }
        ref.read(itemUiEventsProvider.notifier).clear();
      },
    );

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Update Item',
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Basic Information Section
              _buildSection(
                context,
                title: 'Basic Information',
                children: [
                  CustomTextField(
                    labelText: 'Name *',
                    controller: _nameController,
                    prefixIcon: Icons.label_outline,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Name is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Description *',
                      prefixIcon: const Icon(Icons.description_outlined),
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                    ),
                    maxLines: 3,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Description is required';
                      }
                      return null;
                    },
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Identification Section
              _buildSection(
                context,
                title: 'Identification',
                children: [
                  CustomTextField(
                    labelText: 'SKU *',
                    controller: _skuController,
                    prefixIcon: Icons.qr_code_outlined,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'SKU is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    labelText: 'Code *',
                    controller: _codeController,
                    prefixIcon: Icons.tag_outlined,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Code is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    labelText: 'Barcode *',
                    controller: _barcodeController,
                    prefixIcon: Icons.barcode_reader,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Barcode is required';
                      }
                      return null;
                    },
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Product Details Section
              _buildSection(
                context,
                title: 'Product Details',
                children: [
                  CustomTextField(
                    labelText: 'Color *',
                    controller: _colorController,
                    prefixIcon: Icons.palette_outlined,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Color is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    labelText: 'Size *',
                    controller: _sizeController,
                    prefixIcon: Icons.straighten_outlined,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Size is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    labelText: 'Material *',
                    controller: _materialController,
                    prefixIcon: Icons.texture_outlined,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Material is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    labelText: 'Weight (kg) *',
                    controller: _weightController,
                    prefixIcon: Icons.scale_outlined,
                    inputType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Weight is required';
                      }
                      final weight = double.tryParse(value);
                      if (weight == null || weight <= 0) {
                        return 'Weight must be a positive number';
                      }
                      return null;
                    },
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Relationships Section
              _buildSection(
                context,
                title: 'Relationships',
                children: [
                  // Category Dropdown
                  _buildCategoryDropdown(),
                  const SizedBox(height: 12),
                  // Sub-Category Dropdown
                  _buildSubCategoryDropdown(),
                  const SizedBox(height: 12),
                  // Brand Dropdown
                  _buildBrandDropdown(),
                  const SizedBox(height: 12),
                  // Unit Dropdown
                  _buildUnitDropdown(),
                  const SizedBox(height: 12),
                  // Model Dropdown
                  _buildModelDropdown(),
                ],
              ),

              const SizedBox(height: 12),

              // Tax & Status Section
              _buildSection(
                context,
                title: 'Tax & Status',
                children: [
                  SwitchListTile(
                    title: const Text('Is Taxable'),
                    value: _isTaxable,
                    onChanged: (value) {
                      setState(() {
                        _isTaxable = value;
                        if (!value) {
                          _taxRateController.text = '0';
                        }
                      });
                    },
                    contentPadding: EdgeInsets.zero,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _taxRateController,
                    enabled: _isTaxable,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Tax Rate',
                      prefixIcon: const Icon(Icons.percent_outlined),
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                    ),
                    validator: _isTaxable
                        ? (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Tax rate is required';
                            }
                            final rate = int.tryParse(value);
                            if (rate == null || rate < 0 || rate > 100) {
                              return 'Tax rate must be between 0 and 100';
                            }
                            return null;
                          }
                        : null,
                  ),
                  const SizedBox(height: 12),
                  SwitchListTile(
                    title: const Text('Is Active'),
                    value: _isActive,
                    onChanged: (value) {
                      setState(() {
                        _isActive = value;
                      });
                    },
                    contentPadding: EdgeInsets.zero,
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Submit Button
              CustomButton(
                text: 'Update Item',
                isLoading: updating,
                loadingText: 'Updating...',
                onPressed: _handleSubmit,
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    final theme = Theme.of(context);

    return Card(
      elevation: 1,
      color: BrandColors.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryDropdown() {
    final categoriesAsync = ref.watch(categoryProvider);

    return categoriesAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => app_err.ErrorsWidget(
        failure: error is Failure
            ? error
            : Failure.unexpectedError(error.toString()),
      ),
      data: (categories) {
        if (categories.isEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Category',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 18,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'No categories available',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        return CustomDropdown<int>(
          value: _selectedCategoryId,
          items: [
            DropdownItem(value: -1, label: 'None'),
            ...categories.map(
              (c) => DropdownItem(
                value: int.parse(c.id),
                label: c.name,
              ),
            ),
          ],
          onChanged: (value) {
            setState(() {
              _selectedCategoryId = value == -1 ? null : value;
              _selectedSubCategoryId = null; // Clear sub-category when category changes
            });
          },
          label: 'Category',
          hintText: 'Select Category',
        );
      },
    );
  }

  Widget _buildSubCategoryDropdown() {
    final subCategoriesAsync = ref.watch(
      subCategoryProvider(_selectedCategoryId?.toString()),
    );

    return subCategoriesAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => app_err.ErrorsWidget(
        failure: error is Failure
            ? error
            : Failure.unexpectedError(error.toString()),
      ),
      data: (subCategories) {
        if (_selectedCategoryId == null) 
        
        {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sub-Category',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 18,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Select category first',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        if (subCategories.isEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sub-Category',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 18,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'No sub-categories available',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        return CustomDropdown<int>(
          value: _selectedSubCategoryId,
          items: [
            DropdownItem(value: -1, label: 'None'),
            ...subCategories.map(
              (sc) => DropdownItem(
                value: int.parse(sc.id),
                label: sc.name,
              ),
            ),
          ],
          onChanged: (value) {
            setState(() {
              _selectedSubCategoryId = value == -1 ? null : value;
            });
          },
          label: 'Sub-Category',
          hintText: 'Select Sub-Category',
        );
      },
    );
  }

  Widget _buildBrandDropdown() {
    final brandsAsync = ref.watch(brandProvider);

    return brandsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => app_err.ErrorsWidget(
        failure: error is Failure
            ? error
            : Failure.unexpectedError(error.toString()),
      ),
      data: (brands) {
        if (brands.isEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Brand',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 18,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'No brands available',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        return CustomDropdown<int>(
          value: _selectedBrandId,
          items: [
            DropdownItem(value: -1, label: 'None'),
            ...brands.map(
              (b) => DropdownItem(
                value: int.parse(b.id),
                label: b.name,
              ),
            ),
          ],
          onChanged: (value) {
            setState(() {
              _selectedBrandId = value == -1 ? null : value;
            });
          },
          label: 'Brand',
          hintText: 'Select Brand',
        );
      },
    );
  }

  Widget _buildUnitDropdown() {
    final unitsAsync = ref.watch(unitProvider);

    return unitsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => app_err.ErrorsWidget(
        failure: error is Failure
            ? error
            : Failure.unexpectedError(error.toString()),
      ),
      data: (units) {
        if (units.isEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Unit',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 18,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'No units available',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        return CustomDropdown<int>(
          value: _selectedUnitId,
          items: [
            DropdownItem(value: -1, label: 'None'),
            ...units.map(
              (u) => DropdownItem(
                value: int.parse(u.id),
                label: u.name,
              ),
            ),
          ],
          onChanged: (value) {
            setState(() {
              _selectedUnitId = value == -1 ? null : value;
            });
          },
          label: 'Unit',
          hintText: 'Select Unit',
        );
      },
    );
  }

  Widget _buildModelDropdown() {
    final modelsAsync = ref.watch(modelProvider);

    return modelsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => app_err.ErrorsWidget(
        failure: error is Failure
            ? error
            : Failure.unexpectedError(error.toString()),
      ),
      data: (models) {
        if (models.isEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Model',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 18,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'No models available',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        return CustomDropdown<int>(
          value: _selectedModelId,
          items: [
            DropdownItem(value: -1, label: 'None'),
            ...models.map(
              (m) => DropdownItem(
                value: int.parse(m.id),
                label: m.name,
              ),
            ),
          ],
          onChanged: (value) {
            setState(() {
              _selectedModelId = value == -1 ? null : value;
            });
          },
          label: 'Model',
          hintText: 'Select Model',
        );
      },
    );
  }
}

