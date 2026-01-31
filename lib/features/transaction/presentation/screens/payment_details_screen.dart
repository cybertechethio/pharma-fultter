import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/enums/payment_method_type_enum.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../bank/presentation/providers/bank_notifier.dart';
import '../../../bank/domain/entities/bank.dart';
import '../../domain/entities/transaction_payment.dart';

// Type alias for cleaner code
typedef Bank = BankEntity;

/// Full screen for managing payment details
/// Supports multiple payment methods with attachments
class PaymentDetailsScreen extends ConsumerStatefulWidget {
  final double totalAmount;
  final List<TransactionPayment> initialPayments;
  final Map<String, String> initialAttachments;
  final void Function(List<TransactionPayment> payments, Map<String, String> attachments) onSave;

  const PaymentDetailsScreen({
    super.key,
    required this.totalAmount,
    required this.initialPayments,
    required this.initialAttachments,
    required this.onSave,
  });

  @override
  ConsumerState<PaymentDetailsScreen> createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends ConsumerState<PaymentDetailsScreen> {
  late List<_PaymentEntry> _payments;
  final _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _payments = widget.initialPayments.map((p) {
      return _PaymentEntry(
        method: p.method,
        amount: p.amount,
        referenceNumber: p.referenceNumber,
        bankId: p.bankId,
        attachmentPath: widget.initialAttachments[p.method.toApiString()],
      );
    }).toList();

    // Add default payment if empty
    if (_payments.isEmpty) {
      _payments.add(_PaymentEntry(
        method: PaymentMethodType.cash,
        amount: widget.totalAmount,
      ));
    }
  }

  double get _totalPaid {
    return _payments.fold(0.0, (sum, p) => sum + p.amount);
  }

  double get _remaining {
    return widget.totalAmount - _totalPaid;
  }

