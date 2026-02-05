import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/enums/payment_method_type_enum.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../shared/components/forms/custom_text_field.dart';
import '../../../../shared/components/forms/custom_button.dart';
import '../../../../shared/components/forms/dropdown.dart';
import '../../../../shared/components/forms/attachment_picker.dart';
import '../../../bank/domain/entities/bank.dart';
import '../../../bank/presentation/providers/bank_notifier.dart';
import '../../data/models/payment_method_model.dart';

class PaymentMethodDialog extends ConsumerStatefulWidget {
  final PaymentMethodModel? initialPaymentMethod;
  final int? initialIndex;
  final String? initialAttachmentFilePath;
  final List<PaymentMethodModel>? existingPaymentMethods;

  const PaymentMethodDialog({
    super.key,
    this.initialPaymentMethod,
    this.initialIndex,
    this.initialAttachmentFilePath,
    this.existingPaymentMethods,
  });

  static Future<PaymentMethodModel?> show(
    BuildContext context, {
    PaymentMethodModel? initialPaymentMethod,
    int? initialIndex,
    String? initialAttachmentFilePath,
    List<PaymentMethodModel>? existingPaymentMethods,
  }) {
    return showDialog<PaymentMethodModel>(
      context: context,
      builder: (context) => PaymentMethodDialog(
        initialPaymentMethod: initialPaymentMethod,
        initialIndex: initialIndex,
        initialAttachmentFilePath: initialAttachmentFilePath,
        existingPaymentMethods: existingPaymentMethods,
      ),
    );
  }

  @override
  ConsumerState<PaymentMethodDialog> createState() => _PaymentMethodDialogState();
}

class _PaymentMethodDialogState extends ConsumerState<PaymentMethodDialog> {
  final _formKey = GlobalKey<FormState>();
  late PaymentMethodType _selectedMethod;
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _referenceNumberController = TextEditingController();
  int? _selectedBankId;
  String? _selectedBankName;
  String? _attachmentFilePath;

