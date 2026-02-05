import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../core/enums/payment_method_type_enum.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/forms/custom_text_field.dart';
import '../../../../shared/components/forms/custom_button.dart';
import '../../../bank/domain/entities/bank.dart';
import '../../../bank/presentation/providers/bank_notifier.dart';
import '../providers/expense_payment_methods_notifier.dart';
import '../providers/expense_events.dart';
import '../providers/expense_loading_providers.dart';

class PaymentMethodCreateDialog extends ConsumerStatefulWidget {
  final String expenseId;

  const PaymentMethodCreateDialog({
    super.key,
    required this.expenseId,
  });

  @override
  ConsumerState<PaymentMethodCreateDialog> createState() => _PaymentMethodCreateDialogState();
}

class _PaymentMethodCreateDialogState extends ConsumerState<PaymentMethodCreateDialog> {
  final _formKey = GlobalKey<FormState>();
  PaymentMethodType _selectedMethod = PaymentMethodType.cash;
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _referenceNumberController = TextEditingController();
  int? _selectedBankId;

  @override
  void dispose() {
    _amountController.dispose();
    _referenceNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final creating = ref.watch(expensePaymentMethodUpdateLoadingProvider).contains('creating');

    // Listen to events for navigation
    ref.listen<ExpenseUiEvent?>(
      expenseUiEventsProvider,
      (prev, next) {
        if (next == null) return;
        if (next is ExpensePaymentMethodUpdated && next.paymentMethodId == 'created') {
          if (mounted) {
            context.pop();
          }
        }
        ref.read(expenseUiEventsProvider.notifier).clear();
      },
    );

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
              offset: const Offset(0, AppSizes.sm),
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
                      AppLocalizations.of(context).addPaymentMethod,
                      style: context.subtitle(bold: true),
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
                          l10n.paymentMethod,
                          style: context.label(),
                        ),
                        const SizedBox(height: AppSizes.sm),
                        Wrap(
                          spacing: AppSizes.sm,
                          runSpacing: AppSizes.sm,
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
                        const SizedBox(height: AppSizes.xxl),
                        // Amount
                        CustomTextField(
                          controller: _amountController,
                          labelText: '${l10n.expenseAmount} *',
                          inputType: const TextInputType.numberWithOptions(decimal: true),
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
                        const SizedBox(height: AppSizes.lg),
                        // Reference Number (if required)
                        _selectedMethod.requiresReferenceNumber()
                          ? CustomTextField(
                              controller: _referenceNumberController,
                              labelText: l10n.referenceNumber,
                              validator: (value) {
                                if (_selectedMethod.requiresReferenceNumber() &&
                                    (value == null || value.trim().isEmpty)) {
                                  return l10n.referenceNumberRequired(_selectedMethod.getDisplayLabel());
                                }
                                return null;
                              },
                            )
                          : const SizedBox.shrink(),
                        _selectedMethod.requiresReferenceNumber()
                          ? const SizedBox(height: AppSizes.lg)
                          : const SizedBox.shrink(),
                        // Bank Selector (only for bank transfer)
                        _selectedMethod == PaymentMethodType.bankTransfer
                          ? _buildBankSelector(context)
                          : const SizedBox.shrink(),
                        _selectedMethod == PaymentMethodType.bankTransfer
                          ? const SizedBox(height: AppSizes.lg)
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
                text: l10n.addPaymentMethod,
                loadingText: l10n.creating,
                isLoading: creating,
                onPressed: creating
                    ? null
                    : () async {
                        if (!_formKey.currentState!.validate()) return;
                        if (!mounted) return;
                        await _handleSubmit();
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBankSelector(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final banksAsync = ref.watch(bankProvider);

    return banksAsync.when(
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) => Text('${l10n.failedToLoadBanks}: $error'),
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
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.lg),
            decoration: BoxDecoration(
              border: Border.all(color: BrandColors.outline),
              borderRadius: BorderRadius.circular(AppSizes.radiusXs),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedBank?.name ?? l10n.selectBankRequired,
                  style: selectedBank != null
                      ? context.body()
                      : context.bodySecondary(),
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
        padding: const EdgeInsets.all(AppSizes.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.selectBank,
              style: context.subtitle(bold: true),
            ),
            const SizedBox(height: AppSizes.lg),
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
                        ? Icon(Icons.check, color: BrandColors.primary)
                        : null,
                  );
                },
              ),
            ),
            const SizedBox(height: AppSizes.lg),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(l10n.cancel),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleSubmit() async {
    final l10n = AppLocalizations.of(context);
    if (!_formKey.currentState!.validate()) return;

    // Validate bank selection for bank transfer
    if (_selectedMethod == PaymentMethodType.bankTransfer && _selectedBankId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.pleaseSelectBank)),
      );
      return;
    }

    await ref.read(expensePaymentMethodsProvider.notifier).createPaymentMethod(
      expenseId: widget.expenseId,
      method: _selectedMethod.toApiString(),
      amount: _amountController.text.trim(),
      referenceNumber: _selectedMethod.requiresReferenceNumber()
          ? _referenceNumberController.text.trim()
          : null,
      bankId: _selectedMethod == PaymentMethodType.bankTransfer ? _selectedBankId : null,
    );
  }
}