import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/forms/custom_text_field.dart';
import '../../../../shared/components/forms/date_picker_field.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/text_styles.dart';
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
import '../../data/models/item_request_model.dart';
import '../providers/item_notifier.dart';
import '../providers/item_loading_providers.dart';
import '../providers/item_events.dart';

class ItemCreateOrUpdateScreen extends ConsumerStatefulWidget {
  final Item? item;

  const ItemCreateOrUpdateScreen({
    super.key,
    this.item,
  });

  @override
  ConsumerState<ItemCreateOrUpdateScreen> createState() => _ItemCreateScreenState();
}

class _ItemCreateScreenState extends ConsumerState<ItemCreateOrUpdateScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _showMoreFields = false;
  
  // Controllers - initialized in initState
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
  late final TextEditingController _costPriceController;
  late final TextEditingController _unitPriceController;
  late final TextEditingController _expirationDateController;
  late final TextEditingController _manufacturingDateController;

  // State variables
  int? _selectedCategoryId;
  int? _selectedSubCategoryId;
  int? _selectedBrandId;
  int? _selectedUnitId;
  int? _selectedModelId;
  late bool _isTaxable;
  late bool _isActive;

  bool get _isEditing => widget.item != null;

  // Validator wrapper functions with access to l10n
  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(context).nameRequired;
    }
    return null;
  }

  String? _validateCode(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(context).codeRequired;
    }
    return null;
  }

  String? _validateCostPrice(String? value) {
    final l10n = AppLocalizations.of(context);
    if (value == null || value.trim().isEmpty) {
      return l10n.costPriceRequired;
    }
    final price = double.tryParse(value);
    if (price == null || price <= 0) {
      return l10n.costPriceMustBeGreaterThanZero;
    }
    return null;
  }

  String? _validateUnitPrice(String? value) {
    final l10n = AppLocalizations.of(context);
    if (value == null || value.trim().isEmpty) {
      return l10n.unitPriceRequired;
    }
    final price = double.tryParse(value);
    if (price == null || price <= 0) {
      return l10n.unitPriceMustBeGreaterThanZero;
    }
    // Validate unit price >= cost price
    final costPriceValue = _costPriceController.text;
    if (costPriceValue.isNotEmpty) {
      final costPrice = double.tryParse(costPriceValue);
      if (costPrice != null && price < costPrice) {
        return l10n.unitPriceMustBeGreaterThanOrEqualToCostPrice;
      }
    }
    return null;
  }

  String? _validateTaxRate(String? value) {
    final l10n = AppLocalizations.of(context);
    if (!_isTaxable) return null;
    if (value == null || value.trim().isEmpty) {
      return l10n.taxRateRequired;
    }
    final rate = int.tryParse(value);
    if (rate == null || rate < 0 || rate > 100) {
      return l10n.taxRateMustBeBetween0And100;
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    // Initialize controllers with item data if editing, otherwise empty
    _nameController = TextEditingController(text: widget.item?.name ?? '');
    _descriptionController = TextEditingController(text: widget.item?.description ?? '');
    _skuController = TextEditingController(text: widget.item?.sku ?? '');
    _codeController = TextEditingController(text: widget.item?.code ?? '');
    _barcodeController = TextEditingController(text: widget.item?.barcode ?? '');
    _colorController = TextEditingController(text: widget.item?.color ?? '');
    _sizeController = TextEditingController(text: widget.item?.size ?? '');
    _materialController = TextEditingController(text: widget.item?.material ?? '');
    _weightController = TextEditingController(text: widget.item?.weight?.toString() ?? '');
    _taxRateController = TextEditingController(text: widget.item?.taxRate.toString() ?? '0');
    _costPriceController = TextEditingController(text: widget.item?.costPrice.toString() ?? '');
    _unitPriceController = TextEditingController(text: widget.item?.unitPrice.toString() ?? '');
    _expirationDateController = TextEditingController(
      text: widget.item?.expirationDate != null 
          ? widget.item!.expirationDate!.toIso8601String().split('T')[0]
          : '',
    );
    _manufacturingDateController = TextEditingController(
      text: widget.item?.manufacturingDate != null 
          ? widget.item!.manufacturingDate!.toIso8601String().split('T')[0]
          : '',
    );

    // Initialize state variables with item data if editing
    _selectedCategoryId = widget.item?.categoryId;
    _selectedSubCategoryId = widget.item?.subCategoryId;
    _selectedBrandId = widget.item?.brandId;
    _selectedUnitId = widget.item?.unitId;
    _selectedModelId = widget.item?.modelId;
    _isTaxable = widget.item?.isTaxable ?? true;
    _isActive = widget.item?.isActive ?? true;
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
    _costPriceController.dispose();
    _unitPriceController.dispose();
    _expirationDateController.dispose();
    _manufacturingDateController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    final creating = ref.read(itemCreateLoadingProvider);
    final updating = _isEditing && widget.item != null
        ? ref.read(itemUpdateLoadingProvider).contains(widget.item!.id)
        : false;

    if (creating || updating) return;

    // Parse numeric values
    final weight = double.tryParse(_weightController.text.trim());
    final costPrice = double.tryParse(_costPriceController.text.trim());
    final unitPrice = double.tryParse(_unitPriceController.text.trim());
    final taxRate = _isTaxable 
        ? (int.tryParse(_taxRateController.text.trim()) ?? 0)
        : 0;

    // Create request model
    final request = ItemRequestModel(
      name: _nameController.text.trim(),
      description: _descriptionController.text.trim().isEmpty 
          ? null 
          : _descriptionController.text.trim(),
      categoryId: _selectedCategoryId,
      subCategoryId: _selectedSubCategoryId,
      brandId: _selectedBrandId,
      unitId: _selectedUnitId,
      modelId: _selectedModelId,
      sku: _skuController.text.trim().isEmpty 
          ? null 
          : _skuController.text.trim(),
      code: _codeController.text.trim(),
      barcode: _barcodeController.text.trim().isEmpty 
          ? null 
          : _barcodeController.text.trim(),
      color: _colorController.text.trim().isEmpty 
          ? null 
          : _colorController.text.trim(),
      size: _sizeController.text.trim().isEmpty 
          ? null 
          : _sizeController.text.trim(),
      material: _materialController.text.trim().isEmpty 
          ? null 
          : _materialController.text.trim(),
      weight: weight,
      isTaxable: _isTaxable,
      taxRate: taxRate,
      isActive: _isActive,
      imageUrl: widget.item?.imageUrl,
      costPrice: costPrice ?? 0,
      unitPrice: unitPrice ?? 0,
      expirationDate: _expirationDateController.text.trim().isEmpty 
          ? null 
          : _expirationDateController.text.trim(),
      manufacturingDate: _manufacturingDateController.text.trim().isEmpty 
          ? null 
          : _manufacturingDateController.text.trim(),
    );

    if (_isEditing && widget.item != null) {
      await ref.read(itemProvider.notifier).updateItem(
        id: widget.item!.id,
        request: request,
      );
    } else {
      await ref.read(itemProvider.notifier).create(request);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final creating = ref.watch(itemCreateLoadingProvider);
    final updating = _isEditing && widget.item != null
        ? ref.watch(itemUpdateLoadingProvider).contains(widget.item!.id)
        : false;

    // Listen to events
    ref.listen<ItemUiEvent?>(
      itemUiEventsProvider,
      (prev, next) {
        if (next == null) return;
        if (next is ItemCreated || next is ItemUpdated) {
          if (mounted) {
            context.pop();
          }
        }
        ref.read(itemUiEventsProvider.notifier).clear();
      },
    );

    return Scaffold(
      appBar: CustomAppBar(
        title: _isEditing ? l10n.updateItem : l10n.createItem,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Most Important Fields - First Level
              _buildSection(
                context,
                title: null, // No title for main fields
                children: [
                  CustomTextField(
                    labelText: '${l10n.name} *',
                    controller: _nameController,
                    prefixIcon: Icons.label_outline,
                    validator: _validateName,
                  ),
                  const SizedBox(height: AppSizes.md),
                  CustomTextField(
                    labelText: '${l10n.itemCode} *',
                    controller: _codeController,
                    prefixIcon: Icons.tag_outlined,
                    validator: _validateCode,
                  ),
                  const SizedBox(height: AppSizes.md),
                  CustomTextField(
                    labelText: '${l10n.costPrice} *',
                    controller: _costPriceController,
                    prefixIcon: Icons.attach_money_outlined,
                    inputType: TextInputType.number,
                    validator: _validateCostPrice,
                  ),
                  const SizedBox(height: AppSizes.md),
                  CustomTextField(
                    labelText: '${l10n.unitPrice} *',
                    controller: _unitPriceController,
                    prefixIcon: Icons.sell_outlined,
                    inputType: TextInputType.number,
                    validator: _validateUnitPrice,
                  ),
                ],
              ),

              const SizedBox(height: AppSizes.md),

              // More Fields - Professional Collapsible Section
              _buildMoreFieldsSection(context, l10n),

              const SizedBox(height: AppSizes.xxl),

              // Submit Button
              CustomButton(
                text: _isEditing ? l10n.updateItem : l10n.createItem,
                isLoading: creating || updating,
                loadingText: _isEditing ? l10n.updating : l10n.creating,
                onPressed: _handleSubmit,
              ),

              const SizedBox(height: AppSizes.lg),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    String? title,
    required List<Widget> children,
  }) {
    return Card(
      elevation: 1,
      color: BrandColors.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) ...[
              Text(
                title,
                style: context.subtitle(bold: true),
              ),
              const SizedBox(height: AppSizes.md),
            ],
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildMoreFieldsSection(BuildContext context, AppLocalizations l10n) {
    return Card(
      elevation: 0,
      color: BrandColors.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radius),
        side: BorderSide(
          color: BrandColors.divider,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          // Professional Header Button
          InkWell(
            onTap: () {
              setState(() {
                _showMoreFields = !_showMoreFields;
              });
            },
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSizes.radius),
              topRight: Radius.circular(AppSizes.radius),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.md,
                vertical: AppSizes.md,
              ),
              decoration: BoxDecoration(
                color: _showMoreFields 
                    ? BrandColors.primary.withOpacity(0.05)
                    : BrandColors.transparent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSizes.radius),
                  topRight: Radius.circular(AppSizes.radius),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppSizes.xs),
                    decoration: BoxDecoration(
                      color: BrandColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppSizes.radiusXs),
                    ),
                    child: Icon(
                      Icons.tune_rounded,
                      size: AppSizes.iconSize,
                      color: BrandColors.primary,
                    ),
                  ),
                  const SizedBox(width: AppSizes.md),
                  Expanded(
                    child: Text(
                      l10n.more,
                      style: context.subtitle(bold: true),
                    ),
                  ),
                  AnimatedRotation(
                    turns: _showMoreFields ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: BrandColors.textSecondary,
                      size: AppSizes.iconSizeLg,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Collapsible Content
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: _showMoreFields
                ? Container(
                    padding: const EdgeInsets.all(AppSizes.md),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: BrandColors.divider,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Description
                        CustomTextField(
                          labelText: l10n.description,
                          controller: _descriptionController,
                          prefixIcon: Icons.description_outlined,
                          maxLines: 3,
                        ),
                        const SizedBox(height: AppSizes.md),

                        // Identification Section
                        Text(
                          l10n.identification,
                          style: context.subtitle(bold: true),
                        ),
                        const SizedBox(height: AppSizes.md),
                        CustomTextField(
                          labelText: l10n.sku,
                          controller: _skuController,
                          prefixIcon: Icons.qr_code_outlined,
                        ),
                        const SizedBox(height: AppSizes.md),
                        CustomTextField(
                          labelText: l10n.barcode,
                          controller: _barcodeController,
                          prefixIcon: Icons.barcode_reader,
                        ),
                        const SizedBox(height: AppSizes.md),

                        // Product Details Section
                        Text(
                          l10n.productDetails,
                          style: context.subtitle(bold: true),
                        ),
                        const SizedBox(height: AppSizes.md),
                        CustomTextField(
                          labelText: l10n.color,
                          controller: _colorController,
                          prefixIcon: Icons.palette_outlined,
                        ),
                        const SizedBox(height: AppSizes.md),
                        CustomTextField(
                          labelText: l10n.size,
                          controller: _sizeController,
                          prefixIcon: Icons.straighten_outlined,
                        ),
                        const SizedBox(height: AppSizes.md),
                        CustomTextField(
                          labelText: l10n.material,
                          controller: _materialController,
                          prefixIcon: Icons.texture_outlined,
                        ),
                        const SizedBox(height: AppSizes.md),
                        CustomTextField(
                          labelText: '${l10n.weight} (kg)',
                          controller: _weightController,
                          prefixIcon: Icons.scale_outlined,
                          inputType: TextInputType.number,
                        ),
                        const SizedBox(height: AppSizes.md),

                        // Relationships Section
                        Text(
                          l10n.relationships,
                          style: context.subtitle(bold: true),
                        ),
                        const SizedBox(height: AppSizes.md),
                        _buildCategoryDropdown(),
                        const SizedBox(height: AppSizes.md),
                        _buildSubCategoryDropdown(),
                        const SizedBox(height: AppSizes.md),
                        _buildBrandDropdown(),
                        const SizedBox(height: AppSizes.md),
                        _buildUnitDropdown(),
                        const SizedBox(height: AppSizes.md),
                        _buildModelDropdown(),
                        const SizedBox(height: AppSizes.md),

                        // Tax & Status Section
                        Text(
                          l10n.taxAndStatus,
                          style: context.subtitle(bold: true),
                        ),
                        const SizedBox(height: AppSizes.md),
                        SwitchListTile(
                          title: Text(l10n.isTaxable),
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
                        const SizedBox(height: AppSizes.md),
                        CustomTextField(
                          labelText: l10n.taxRate,
                          controller: _taxRateController,                          
                          prefixIcon: Icons.percent_outlined,
                          inputType: TextInputType.number,
                          validator: _validateTaxRate,
                        ),
                        const SizedBox(height: AppSizes.md),
                        SwitchListTile(
                          title: Text(l10n.isActive),
                          value: _isActive,
                          onChanged: (value) {
                            setState(() {
                              _isActive = value;
                            });
                          },
                          contentPadding: EdgeInsets.zero,
                        ),
                        const SizedBox(height: AppSizes.md),

                        // Dates Section
                        Text(
                          l10n.datesOptional,
                          style: context.subtitle(bold: true),
                        ),
                        const SizedBox(height: AppSizes.md),
                        DatePickerField(
                          labelText: l10n.expirationDate,
                          controller: _expirationDateController,
                          prefixIcon: Icons.calendar_today_outlined,
                        ),
                        const SizedBox(height: AppSizes.md),
                        DatePickerField(
                          labelText: l10n.manufacturingDate,
                          controller: _manufacturingDateController,
                          prefixIcon: Icons.date_range_outlined,
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryDropdown() {
    final l10n = AppLocalizations.of(context);
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
                l10n.category,
                style: context.smallSecondary(),
              ),
              const SizedBox(height: AppSizes.sm),
              Container(
                padding: const EdgeInsets.all(AppSizes.md),
                decoration: BoxDecoration(
                  color: BrandColors.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 18,
                      color: BrandColors.textSecondary,
                    ),
                    const SizedBox(width: AppSizes.sm),
                    Expanded(
                      child: Text(
                        l10n.noCategoriesAvailable,
                        style: context.smallSecondary(),
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
            DropdownItem(value: -1, label: l10n.none),
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
          label: l10n.category,
          hintText: l10n.selectCategory,
        );
      },
    );
  }

  Widget _buildSubCategoryDropdown() {
    final l10n = AppLocalizations.of(context);
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
        if (_selectedCategoryId == null) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.subCategory,
                style: context.smallSecondary(),
              ),
              const SizedBox(height: AppSizes.sm),
              Container(
                padding: const EdgeInsets.all(AppSizes.md),
                decoration: BoxDecoration(
                  color: BrandColors.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: AppSizes.md2,
                      color: BrandColors.textSecondary,
                    ),
                    const SizedBox(width: AppSizes.sm),
                    Expanded(
                      child: Text(
                        l10n.selectCategoryFirst,
                        style: context.smallSecondary(),
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
                l10n.subCategory,
                style: context.smallSecondary(),
              ),
              const SizedBox(height: AppSizes.sm),
              Container(
                padding: const EdgeInsets.all(AppSizes.md),
                decoration: BoxDecoration(
                  color: BrandColors.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 18,
                      color: BrandColors.textSecondary,
                    ),
                    const SizedBox(width: AppSizes.sm),
                    Expanded(
                      child: Text(
                        l10n.noSubCategoriesAvailable,
                        style: context.smallSecondary(),
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
            DropdownItem(value: -1, label: l10n.none),
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
          label: l10n.subCategory,
          hintText: l10n.selectSubCategory,
        );
      },
    );
  }

  Widget _buildBrandDropdown() {
    final l10n = AppLocalizations.of(context);
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
                l10n.brand,
                style: context.smallSecondary(),
              ),
              const SizedBox(height: AppSizes.sm),
              Container(
                padding: const EdgeInsets.all(AppSizes.md),
                decoration: BoxDecoration(
                  color: BrandColors.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 18,
                      color: BrandColors.textSecondary,
                    ),
                    const SizedBox(width: AppSizes.sm),
                    Expanded(
                      child: Text(
                        l10n.noBrandsAvailable,
                        style: context.smallSecondary(),
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
            DropdownItem(value: -1, label: l10n.none),
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
          label: l10n.brand,
          hintText: l10n.selectBrand,
        );
      },
    );
  }

  Widget _buildUnitDropdown() {
    final l10n = AppLocalizations.of(context);
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
                l10n.unit,
                style: context.smallSecondary(),
              ),
              const SizedBox(height: AppSizes.sm),
              Container(
                padding: const EdgeInsets.all(AppSizes.md),
                decoration: BoxDecoration(
                  color: BrandColors.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 18,
                      color: BrandColors.textSecondary,
                    ),
                    const SizedBox(width: AppSizes.sm),
                    Expanded(
                      child: Text(
                        l10n.noUnitsAvailable,
                        style: context.smallSecondary(),
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
            DropdownItem(value: -1, label: l10n.none),
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
          label: l10n.unit,
          hintText: l10n.selectUnit,
        );
      },
    );
  }

  Widget _buildModelDropdown() {
    final l10n = AppLocalizations.of(context);
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
                l10n.model,
                style: context.smallSecondary(),
              ),
              const SizedBox(height: AppSizes.sm),
              Container(
                padding: const EdgeInsets.all(AppSizes.md),
                decoration: BoxDecoration(
                  color: BrandColors.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 18,
                      color: BrandColors.textSecondary,
                    ),
                    const SizedBox(width: AppSizes.sm),
                    Expanded(
                      child: Text(
                        l10n.noModelsAvailable,
                        style: context.smallSecondary(),
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
            DropdownItem(value: -1, label: l10n.none),
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
          label: l10n.model,
          hintText: l10n.selectModel,
        );
      },
    );
  }
}