  @override
  void initState() {
    super.initState();
    if (widget.initialPaymentMethod != null) {
      final method = PaymentMethodTypeExtension.fromString(widget.initialPaymentMethod!.method);
      _selectedMethod = method;
      _amountController.text = widget.initialPaymentMethod!.amount.toString();
      _referenceNumberController.text = widget.initialPaymentMethod!.referenceNumber ?? '';
      _selectedBankId = widget.initialPaymentMethod!.bankId;
      _selectedBankName = widget.initialPaymentMethod!.bankName;
      // Load attachment file path from form state if provided
      _attachmentFilePath = widget.initialAttachmentFilePath;
      // If not provided, check if attachment is a file path (not URL)
      if (_attachmentFilePath == null &&
          widget.initialPaymentMethod!.attachment != null &&
          !widget.initialPaymentMethod!.attachment!.startsWith('http')) {
        _attachmentFilePath = widget.initialPaymentMethod!.attachment;
      }
    } else {
      // Set to first available method, not always cash
      final availableMethods = _getAvailablePaymentMethods();
      _selectedMethod = availableMethods.isNotEmpty 
          ? availableMethods.first 
          : PaymentMethodType.cash;
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    _referenceNumberController.dispose();
    super.dispose();
  }

  /// Get available payment methods (exclude already used ones)
  List<PaymentMethodType> _getAvailablePaymentMethods() {
    final existingMethods = widget.existingPaymentMethods ?? [];
    final usedMethodTypes = existingMethods
        .map((pm) => PaymentMethodTypeExtension.fromString(pm.method))
        .toSet();
    
    // If editing, include the current method type
    if (widget.initialPaymentMethod != null) {
      final currentMethod = PaymentMethodTypeExtension.fromString(
        widget.initialPaymentMethod!.method,
      );
      usedMethodTypes.remove(currentMethod);
    }
    
    // Return all methods except the ones already used
    return PaymentMethodType.values
        .where((method) => !usedMethodTypes.contains(method))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final banksAsync = ref.watch(bankProvider);

    return Dialog(
      elevation: 0,
      backgroundColor: BrandColors.transparent,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: AppSizes.lg,
        vertical: AppSizes.xl,
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        decoration: BoxDecoration(
          color: BrandColors.background,
          borderRadius: BorderRadius.circular(AppSizes.radiusLg),
          boxShadow: [
            BoxShadow(
              color: BrandColors.shadow,
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Section
            Container(
              padding: const EdgeInsets.fromLTRB(
                AppSizes.xl,
                AppSizes.xl,
                AppSizes.lg,
                AppSizes.lg,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: BrandColors.divider,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.initialPaymentMethod != null
                          ? l10n.editPaymentMethod
                          : l10n.addPaymentMethod,
                      style: context.title(bold: true),
                    ),
                  ),
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: Container(
                      padding: const EdgeInsets.all(AppSizes.xs),
                      decoration: BoxDecoration(
                        color: BrandColors.inputBackground,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close_rounded,
                        color: BrandColors.textSecondary,
                        size: AppSizes.iconSize,
                      ),
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),
            // Content Section
            Padding(
              padding: const EdgeInsets.all(AppSizes.xl),
              child: Form(
                key: _formKey,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 500),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Payment Method Type
                        CustomDropdown<PaymentMethodType>(
                          value: _selectedMethod,
                          items: _getAvailablePaymentMethods().map((method) {
                            return DropdownItem<PaymentMethodType>(
                              value: method,
                              label: method.getDisplayLabel(),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                _selectedMethod = value;
                                // Clear bank selection if method doesn't require bank
                                if (!value.requiresBank()) {
                                  _selectedBankId = null;
                                  _selectedBankName = null;
                                }
                              });
                            }
                          },
                          label: AppLocalizations.of(context).paymentMethod,
                          hintText: AppLocalizations.of(context).selectPaymentMethod,
                          required: true,
                        ),
                        const SizedBox(height: AppSizes.xxl),
                        // Amount
                        CustomTextField(
                          controller: _amountController,
                          labelText: '${l10n.amount} *',
                          inputType: const TextInputType.numberWithOptions(decimal: true),
                          subtle: true,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return l10n.amountRequired;
                            }
                            final amount = double.tryParse(value.trim());
                            if (amount == null || amount <= 0) {
                              return l10n.pleaseEnterValidAmount;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: AppSizes.md),
                        // Reference Number (optional for all methods)
                        CustomTextField(
                          controller: _referenceNumberController,
                          labelText: l10n.referenceNumber,
                          subtle: true,
                        ),
                        const SizedBox(height: AppSizes.md),
                        // Bank Selector (only for bank transfer)
                        if (_selectedMethod == PaymentMethodType.bankTransfer) ...[
                          Text(
                            'Bank *',
                            style: context.label(),
                          ),
                          const SizedBox(height: AppSizes.sm),
                          _buildBankSelector(context, banksAsync),
                          const SizedBox(height: AppSizes.md),
                        ],
                        // Receipt Attachment
                        Text(
                          AppLocalizations.of(context).receipt,
                          style: context.label(),
                        ),
                        const SizedBox(height: AppSizes.sm),
                        _buildReceiptAttachment(context),
                        const SizedBox(height: AppSizes.md),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Actions Section
            Container(
              padding: const EdgeInsets.fromLTRB(
                AppSizes.xl,
                AppSizes.lg,
                AppSizes.xl,
                AppSizes.xl,
              ),
              decoration: BoxDecoration(
                color: BrandColors.inputBackground,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(AppSizes.radiusLg),
                  bottomRight: Radius.circular(AppSizes.radiusLg),
                ),
              ),
              child: CustomButton(
                text: widget.initialPaymentMethod != null
                    ? l10n.updatePaymentMethod
                    : l10n.addPaymentMethod,
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;
                  if (!mounted) return;
                  _handleSubmit();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBankSelector(BuildContext context, AsyncValue<List<BankEntity>> banksAsync) {
    final l10n = AppLocalizations.of(context);

    return banksAsync.when(
      loading: () => const SizedBox(
        height: AppSizes.attachmentThumbSize * 0.48,
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) => Container(
        height: AppSizes.attachmentThumbSize * 0.48,
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm, vertical: AppSizes.md),
        decoration: BoxDecoration(
          color: BrandColors.errorBackgroundLight,
          borderRadius: BorderRadius.circular(AppSizes.xs),
          border: Border.all(
            color: BrandColors.error.withOpacity(0.5),
          ),
        ),
        child: Center(
          child: Text(
            l10n.failedToLoadBanks,
            style: context.body(color: BrandColors.error),
          ),
        ),
      ),
      data: (banks) {
        if (banks.isEmpty) {
          return Container(
            height: AppSizes.attachmentThumbSize * 0.48,
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm, vertical: AppSizes.md),
            decoration: BoxDecoration(
              color: BrandColors.errorBackgroundLight,
              borderRadius: BorderRadius.circular(AppSizes.xs),
              border: Border.all(
                color: BrandColors.error.withOpacity(0.5),
              ),
            ),
            child: Center(
              child: Text(
                'No banks available',
                style: context.body(color: BrandColors.error),
              ),
            ),
          );
        }

        return InkWell(
          onTap: () async {
            final selectedBankId = await showDialog<int>(
              context: context,
              builder: (context) => _buildBankSelectionDialog(context, banks),
            );
            if (selectedBankId != null && mounted) {
              final selectedBank = banks.firstWhere((b) => b.id == selectedBankId);
              setState(() {
                _selectedBankId = selectedBankId;
                _selectedBankName = selectedBank.name;
              });
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm, vertical: AppSizes.md),
            decoration: BoxDecoration(
              border: Border.all(color: BrandColors.outline),
              borderRadius: BorderRadius.circular(AppSizes.xs),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedBankName ?? l10n.selectBankRequired,
                  style: context.body(
                    color: _selectedBankName != null
                        ? BrandColors.textPrimary
                        : BrandColors.textSecondary,
                  ),
                ),
                Icon(Icons.arrow_drop_down, color: BrandColors.textSecondary),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBankSelectionDialog(BuildContext context, List<BankEntity> banks) {
    final l10n = AppLocalizations.of(context);

    return Dialog(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400, maxHeight: 400),
        padding: const EdgeInsets.all(AppSizes.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.selectBankRequired,
              style: context.title(bold: true),
            ),
            const SizedBox(height: AppSizes.md),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: banks.length,
                itemBuilder: (context, index) {
                  final bank = banks[index];
                  final isSelected = bank.id == _selectedBankId;

                  return ListTile(
                    title: Text(bank.name),
                    selected: isSelected,
                    onTap: () {
                      context.pop(bank.id);
                    },
                    trailing: isSelected
                        ? Icon(Icons.check, color: BrandColors.primary)
                        : null,
                  );
                },
              ),
            ),
            const SizedBox(height: AppSizes.md),
            TextButton(
              onPressed: () => context.pop(),
              child: Text(l10n.cancel),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReceiptAttachment(BuildContext context) {
    return AttachmentPicker(
      filePath: _attachmentFilePath,
      onChanged: (path) => setState(() => _attachmentFilePath = path),
      label: AppLocalizations.of(context).receipt,
      placeholder: AppLocalizations.of(context).attachReceiptOptional,
    );
  }

  void _handleSubmit() {
    // Validate bank selection for bank transfer
    if (_selectedMethod == PaymentMethodType.bankTransfer && _selectedBankId == null) {
      final snackbar = ref.read(snackbarServiceProvider);
      snackbar.showInfo('Please select a bank');
      return;
    }

    final amount = double.parse(_amountController.text.trim());
    final referenceNumber = _referenceNumberController.text.trim().isEmpty
        ? null
        : _referenceNumberController.text.trim();

    // Use existing id if editing, otherwise use temporary negative id
    final id = widget.initialPaymentMethod?.id ?? -(DateTime.now().millisecondsSinceEpoch);

    final paymentMethod = PaymentMethodModel(
      id: id,
      method: _selectedMethod.toApiString(),
      amount: amount,
      bankId: _selectedBankId,
      bankName: _selectedBankName,
      referenceNumber: referenceNumber,
      attachment: _attachmentFilePath, // Will be uploaded later, stored as file path for now
    );

    context.pop(paymentMethod);
  }
}

