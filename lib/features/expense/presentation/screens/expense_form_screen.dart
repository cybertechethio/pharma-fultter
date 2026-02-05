import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/enums/payment_method_type_enum.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/components/common/error_widget.dart' as app_err;
import '../../../../shared/components/forms/custom_text_field.dart';
import '../../../../shared/components/forms/custom_button.dart';
import '../../../../shared/components/forms/date_picker_field.dart';
import '../../../../shared/components/forms/dropdown.dart';
import '../../../bank/domain/entities/bank.dart';
import '../../../bank/presentation/providers/bank_notifier.dart';
import '../../../expense_category/domain/entities/expense_category.dart';
import '../../../expense_category/presentation/providers/expense_category_notifier.dart';
import '../providers/expense_notifier.dart';
import '../providers/expense_events.dart';
import '../providers/expense_loading_providers.dart';

class ExpenseFormScreen extends ConsumerStatefulWidget {
  const ExpenseFormScreen({super.key});

  @override
  ConsumerState<ExpenseFormScreen> createState() => _ExpenseFormScreenState();
}

class _ExpenseFormScreenState extends ConsumerState<ExpenseFormScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  final _notesController = TextEditingController();
  final _expenseDateController = TextEditingController();

  // State variables
  String? _selectedCategoryId;
  DateTime? _selectedDate;
  final List<String> _attachmentFilePaths = [];
  final List<Map<String, dynamic>> _paymentMethods = [];

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _expenseDateController.text = '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
    _selectedDate = now;
    _expenseDateController.addListener(_syncExpenseDate);
  }

  @override
  void dispose() {
    _expenseDateController.removeListener(_syncExpenseDate);
    _expenseDateController.dispose();
    _nameController.dispose();
    _amountController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _syncExpenseDate() {
    final t = _expenseDateController.text.trim();
    if (t.isEmpty) {
      setState(() => _selectedDate = null);
      return;
    }
    final d = DateTime.tryParse(t);
    setState(() => _selectedDate = d);
  }

  Future<void> _pickImages() async {
    try {
      final List<XFile> images = await _picker.pickMultiImage(
        imageQuality: 85,
        maxWidth: 1024,
        maxHeight: 1024,
      );

      if (images.isNotEmpty) {
        setState(() {
          _attachmentFilePaths.addAll(images.map((img) => img.path));
        });
      }
    } catch (e) {
      if (mounted) {
        final l10n = AppLocalizations.of(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.errorPickingImages(e.toString()))),
        );
      }
    }
  }

  void _removeImage(int index) {
    setState(() {
      _attachmentFilePaths.removeAt(index);
    });
  }

  void _previewImage(int index) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Stack(
          children: [
            Image.file(
              File(_attachmentFilePaths[index]),
              fit: BoxFit.contain,
            ),
            Positioned(
              top: AppSizes.sm,
              right: AppSizes.sm,
              child: IconButton(
                icon: Icon(Icons.close, color: BrandColors.textLight),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addPaymentMethod() {
    setState(() {
      _paymentMethods.add({
        'method': 'cash',
        'amount': 0.0,
        'referenceNumber': null,
        'bankId': null,
      });
    });
  }

  void _removePaymentMethod(int index) {
    setState(() {
      _paymentMethods.removeAt(index);
    });
  }

  void _updatePaymentMethod(int index, Map<String, dynamic> updatedMethod) {
    // Clear bank ID if payment method doesn't require bank
    final method = PaymentMethodType.values.firstWhere(
      (type) => type.toApiString() == updatedMethod['method'],
      orElse: () => PaymentMethodType.cash,
    );

    if (!method.requiresBank()) {
      updatedMethod = {...updatedMethod, 'bankId': null};
    }

    setState(() {
      _paymentMethods[index] = updatedMethod;
    });
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    final l10n = AppLocalizations.of(context);
    final expenseAmount = double.tryParse(_amountController.text.trim());
    if (expenseAmount == null || expenseAmount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.pleaseEnterValidAmount)),
      );
      return;
    }

    // Validate payment methods
    if (_paymentMethods.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.pleaseAddAtLeastOnePaymentMethod)),
      );
      return;
    }

    // Validate payment methods
    for (final method in _paymentMethods) {
      final paymentMethod = PaymentMethodType.values.firstWhere(
        (type) => type.toApiString() == method['method'],
        orElse: () => PaymentMethodType.cash,
      );

      // Check if bank transfer requires bank selection
      if (paymentMethod == PaymentMethodType.bankTransfer && method['bankId'] == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.pleaseSelectBankForBankTransfer)),
        );
        return;
      }

      // Check if reference number is required
      if (paymentMethod.requiresReferenceNumber() && (method['referenceNumber'] == null || method['referenceNumber'].toString().trim().isEmpty)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.referenceNumberRequired(paymentMethod.getDisplayLabel()))),
        );
        return;
      }
    }

    // Validate that payment method amounts add up to expense amount
    final totalPaymentAmount = _paymentMethods.fold<double>(
      0.0,
      (sum, method) => sum + (method['amount'] as double? ?? 0.0),
    );

    if ((totalPaymentAmount - expenseAmount).abs() > 0.01) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.paymentMethodsTotalMustEqual(totalPaymentAmount.toStringAsFixed(2), expenseAmount.toStringAsFixed(2)))),
      );
      return;
    }

    // Convert payment methods to API format
    final paymentMethods = _paymentMethods.map((method) {
      return {
        'method': method['method'],
        'amount': method['amount'],
        'referenceNumber': method['referenceNumber'],
        'bankId': method['bankId'],
      };
    }).toList();

    final expenseDate = _selectedDate;
    if (expenseDate == null) return;

    await ref.read(expenseProvider.notifier).createExpense(
      categoryId: _selectedCategoryId,
      expenseDate: expenseDate,
      name: _nameController.text.trim(),
      notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
      attachmentFilePaths: _attachmentFilePaths.isEmpty ? null : _attachmentFilePaths,
      paymentMethods: paymentMethods,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final creating = ref.watch(expenseCreateLoadingProvider);

    // Listen to events
    ref.listen<ExpenseUiEvent?>(
      expenseUiEventsProvider,
      (prev, next) {
        if (next == null) return;
        if (next is ExpenseCreated) {
          if (mounted) {
            context.pop();
          }
        }
        ref.read(expenseUiEventsProvider.notifier).clear();
      },
    );

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.createExpense,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        labelText: l10n.expenseName,
                        controller: _nameController,
                        prefixIcon: Icons.description_outlined,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return l10n.expenseNameRequired;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: AppSizes.lg),
                      CustomTextField(
                        labelText: l10n.expenseAmount,
                        controller: _amountController,
                        prefixIcon: Icons.attach_money,
                        inputType: TextInputType.number,
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
                      DatePickerField(
                        labelText: l10n.expenseDate,
                        controller: _expenseDateController,
                        prefixIcon: Icons.calendar_today_outlined,
                        firstDate: DateTime(2020),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                        validator: (v) =>
                            (v == null || v.trim().isEmpty) ? l10n.fieldRequired : null,
                      ),
                      const SizedBox(height: AppSizes.lg),
                      _buildExpenseCategoryDropdown(),
                      const SizedBox(height: AppSizes.lg),
                      CustomTextField(
                        labelText: l10n.notes,
                        controller: _notesController,
                        prefixIcon: Icons.notes_outlined,
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: AppSizes.xxl),

              // Attachments Section (title + add button on same row)
              Card(
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            l10n.attachments,
                            style: context.subtitle(bold: true),
                          ),
                          TextButton.icon(
                            onPressed: _pickImages,
                            icon: Icon(Icons.add, size: AppSizes.md2),
                            label: Text(l10n.add),
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppSizes.md,
                                vertical: AppSizes.xs,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (_attachmentFilePaths.isNotEmpty) ...[
                        const SizedBox(height: AppSizes.lg),
                        Wrap(
                          spacing: AppSizes.sm,
                          runSpacing: AppSizes.sm,
                          children: List.generate(
                            _attachmentFilePaths.length,
                            (index) => Stack(
                              children: [
                                GestureDetector(
                                  onTap: () => _previewImage(index),
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                                      border: Border.all(color: BrandColors.outline),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                                      child: Image.file(
                                        File(_attachmentFilePaths[index]),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: AppSizes.xs,
                                  right: AppSizes.xs,
                                  child: CircleAvatar(
                                    radius: AppSizes.md,
                                    backgroundColor: BrandColors.error,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      iconSize: AppSizes.lg,
                                      icon: Icon(Icons.close, color: BrandColors.textLight),
                                      onPressed: () => _removeImage(index),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              const SizedBox(height: AppSizes.xxl),

              // Payment Methods Section (title + add button on same row)
              Card(
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            l10n.paymentMethods,
                            style: context.subtitle(bold: true),
                          ),
                          TextButton.icon(
                            onPressed: _addPaymentMethod,
                            icon: Icon(Icons.add, size: AppSizes.md2),
                            label: Text(l10n.add),
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppSizes.md,
                                vertical: AppSizes.xs,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (_paymentMethods.isEmpty) ...[
                        const SizedBox(height: AppSizes.lg),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(AppSizes.xxl),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.payment,
                                  size: 64,
                                  color: BrandColors.textPrimary.withOpacity(0.3),
                                ),
                                const SizedBox(height: AppSizes.lg),
                                Text(
                                  l10n.noPaymentMethodsAdded,
                                  style: context.body(
                                    color: BrandColors.textPrimary.withOpacity(0.6),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ] else ...[
                        const SizedBox(height: AppSizes.lg),
                        ..._paymentMethods.asMap().entries.map((entry) {
                          final index = entry.key;
                          final method = entry.value;
                          return _buildPaymentMethodCard(context, index, method);
                        }),
                      ],
                    ],
                  ),
                ),
              ),

              const SizedBox(height: AppSizes.xxl),

              // Submit Button
              CustomButton(
                text: l10n.createExpense,
                onPressed: creating ? null : _handleSubmit,
                isLoading: creating,
              ),

              const SizedBox(height: AppSizes.lg),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethodCard(BuildContext context, int index, Map<String, dynamic> method) {
    final l10n = AppLocalizations.of(context);
    final paymentMethod = PaymentMethodType.values.firstWhere(
      (type) => type.toApiString() == method['method'],
      orElse: () => PaymentMethodType.cash,
    );

    return Card(
      margin: const EdgeInsets.only(bottom: AppSizes.sm),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  _getPaymentMethodIcon(paymentMethod),
                  color: BrandColors.primary,
                ),
                const SizedBox(width: AppSizes.sm),
                Text(
                  paymentMethod.getDisplayLabel(),
                  style: context.subtitle(bold: true),
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(Icons.delete, color: BrandColors.error),
                  onPressed: () => _removePaymentMethod(index),
                  tooltip: l10n.removePaymentMethod,
                ),
              ],
            ),
            const SizedBox(height: AppSizes.lg),

            // Amount field
            TextFormField(
              initialValue: method['amount'].toString(),
              decoration: InputDecoration(
                labelText: l10n.expenseAmount,
                prefixIcon: const Icon(Icons.attach_money),
                border: const OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
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
              onChanged: (value) {
                final amount = double.tryParse(value.trim()) ?? 0.0;
                _updatePaymentMethod(index, {
                  ...method,
                  'amount': amount,
                });
              },
            ),

            const SizedBox(height: AppSizes.md),

            // Reference number field (if required)
            if (paymentMethod.requiresReferenceNumber())
              TextFormField(
                initialValue: method['referenceNumber'] ?? '',
                decoration: InputDecoration(
                  labelText: l10n.referenceNumberLabel,
                  prefixIcon: const Icon(Icons.tag),
                  border: const OutlineInputBorder(),
                ),
                onChanged: (value) {
                  _updatePaymentMethod(index, {
                    ...method,
                    'referenceNumber': value.trim().isEmpty ? null : value.trim(),
                  });
                },
              ),

            const SizedBox(height: AppSizes.md),

            // Bank selector (only for bank transfer)
            if (paymentMethod == PaymentMethodType.bankTransfer)
              _buildBankSelector(context, index, method),

            const SizedBox(height: AppSizes.md),

            // Payment method selector
            _buildPaymentMethodSelector(context, index, paymentMethod),
          ],
        ),
      ),
    );
  }

  Widget _buildBankSelector(BuildContext context, int index, Map<String, dynamic> method) {
    final l10n = AppLocalizations.of(context);
    return Consumer(
      builder: (context, ref, child) {
        final banksAsync = ref.watch(bankProvider);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.bankRequired,
              style: context.label(
                color: BrandColors.textPrimary,
              ),
            ),
            const SizedBox(height: AppSizes.sm),
            banksAsync.when(
              loading: () => const SizedBox(
                height: 48,
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (error, stackTrace) => Container(
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                decoration: BoxDecoration(
                  color: BrandColors.error.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                  border: Border.all(
                    color: BrandColors.error.withOpacity(0.5),
                  ),
                ),
                child: Center(
                  child: Text(l10n.failedToLoadBanks),
                ),
              ),
              data: (banks) {
                final currentSelectedBankId = method['bankId'] as int?;
                final selectedBank = banks.cast<BankEntity?>().firstWhere(
                  (bank) => bank?.id == currentSelectedBankId,
                  orElse: () => null,
                );

                return InkWell(
                  onTap: () async {
                    final selectedBankId = await showDialog<int>(
                      context: context,
                      builder: (context) => _buildBankSelectionDialog(context, banks, currentSelectedBankId),
                    );
                    if (selectedBankId != null) {
                      _updatePaymentMethod(index, {
                        ...method,
                        'bankId': selectedBankId,
                      });
                    }
                  },
                  child: Container(
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                    decoration: BoxDecoration(
                      color: BrandColors.surface,
                      borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                      border: Border.all(
                        color: BrandColors.outline.withOpacity(0.5),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.account_balance,
                          color: BrandColors.textPrimary.withOpacity(0.6),
                          size: 20,
                        ),
                        const SizedBox(width: AppSizes.md),
                        Expanded(
                          child: Text(
                            selectedBank?.name ?? l10n.selectBankPlaceholder,
                            style: context.body(
                              color: selectedBank != null
                                  ? BrandColors.textPrimary
                                  : BrandColors.textPrimary.withOpacity(0.6),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: BrandColors.textPrimary.withOpacity(0.6),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildBankSelectionDialog(BuildContext context, List<dynamic> banks, int? selectedBankId) {
    final l10n = AppLocalizations.of(context);
    return AlertDialog(
      title: Text(l10n.selectBank),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: banks.length,
          itemBuilder: (context, index) {
            final bank = banks[index] as BankEntity;
            final isSelected = bank.id == selectedBankId;

            return ListTile(
              title: Text(bank.name),
              selected: isSelected,
              selectedTileColor: BrandColors.primaryContainer.withOpacity(0.3),
              onTap: () => Navigator.of(context).pop(bank.id),
              trailing: isSelected
                  ? Icon(Icons.check_circle, color: BrandColors.primary)
                  : null,
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.cancel),
        ),
      ],
    );
  }

  Widget _buildPaymentMethodSelector(BuildContext context, int index, PaymentMethodType currentMethod) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.paymentMethod,
          style: context.label(
            color: BrandColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSizes.sm),
        Wrap(
          spacing: AppSizes.sm,
          children: PaymentMethodType.values.map((method) {
            final isSelected = method == currentMethod;
            return ChoiceChip(
              label: Text(method.getDisplayLabel()),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  _updatePaymentMethod(index, {
                    'method': method.toApiString(),
                    'amount': _paymentMethods[index]['amount'] ?? 0.0,
                    'referenceNumber': method.requiresReferenceNumber() ? _paymentMethods[index]['referenceNumber'] : null,
                    'bankId': method.requiresBank() ? _paymentMethods[index]['bankId'] : null,
                  });
                }
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  IconData _getPaymentMethodIcon(PaymentMethodType method) {
    switch (method) {
      case PaymentMethodType.cash:
        return Icons.money;
      case PaymentMethodType.telebirr:
        return Icons.phone_android;
      case PaymentMethodType.mPesa:
        return Icons.phone_android;
      case PaymentMethodType.bankTransfer:
        return Icons.account_balance;
      case PaymentMethodType.check:
        return Icons.receipt;
    }
  }

  Widget _buildExpenseCategoryDropdown() {
    final l10n = AppLocalizations.of(context);
    final categoriesAsync = ref.watch(expenseCategoryProvider);

    return categoriesAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => app_err.ErrorsWidget(
        failure: error is Failure
            ? error
            : Failure.unexpectedError(error.toString()),
      ),
      data: (List<ExpenseCategory> categories) {
        if (categories.isEmpty) {
          return Container(
            padding: const EdgeInsets.all(AppSizes.sm),
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
                    l10n.noExpenseCategories,
                    style: context.small(
                      color: BrandColors.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return CustomDropdown<String?>(
          value: _selectedCategoryId,
          items: [
            DropdownItem<String?>(value: null, label: l10n.none),
            ...categories.map(
              (c) => DropdownItem<String?>(value: c.id, label: c.name),
            ),
          ],
          onChanged: (value) {
            setState(() => _selectedCategoryId = value);
          },
          label: l10n.category,
          hintText: l10n.selectCategory,
          hideLabel: true,
        );
      },
    );
  }
}
