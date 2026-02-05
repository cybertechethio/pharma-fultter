import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/forms/custom_text_field.dart';
import '../../../../shared/components/forms/date_picker_field.dart';
import '../../../../shared/components/forms/dropdown.dart';
import '../../../../shared/components/forms/custom_button.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/utils/validators.dart';
import '../../../../shared/utils/url_utils.dart';
import '../../domain/entities/company.dart';
import '../../data/models/company_request_model.dart';
import '../providers/company_notifier.dart';
import '../providers/company_events.dart';
import '../providers/company_loading_providers.dart';

class CompanyUpdateScreen extends ConsumerStatefulWidget {
  final Company company;

  const CompanyUpdateScreen({
    super.key,
    required this.company,
  });

  @override
  ConsumerState<CompanyUpdateScreen> createState() => _CompanyUpdateScreenState();
}

class _CompanyUpdateScreenState extends ConsumerState<CompanyUpdateScreen> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _imagePicker = ImagePicker();

  // Controllers
  late final TextEditingController _nameController;
  late final TextEditingController _tradeNameController;
  late final TextEditingController _phone1Controller;
  late final TextEditingController _phone2Controller;
  late final TextEditingController _tinNumberController;
  late final TextEditingController _cityController;
  late final TextEditingController _weredaController;
  late final TextEditingController _defaultStartDateController;
  late final TextEditingController _businessTypeController;
  
  // State variables
  String? _logoFilePath;
  String? _logoUrl;
  late bool _autoPrint;
  String? _businessType;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.company.name);
    _tradeNameController = TextEditingController(text: widget.company.tradeName ?? '');
    _phone1Controller = TextEditingController(text: widget.company.phone1 ?? '');
    _phone2Controller = TextEditingController(text: widget.company.phone2 ?? '');
    _tinNumberController = TextEditingController(text: widget.company.tinNumber ?? '');
    _cityController = TextEditingController(text: widget.company.city ?? '');
    _weredaController = TextEditingController(text: widget.company.wereda ?? '');
    _defaultStartDateController = TextEditingController(
      text: widget.company.defaultStartDate != null
          ? widget.company.defaultStartDate!.toIso8601String().split('T')[0]
          : '',
    );
    _businessTypeController = TextEditingController(text: widget.company.businessType ?? '');
    _logoUrl = widget.company.logoUrl;
    _autoPrint = widget.company.autoPrint;
    _businessType = widget.company.businessType;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _tradeNameController.dispose();
    _phone1Controller.dispose();
    _phone2Controller.dispose();
    _tinNumberController.dispose();
    _cityController.dispose();
    _weredaController.dispose();
    _defaultStartDateController.dispose();
    _businessTypeController.dispose();
    super.dispose();
  }

  Future<void> _pickLogo() async {
    try {
      final l10n = AppLocalizations.of(context);
      final ImageSource? source = await showModalBottomSheet<ImageSource>(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) => SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: Text(l10n.chooseFromGallery),
                onTap: () => Navigator.pop(context, ImageSource.gallery),
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: Text(l10n.takePhoto),
                onTap: () => Navigator.pop(context, ImageSource.camera),
              ),
              ListTile(
                leading: const Icon(Icons.cancel),
                title: Text(l10n.cancel),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      );

      if (source == null) return;

      final XFile? image = await _imagePicker.pickImage(
        source: source,
        imageQuality: 85,
        maxWidth: 1024,
        maxHeight: 1024,
      );

      if (image != null && mounted) {
        setState(() {
          _logoFilePath = image.path;
          _logoUrl = null; // Clear existing URL when new file is selected
        });
      }
    } catch (e) {
      if (mounted) {
        final snackbar = ref.read(snackbarServiceProvider);
        snackbar.showError(Failure.unexpectedError('Error picking image: ${e.toString()}'));
      }
    }
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    final companyId = widget.company.id;
    
    // Parse date if provided
    DateTime? defaultStartDate;
    if (_defaultStartDateController.text.isNotEmpty) {
      try {
        defaultStartDate = DateTime.parse(_defaultStartDateController.text);
      } catch (e) {
        // Invalid date, ignore
      }
    }

    final request = CompanyRequestModel(
      name: _nameController.text.trim().isEmpty ? null : _nameController.text.trim(),
      tradeName: _tradeNameController.text.trim().isEmpty ? null : _tradeNameController.text.trim(),
      phone1: _phone1Controller.text.trim().isEmpty ? null : _phone1Controller.text.trim(),
      phone2: _phone2Controller.text.trim().isEmpty ? null : _phone2Controller.text.trim(),
      tinNumber: _tinNumberController.text.trim().isEmpty ? null : _tinNumberController.text.trim(),
      city: _cityController.text.trim().isEmpty ? null : _cityController.text.trim(),
      wereda: _weredaController.text.trim().isEmpty ? null : _weredaController.text.trim(),
      logoUrl: _logoUrl, // Will be updated after upload if _logoFilePath is set
      autoPrint: _autoPrint,
      defaultStartDate: defaultStartDate,
      businessType: _businessType,
    );

    await ref.read(companyProvider.notifier).updateCompany(
          companyId: companyId,
          request: request,
          logoFilePath: _logoFilePath,
        );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final updating = ref.watch(companyUpdateLoadingProvider);

    // Listen to events for auto-pop on success
    ref.listen<CompanyUiEvent?>(
      companyUiEventsProvider,
      (prev, next) {
        if (next == null) return;
        final snackbar = ref.read(snackbarServiceProvider);
        final l10n = AppLocalizations.of(context);
        if (next is CompanyFailure) {
          snackbar.showError(next.failure);
        } else if (next is CompanyUpdated) {
          snackbar.showSuccess(l10n.companyUpdatedSuccessfully);
          if (mounted) {
            context.pop();
          }
        }
        ref.read(companyUiEventsProvider.notifier).clear();
      },
    );

    return Scaffold(
      backgroundColor: BrandColors.background,
      appBar: CustomAppBar(
        title: l10n.updateCompany,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.lg),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Basic Information Section
              _buildSection(
                context,
                title: l10n.basicInformation,
                children: [
                  CustomTextField(
                    labelText: l10n.companyName,
                    controller: _nameController,
                    prefixIcon: Icons.business,
                    validator: Validators.validateCompanyName,
                  ),
                  const SizedBox(height: AppSizes.md),
                  CustomTextField(
                    labelText: l10n.tradeName,
                    controller: _tradeNameController,
                    prefixIcon: Icons.store,
                  ),
                  const SizedBox(height: AppSizes.md),
                  _buildLogoPicker(context),
                ],
              ),

              const SizedBox(height: AppSizes.lg),

              // Contact Information Section
              _buildSection(
                context,
                title: l10n.contactInformation,
                children: [
                  CustomTextField(
                    labelText: l10n.phone1,
                    controller: _phone1Controller,
                    prefixIcon: Icons.phone,
                    inputType: TextInputType.phone,
                  ),
                  const SizedBox(height: AppSizes.md),
                  CustomTextField(
                    labelText: l10n.phone2,
                    controller: _phone2Controller,
                    prefixIcon: Icons.phone,
                    inputType: TextInputType.phone,
                  ),
                ],
              ),

              const SizedBox(height: AppSizes.lg),

              // Location Information Section
              _buildSection(
                context,
                title: l10n.locationInformation,
                children: [
                  CustomTextField(
                    labelText: l10n.city,
                    controller: _cityController,
                    prefixIcon: Icons.location_city,
                  ),
                  const SizedBox(height: AppSizes.md),
                  CustomTextField(
                    labelText: l10n.wereda,
                    controller: _weredaController,
                    prefixIcon: Icons.map,
                  ),
                ],
              ),

              const SizedBox(height: AppSizes.lg),

              // Business Information Section
              _buildSection(
                context,
                title: l10n.businessInformation,
                children: [
                  CustomTextField(
                    labelText: l10n.tinNumber,
                    controller: _tinNumberController,
                    prefixIcon: Icons.badge,
                  ),
                  const SizedBox(height: AppSizes.md),
                  CustomDropdown<String?>(
                    value: _businessType,
                    items: [
                      DropdownItem<String?>(value: null, label: l10n.none),
                      DropdownItem<String?>(value: 'BAKERY', label: l10n.bakery),
                      DropdownItem<String?>(value: 'PHARMACY', label: l10n.pharmacy),
                      DropdownItem<String?>(value: 'SUPERMARKET', label: l10n.supermarket),
                      DropdownItem<String?>(value: 'RETAIL', label: l10n.retail),
                      DropdownItem<String?>(value: 'CAFE', label: l10n.cafe),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _businessType = value;
                      });
                    },
                    label: l10n.businessType,
                    hintText: l10n.selectBusinessType,
                  ),
                ],
              ),

              const SizedBox(height: AppSizes.lg),

              // Configuration Section
              _buildSection(
                context,
                title: l10n.general,
                children: [
                  SwitchListTile(
                    title: Text(l10n.autoPrint),
                    subtitle: Text(l10n.automaticallyPrintReceipts),
                    value: _autoPrint,
                    onChanged: (value) {
                      setState(() {
                        _autoPrint = value;
                      });
                    },
                  ),
                  const SizedBox(height: AppSizes.md),
                  DatePickerField(
                    labelText: l10n.defaultStartDate,
                    controller: _defaultStartDateController,
                    prefixIcon: Icons.calendar_today_outlined,
                  ),
                ],
              ),

              const SizedBox(height: AppSizes.xl),

              // Submit Button
              CustomButton(
                text: l10n.update,
                isLoading: updating,
                loadingText: l10n.updating,
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
    required String title,
    required List<Widget> children,
  }) {
    final theme = Theme.of(context);

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
            Text(
              title,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppSizes.md),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildLogoPicker(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.companyLogo,
          style: theme.textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: AppSizes.sm),
        Row(
          children: [
            // Logo Preview
            if (_logoFilePath != null || _logoUrl != null)
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                  border: Border.all(color: colorScheme.outline),
                ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                      child: _logoFilePath != null
                          ? Image.file(
                              File(_logoFilePath!),
                              fit: BoxFit.cover,
                            )
                          : _logoUrl != null
                              ? _buildNetworkImage(colorScheme)
                              : null,
                    ),
              )
            else
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceVariant,
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                  border: Border.all(color: colorScheme.outline),
                ),
                child: Icon(
                  Icons.image,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            const SizedBox(width: AppSizes.md),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: _pickLogo,
                icon: const Icon(Icons.upload),
                label: Text(l10n.uploadLogo),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: AppSizes.md),
                ),
              ),
            ),
            if (_logoFilePath != null || _logoUrl != null) ...[
              const SizedBox(width: AppSizes.sm),
              IconButton(
                onPressed: () {
                  setState(() {
                    _logoFilePath = null;
                    _logoUrl = null;
                  });
                },
                icon: const Icon(Icons.delete_outline),
                color: colorScheme.error,
              ),
            ],
          ],
        ),
      ],
    );
  }

  Widget _buildNetworkImage(ColorScheme colorScheme) {
    final imageUrl = UrlUtils.getFullImageUrl(_logoUrl);
    if (imageUrl == null) {
      return Icon(
        Icons.broken_image,
        color: colorScheme.error,
      );
    }

    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        color: colorScheme.surfaceVariant,
        child: Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: colorScheme.primary,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Icon(
        Icons.broken_image,
        color: colorScheme.error,
      ),
    );
  }
}