  void _addPayment() {
    final usedMethods = _payments.map((p) => p.method).toSet();
    final availableMethod = PaymentMethodType.values.firstWhere(
      (m) => !usedMethods.contains(m),
      orElse: () => PaymentMethodType.cash,
    );

    if (usedMethods.contains(availableMethod) && usedMethods.length == PaymentMethodType.values.length) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('All payment methods added')),
      );
      return;
    }

    setState(() {
      _payments.add(_PaymentEntry(
        method: availableMethod,
        amount: _remaining > 0 ? _remaining : 0,
      ));
    });
  }

  void _removePayment(int index) {
    if (_payments.length > 1) {
      setState(() {
        _payments.removeAt(index);
      });
    }
  }

  void _saveAndReturn() {
    final payments = _payments.map((p) {
      return TransactionPayment(
        method: p.method,
        amount: p.amount,
        referenceNumber: p.referenceNumber,
        bankId: p.bankId,
      );
    }).toList();

    final attachments = <String, String>{};
    for (final p in _payments) {
      if (p.attachmentPath != null) {
        attachments[p.method.toApiString()] = p.attachmentPath!;
      }
    }

    widget.onSave(payments, attachments);
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final banksAsync = ref.watch(bankProvider);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: CustomAppBar(
        title: 'Payment Details',
      ),
      body: Column(
        children: [
          // Amount due header
          _buildAmountHeader(theme, colorScheme),
          // Payment methods list
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // Section header
                Row(
                  children: [
                    Text(
                      'PAYMENT METHODS',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${_payments.length} method${_payments.length > 1 ? 's' : ''}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Payment entries
                ...List.generate(_payments.length, (index) {
                  final selectedMethods = _payments
                      .asMap()
                      .entries
                      .where((e) => e.key != index)
                      .map((e) => e.value.method)
                      .toList();

                  return banksAsync.when(
                    loading: () => const Center(child: CircularProgressIndicator()),
                    error: (_, __) => const Text('Error loading banks'),
                    data: (banks) {
                      return _PaymentMethodCard(
                        entry: _payments[index],
                        index: index,
                        selectedMethods: selectedMethods,
                        banks: banks,
                        canRemove: _payments.length > 1,
                        onChanged: (entry) {
                          setState(() {
                            _payments[index] = entry;
                          });
                        },
                        onRemove: () => _removePayment(index),
                        onPickAttachment: () => _pickAttachment(index),
                        onRemoveAttachment: () {
                          setState(() {
                            _payments[index] = _payments[index].copyWith(
                              attachmentPath: null,
                            );
                          });
                        },
                      );
                    },
                  );
                }),
                const SizedBox(height: 16),
                // Add payment button
                OutlinedButton.icon(
                  onPressed: _addPayment,
                  icon: const Icon(Icons.add_rounded),
                  label: const Text('Add Payment Method'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Summary and save button
          _buildFooter(theme, colorScheme),
        ],
      ),
    );
  }

  Widget _buildAmountHeader(ThemeData theme, ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primaryContainer.withOpacity(0.5),
            colorScheme.primaryContainer.withOpacity(0.2),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Text(
            'AMOUNT DUE',
            style: theme.textTheme.labelMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'ETB ${widget.totalAmount.toStringAsFixed(2)}',
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(ThemeData theme, ColorScheme colorScheme) {
    final isPaidInFull = (_remaining.abs() < 0.01);
    final isOverpaid = _remaining < -0.01;

    return Container(
      padding: EdgeInsets.fromLTRB(
        24,
        16,
        24,
        MediaQuery.of(context).padding.bottom + 16,
      ),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(
          top: BorderSide(color: colorScheme.outlineVariant),
        ),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Summary
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest.withOpacity(0.5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                _SummaryRow(
                  label: 'Total Due',
                  value: 'ETB ${widget.totalAmount.toStringAsFixed(2)}',
                ),
                const Divider(height: 16),
                _SummaryRow(
                  label: 'Total Paid',
                  value: 'ETB ${_totalPaid.toStringAsFixed(2)}',
                  valueColor: colorScheme.primary,
                ),
                const Divider(height: 16),
                _SummaryRow(
                  label: isOverpaid ? 'Change' : 'Remaining',
                  value: 'ETB ${_remaining.abs().toStringAsFixed(2)}',
                  valueColor: isPaidInFull
                      ? colorScheme.primary
                      : (isOverpaid ? colorScheme.tertiary : colorScheme.error),
                  isBold: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Save button
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: _saveAndReturn,
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.check_rounded, size: 20),
                  const SizedBox(width: 8),
                  const Text(
                    'Save Payment',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickAttachment(int index) async {
    try {
      final image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
        maxWidth: 1024,
        maxHeight: 1024,
      );

      if (image != null) {
        setState(() {
          _payments[index] = _payments[index].copyWith(
            attachmentPath: image.path,
          );
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error picking image: $e')),
        );
      }
    }
  }
}

class _PaymentEntry {
  final PaymentMethodType method;
  final double amount;
  final String? referenceNumber;
  final int? bankId;
  final String? attachmentPath;

  _PaymentEntry({
    required this.method,
    required this.amount,
    this.referenceNumber,
    this.bankId,
    this.attachmentPath,
  });

  _PaymentEntry copyWith({
    PaymentMethodType? method,
    double? amount,
    String? referenceNumber,
    int? bankId,
    String? attachmentPath,
  }) {
    return _PaymentEntry(
      method: method ?? this.method,
      amount: amount ?? this.amount,
      referenceNumber: referenceNumber ?? this.referenceNumber,
      bankId: bankId ?? this.bankId,
      attachmentPath: attachmentPath,
    );
  }
}

class _PaymentMethodCard extends StatefulWidget {
  final _PaymentEntry entry;
  final int index;
  final List<PaymentMethodType> selectedMethods;
  final List<Bank> banks;
  final bool canRemove;
  final ValueChanged<_PaymentEntry> onChanged;
  final VoidCallback onRemove;
  final VoidCallback onPickAttachment;
  final VoidCallback onRemoveAttachment;

  const _PaymentMethodCard({
    required this.entry,
    required this.index,
    required this.selectedMethods,
    required this.banks,
    required this.canRemove,
    required this.onChanged,
    required this.onRemove,
    required this.onPickAttachment,
    required this.onRemoveAttachment,
  });

  @override
  State<_PaymentMethodCard> createState() => _PaymentMethodCardState();
}

class _PaymentMethodCardState extends State<_PaymentMethodCard> {
  late TextEditingController _amountController;
  late TextEditingController _referenceController;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController(
      text: widget.entry.amount.toStringAsFixed(2),
    );
    _referenceController = TextEditingController(
      text: widget.entry.referenceNumber ?? '',
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    _referenceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final availableMethods = PaymentMethodType.values
        .where((m) => m == widget.entry.method || !widget.selectedMethods.contains(m))
        .toList();

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: colorScheme.outlineVariant.withOpacity(0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header with method selector
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Method icon
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: _getMethodColor(widget.entry.method).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    _getMethodIcon(widget.entry.method),
                    color: _getMethodColor(widget.entry.method),
                    size: 22,
                  ),
                ),
                const SizedBox(width: 12),
                // Method dropdown
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<PaymentMethodType>(
                      value: widget.entry.method,
                      isExpanded: true,
                      items: availableMethods.map((method) {
                        return DropdownMenuItem(
                          value: method,
                          child: Text(
                            _getMethodLabel(method),
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (method) {
                        if (method != null) {
                          widget.onChanged(widget.entry.copyWith(
                            method: method,
                            bankId: method.requiresBank() ? widget.entry.bankId : null,
                            referenceNumber: method.requiresReferenceNumber()
                                ? widget.entry.referenceNumber
                                : null,
                          ));
                        }
                      },
                    ),
                  ),
                ),
                // Remove button
                if (widget.canRemove)
                  IconButton(
                    onPressed: widget.onRemove,
                    icon: Icon(
                      Icons.delete_outline_rounded,
                      color: colorScheme.error,
                    ),
                  ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Form fields
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Amount field
                TextField(
                  controller: _amountController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                  ],
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    prefixText: 'ETB ',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                  onChanged: (value) {
                    final amount = double.tryParse(value) ?? 0;
                    widget.onChanged(widget.entry.copyWith(amount: amount));
                  },
                ),
                // Bank selector (conditional)
                if (widget.entry.method.requiresBank()) ...[
                  const SizedBox(height: 16),
                  DropdownButtonFormField<int>(
                    value: widget.entry.bankId,
                    decoration: InputDecoration(
                      labelText: 'Bank',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                    ),
                    items: widget.banks.map((bank) {
                      return DropdownMenuItem<int>(
                        value: bank.id,
                        child: Text(bank.name),
                      );
                    }).toList(),
                    onChanged: (bankId) {
                      widget.onChanged(widget.entry.copyWith(bankId: bankId));
                    },
                  ),
                ],
                // Reference number (conditional)
                if (widget.entry.method.requiresReferenceNumber()) ...[
                  const SizedBox(height: 16),
                  TextField(
                    controller: _referenceController,
                    decoration: InputDecoration(
                      labelText: 'Reference Number (Optional)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                    ),
                    onChanged: (value) {
                      widget.onChanged(widget.entry.copyWith(
                        referenceNumber: value.isEmpty ? null : value,
                      ));
                    },
                  ),
                ],
                // Attachment
                const SizedBox(height: 16),
                _buildAttachmentSection(theme, colorScheme),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttachmentSection(ThemeData theme, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Attachment (Optional)',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        if (widget.entry.attachmentPath != null)
          Stack(
            children: [
              GestureDetector(
                onTap: () => _showImagePreview(context, widget.entry.attachmentPath!),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: colorScheme.outlineVariant,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      File(widget.entry.attachmentPath!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Material(
                  color: colorScheme.error,
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    onTap: widget.onRemoveAttachment,
                    borderRadius: BorderRadius.circular(20),
                    child: const Padding(
                      padding: EdgeInsets.all(6),
                      child: Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        else
          OutlinedButton.icon(
            onPressed: widget.onPickAttachment,
            icon: const Icon(Icons.add_photo_alternate_rounded, size: 20),
            label: const Text('Add Attachment'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
      ],
    );
  }

  void _showImagePreview(BuildContext context, String path) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                File(path),
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton.filled(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close_rounded),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getMethodIcon(PaymentMethodType method) {
    switch (method) {
      case PaymentMethodType.cash:
        return Icons.payments_rounded;
      case PaymentMethodType.telebirr:
        return Icons.phone_android_rounded;
      case PaymentMethodType.mPesa:
        return Icons.phone_android_rounded;
      case PaymentMethodType.bankTransfer:
        return Icons.account_balance_rounded;
      case PaymentMethodType.check:
        return Icons.description_rounded;
      case PaymentMethodType.other:
        return Icons.more_horiz_rounded;
    }
  }

  Color _getMethodColor(PaymentMethodType method) {
    switch (method) {
      case PaymentMethodType.cash:
        return Colors.green;
      case PaymentMethodType.telebirr:
        return Colors.blue;
      case PaymentMethodType.mPesa:
        return Colors.green.shade700;
      case PaymentMethodType.bankTransfer:
        return Colors.indigo;
      case PaymentMethodType.check:
        return Colors.orange;
      case PaymentMethodType.other:
        return Colors.grey;
    }
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

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;
  final bool isBold;

  const _SummaryRow({
    required this.label,
    required this.value,
    this.valueColor,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: valueColor ?? colorScheme.onSurface,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

