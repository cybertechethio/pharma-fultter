import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../core/enums/payment_method_type_enum.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/forms/custom_text_field.dart';
import '../../../../shared/components/forms/custom_button.dart';
import '../../../bank/domain/entities/bank.dart';
import '../../../bank/presentation/providers/bank_notifier.dart';

class PaymentMethodEditDialog extends ConsumerStatefulWidget {
  final String initialMethod;
  final String initialAmount;
  final String? initialReferenceNumber;
  final int? initialBankId;

  const PaymentMethodEditDialog({
    super.key,
    required this.initialMethod,
    required this.initialAmount,
    this.initialReferenceNumber,
    this.initialBankId,
  });

  @override
  ConsumerState<PaymentMethodEditDialog> createState() => _PaymentMethodEditDialogState();
}

class _PaymentMethodEditDialogState extends ConsumerState<PaymentMethodEditDialog> {
  final _formKey = GlobalKey<FormState>();
  late PaymentMethodType _selectedMethod;
  late TextEditingController _amountController;
  late TextEditingController _referenceNumberController;
  int? _selectedBankId;

  @override
  void initState() {
    super.initState();
    _selectedMethod = PaymentMethodType.values.firstWhere(
      (type) => type.toApiString() == widget.initialMethod,
      orElse: () => PaymentMethodType.cash,
    );
    _amountController = TextEditingController(text: widget.initialAmount);
    _referenceNumberController = TextEditingController(text: widget.initialReferenceNumber ?? '');
    _selectedBankId = widget.initialBankId;
  }

  @override
  void dispose() {
    _amountController.dispose();
    _referenceNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
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
                      'Edit Payment Method',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: BrandColors.textPrimary,
                      ),
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
                    tooltip: l10n.cancel,
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
                  constraints: const BoxConstraints(maxHeight: 400),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Payment Method Type
                        Text(
                          'Payment Method',
                          style: theme.textTheme.labelLarge,
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: PaymentMethodType.values.map((method) {
                            final isSelected = method == _selectedMethod;
                            return ChoiceChip(
                              label: Text(method.getDisplayLabel()),
                              selected: isSelected,
                              onSelected: (selected) {
                                if (selected) {
                                  setState(() {
                                    _selectedMethod = method;
                                    // Clear bank ID if method doesn't require bank
                                    if (!method.requiresBank()) {
                                      _selectedBankId = null;
                                    }
                                  });
                                }
                              },
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 24),
                        // Amount
                        CustomTextField(
                          controller: _amountController,
                          labelText: 'Amount *',
                          inputType: const TextInputType.numberWithOptions(decimal: true),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Amount is required';
                            }
                            final amount = double.tryParse(value.trim());
                            if (amount == null || amount <= 0) {
                              return 'Please enter a valid amount';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        // Reference Number (if required)
                        _selectedMethod.requiresReferenceNumber()
                          ? CustomTextField(
                              controller: _referenceNumberController,
                              labelText: 'Reference Number',
                              validator: (value) {
                                if (_selectedMethod.requiresReferenceNumber() &&
                                    (value == null || value.trim().isEmpty)) {
                                  return 'Reference number is required';
                                }
                                return null;
                              },
                            )
                          : const SizedBox.shrink(),
                        _selectedMethod.requiresReferenceNumber()
                          ? const SizedBox(height: 16)
                          : const SizedBox.shrink(),
                        // Bank Selector (only for bank transfer)
                        _selectedMethod == PaymentMethodType.bankTransfer
                          ? _buildBankSelector(context)
                          : const SizedBox.shrink(),
                        _selectedMethod == PaymentMethodType.bankTransfer
                          ? const SizedBox(height: 16)
                          : const SizedBox.shrink(),
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
                text: 'Update Payment Method',
                onPressed: _handleSubmit,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBankSelector(BuildContext context) {
    final banksAsync = ref.watch(bankProvider);
    final theme = Theme.of(context);

    return banksAsync.when(
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) => Text('Failed to load banks: $error'),
      data: (banks) {
        final selectedBank = banks.cast<BankEntity?>().firstWhere(
          (bank) => bank?.id == _selectedBankId,
          orElse: () => null,
        );

        return InkWell(
          onTap: () async {
            final selectedBankId = await showDialog<int>(
              context: context,
              builder: (context) => _buildBankSelectionDialog(context, banks),
            );
            if (selectedBankId != null && mounted) {
              setState(() {
                _selectedBankId = selectedBankId;
              });
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(color: theme.colorScheme.outline),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedBank?.name ?? 'Select Bank *',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: selectedBank != null
                        ? theme.colorScheme.onSurface
                        : theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                Icon(Icons.arrow_drop_down, color: theme.colorScheme.onSurfaceVariant),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBankSelectionDialog(BuildContext context, List<BankEntity> banks) {
    final theme = Theme.of(context);

    return Dialog(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400, maxHeight: 400),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Select Bank',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
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
                      Navigator.of(context).pop(bank.id);
                    },
                    trailing: isSelected
                        ? Icon(Icons.check, color: theme.colorScheme.primary)
                        : null,
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmit() {
    if (!_formKey.currentState!.validate()) return;

    // Validate bank selection for bank transfer
    if (_selectedMethod == PaymentMethodType.bankTransfer && _selectedBankId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a bank')),
      );
      return;
    }

    final result = <String, dynamic>{
      'method': _selectedMethod.toApiString(),
      'amount': _amountController.text.trim(),
    };

    if (_selectedMethod.requiresReferenceNumber()) {
      result['referenceNumber'] = _referenceNumberController.text.trim().isEmpty
          ? null
          : _referenceNumberController.text.trim();
    } else {
      result['referenceNumber'] = null;
    }

    if (_selectedMethod == PaymentMethodType.bankTransfer) {
      result['bankId'] = _selectedBankId;
    } else {
      result['bankId'] = null;
    }

    Navigator.of(context).pop(result);
  }
}