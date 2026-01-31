import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../core/enums/payment_method_type_enum.dart';
import '../../../bank/presentation/providers/bank_notifier.dart';
import '../../../../shared/components/forms/dropdown.dart';
import '../../../../shared/components/forms/custom_text_field.dart';
import '../../domain/entities/transaction_payment.dart';

class PaymentMethodForm extends ConsumerStatefulWidget {
  final TransactionPayment? initial;
  final Function(TransactionPayment) onChanged;
  final Function(String?) onAttachmentChanged;
  final Function() onRemove;
  final int index;
  final List<PaymentMethodType>? selectedMethods; // Already selected payment methods

  const PaymentMethodForm({
    super.key,
    this.initial,
    required this.onChanged,
    required this.onAttachmentChanged,
    required this.onRemove,
    required this.index,
    this.selectedMethods,
  });

  @override
  ConsumerState<PaymentMethodForm> createState() => _PaymentMethodFormState();
}

class _PaymentMethodFormState extends ConsumerState<PaymentMethodForm> {
  late PaymentMethodType _selectedMethod;
  late TextEditingController _amountController;
  late TextEditingController _referenceNumberController;
  int? _selectedBankId;
  String? _attachmentPath;

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _selectedMethod = widget.initial?.method ?? PaymentMethodType.cash;
    _amountController = TextEditingController(
      text: widget.initial?.amount.toString() ?? '',
    )..addListener(_updateModel);
    _referenceNumberController = TextEditingController(
      text: widget.initial?.referenceNumber ?? '',
    )..addListener(_updateModel);
    _selectedBankId = widget.initial?.bankId;
    // Defer update to avoid setState during build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _updateModel();
      }
    });
  }

  @override
  void dispose() {
    _amountController.dispose();
    _referenceNumberController.dispose();
    super.dispose();
  }

  void _updateModel() {
    widget.onChanged(
      TransactionPayment(
        method: _selectedMethod,
        amount: double.tryParse(_amountController.text) ?? 0.0,
        referenceNumber: _referenceNumberController.text.trim().isEmpty
            ? null
            : _referenceNumberController.text.trim(),
        bankId: _selectedBankId,
      ),
    );
  }

  Future<void> _pickAttachment() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
        maxWidth: 1024,
        maxHeight: 1024,
      );

      if (image != null) {
        setState(() {
          _attachmentPath = image.path;
        });
        _updateModel();
        widget.onAttachmentChanged(_attachmentPath);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error picking image: $e')),
        );
      }
    }
  }

  void _previewAttachment() {
    if (_attachmentPath == null) return;
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Stack(
          children: [
            Image.file(
              File(_attachmentPath!),
              fit: BoxFit.contain,
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: const Icon(Icons.close, color: BrandColors.textLight),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final banksAsync = ref.watch(bankProvider);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colorScheme.surfaceVariant.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: colorScheme.outline.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Payment Method ${widget.index + 1}',
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  color: colorScheme.error,
                  onPressed: widget.onRemove,
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Payment method type
            _buildPaymentMethodDropdown(theme, colorScheme),
            const SizedBox(height: 16),
            // Amount
            CustomTextField(
              labelText: 'Amount *',
              controller: _amountController,
              inputType: const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 16),
            // Reference number (conditional, optional)
            if (_selectedMethod.requiresReferenceNumber()) ...[
              CustomTextField(
                labelText: 'Reference Number (Optional)',
                controller: _referenceNumberController,
              ),
              const SizedBox(height: 16),
            ],
            // Bank selection (conditional)
            if (_selectedMethod.requiresBank()) ...[
              banksAsync.when(
                loading: () => const CircularProgressIndicator(),
                data: (banks) {
                  final dropdownItems = banks
                      .map((bank) => DropdownItem<int>(
                            value: bank.id,
                            label: bank.name,
                          ))
                      .toList();

                  return CustomDropdown<int>(
                    value: _selectedBankId,
                    items: dropdownItems,
                    onChanged: (value) {
                      setState(() {
                        _selectedBankId = value;
                      });
                      _updateModel();
                    },
                    label: 'Bank *',
                    hintText: 'Select a bank',
                    required: true,
                    searchable: true,
                  );
                },
                error: (error, stack) => const Text('Error loading banks'),
              ),
              const SizedBox(height: 16),
            ],
            // Attachment
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Attachment (Optional)',
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    OutlinedButton.icon(
                      onPressed: _pickAttachment,
                      icon: const Icon(Icons.add_photo_alternate),
                      label: const Text('Add Attachment'),
                    ),
                    if (_attachmentPath != null) ...[
                      const SizedBox(width: 8),
                      Expanded(
                        child: GestureDetector(
                          onTap: _previewAttachment,
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: colorScheme.outline),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                File(_attachmentPath!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(Icons.delete_outline),
                        color: colorScheme.error,
                        onPressed: () {
                          setState(() {
                            _attachmentPath = null;
                          });
                          _updateModel();
                          widget.onAttachmentChanged(null);
                        },
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodDropdown(ThemeData theme, ColorScheme colorScheme) {
    // Get all payment methods
    final allMethods = PaymentMethodType.values;
    
    // Filter out already selected methods (except the current one)
    final availableMethods = widget.selectedMethods != null
        ? allMethods.where((method) {
            // Include current method or methods not in selected list
            return method == _selectedMethod || !widget.selectedMethods!.contains(method);
          }).toList()
        : allMethods;
    
    final dropdownItems = availableMethods
        .map((method) => DropdownItem<PaymentMethodType>(
              value: method,
              label: _getMethodLabel(method),
            ))
        .toList();

    return CustomDropdown<PaymentMethodType>(
      value: _selectedMethod,
      items: dropdownItems,
      onChanged: (value) {
        if (value != null) {
          setState(() {
            _selectedMethod = value;
            // Clear bank selection if method doesn't require it
            if (!value.requiresBank()) {
              _selectedBankId = null;
            }
            // Clear reference if method doesn't require it
            if (!value.requiresReferenceNumber()) {
              _referenceNumberController.clear();
            }
          });
          _updateModel();
        }
      },
      label: 'Payment Method *',
      hintText: 'Select payment method',
      required: true,
    );
  }

  String _getMethodLabel(PaymentMethodType method) {
    switch (method) {
      case PaymentMethodType.cash:
        return 'Cash';
      case PaymentMethodType.telebirr:
        return 'Telebirr';
      case PaymentMethodType.mPesa:
        return 'M-Pesa';
      case PaymentMethodType.bankTransfer:
        return 'Bank Transfer';
      case PaymentMethodType.check:
        return 'Check';
      case PaymentMethodType.other:
        return 'Other';
    }
  }
}

