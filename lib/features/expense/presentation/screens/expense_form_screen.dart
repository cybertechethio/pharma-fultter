import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/enums/payment_method_type_enum.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/forms/custom_text_field.dart';
import '../../../../shared/components/forms/custom_button.dart';
import '../../../bank/domain/entities/bank.dart';
import '../../../bank/presentation/providers/bank_notifier.dart';
import '../providers/expense_notifier.dart';
import '../providers/expense_events.dart';
import '../providers/expense_loading_providers.dart';
import '../widgets/expense_category_dropdown.dart';

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

  // State variables
  String? _selectedCategoryId;
  DateTime _selectedDate = DateTime.now();
  final List<String> _attachmentFilePaths = [];
  final List<Map<String, dynamic>> _paymentMethods = [];

  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error picking images: $e')),
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
              top: 8,
              right: 8,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
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

    final expenseAmount = double.tryParse(_amountController.text.trim());
    if (expenseAmount == null || expenseAmount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid amount')),
      );
      return;
    }

    // Validate payment methods
    if (_paymentMethods.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please add at least one payment method')),
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
          const SnackBar(content: Text('Please select a bank for bank transfer payment method')),
        );
        return;
      }

      // Check if reference number is required
      if (paymentMethod.requiresReferenceNumber() && (method['referenceNumber'] == null || method['referenceNumber'].toString().trim().isEmpty)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Reference number is required for ${paymentMethod.getDisplayLabel()}')),
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
        SnackBar(content: Text('Payment methods total (${totalPaymentAmount.toStringAsFixed(2)}) must equal expense amount (${expenseAmount.toStringAsFixed(2)})')),
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

    await ref.read(expenseProvider.notifier).createExpense(
      categoryId: _selectedCategoryId,
      expenseDate: _selectedDate,
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
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Basic Information Section
              _buildSection(
                context,
                title: 'Basic Information',
                children: [
                  CustomTextField(
                    labelText: 'Expense Name *',
                    controller: _nameController,
                    prefixIcon: Icons.description_outlined,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Expense name is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    labelText: 'Amount *',
                    controller: _amountController,
                    prefixIcon: Icons.attach_money,
                    inputType: TextInputType.number,
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
                  // Date Picker
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Expense Date *',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: _selectDate,
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Category Section
              _buildSection(
                context,
                title: 'Category',
                children: [
                  InkWell(
                    onTap: () async {
                      final selectedId = await showDialog<String>(
                        context: context,
                        builder: (context) => const ExpenseCategorySelectionDialog(),
                      );
                      if (selectedId != null) {
                        setState(() {
                          _selectedCategoryId = selectedId;
                        });
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.category,
                            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              _selectedCategoryId != null
                                  ? 'Category selected' // In real app, show category name
                                  : 'Select category (optional)',
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: _selectedCategoryId != null
                                    ? Theme.of(context).colorScheme.onSurface
                                    : Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Additional Information Section
              _buildSection(
                context,
                title: 'Additional Information',
                children: [
                  TextFormField(
                    controller: _notesController,
                    decoration: InputDecoration(
                      labelText: 'Notes',
                      prefixIcon: const Icon(Icons.notes),
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                    ),
                    maxLines: 3,
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Attachments Section
              _buildSection(
                context,
                title: 'Attachments',
                children: [
                  OutlinedButton.icon(
                    onPressed: _pickImages,
                    icon: const Icon(Icons.add_photo_alternate),
                    label: const Text('Add Attachments'),
                  ),
                  if (_attachmentFilePaths.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
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
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Theme.of(context).colorScheme.outline),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(
                                    File(_attachmentFilePaths[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 4,
                              right: 4,
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: Theme.of(context).colorScheme.error,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  iconSize: 16,
                                  icon: const Icon(Icons.close, color: Colors.white),
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

              const SizedBox(height: 24),

              // Payment Methods Section
              _buildSection(
                context,
                title: 'Payment Methods',
                children: [
                  if (_paymentMethods.isEmpty)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          children: [
                            Icon(
                              Icons.payment,
                              size: 64,
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No payment methods added',
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    ..._paymentMethods.asMap().entries.map((entry) {
                      final index = entry.key;
                      final method = entry.value;
                      return _buildPaymentMethodCard(context, index, method);
                    }),

                  const SizedBox(height: 16),

                  OutlinedButton.icon(
                    onPressed: _addPaymentMethod,
                    icon: const Icon(Icons.add),
                    label: const Text('Add Payment Method'),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Submit Button
              CustomButton(
                text: l10n.createExpense,
                onPressed: creating ? null : _handleSubmit,
                isLoading: creating,
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethodCard(BuildContext context, int index, Map<String, dynamic> method) {
    final paymentMethod = PaymentMethodType.values.firstWhere(
      (type) => type.toApiString() == method['method'],
      orElse: () => PaymentMethodType.cash,
    );

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  _getPaymentMethodIcon(paymentMethod),
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  paymentMethod.getDisplayLabel(),
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _removePaymentMethod(index),
                  tooltip: 'Remove payment method',
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Amount field
            TextFormField(
              initialValue: method['amount'].toString(),
              decoration: const InputDecoration(
                labelText: 'Amount *',
                prefixIcon: Icon(Icons.attach_money),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
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
              onChanged: (value) {
                final amount = double.tryParse(value.trim()) ?? 0.0;
                _updatePaymentMethod(index, {
                  ...method,
                  'amount': amount,
                });
              },
            ),

            const SizedBox(height: 12),

            // Reference number field (if required)
            if (paymentMethod.requiresReferenceNumber())
              TextFormField(
                initialValue: method['referenceNumber'] ?? '',
                decoration: InputDecoration(
                  labelText: 'Reference Number',
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

            const SizedBox(height: 12),

            // Bank selector (only for bank transfer)
            if (paymentMethod == PaymentMethodType.bankTransfer)
              _buildBankSelector(context, index, method),

            const SizedBox(height: 12),

            // Payment method selector
            _buildPaymentMethodSelector(context, index, paymentMethod),
          ],
        ),
      ),
    );
  }

  Widget _buildBankSelector(BuildContext context, int index, Map<String, dynamic> method) {
    return Consumer(
      builder: (context, ref, child) {
        final banksAsync = ref.watch(bankProvider);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bank *',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            banksAsync.when(
              loading: () => const SizedBox(
                height: 48,
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (error, stackTrace) => Container(
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.error.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.error.withOpacity(0.5),
                  ),
                ),
                child: const Center(
                  child: Text('Failed to load banks'),
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
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.account_balance,
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            selectedBank?.name ?? 'Select bank',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: selectedBank != null
                                  ? Theme.of(context).colorScheme.onSurface
                                  : Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
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
    return AlertDialog(
      title: const Text('Select Bank'),
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
              selectedTileColor: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
              onTap: () => Navigator.of(context).pop(bank.id),
              trailing: isSelected
                  ? Icon(Icons.check_circle, color: Theme.of(context).colorScheme.primary)
                  : null,
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
      ],
    );
  }

  Widget _buildPaymentMethodSelector(BuildContext context, int index, PaymentMethodType currentMethod) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Method',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
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
      case PaymentMethodType.other:
        return Icons.more_horiz;
    }
  }

  Widget _buildSection(BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }
}
