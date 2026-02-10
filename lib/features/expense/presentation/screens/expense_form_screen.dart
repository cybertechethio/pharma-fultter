import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/components/common/error_widget.dart' as app_err;
import '../../../../shared/components/forms/custom_text_field.dart';
import '../../../../shared/components/forms/custom_button.dart';
import '../../../../shared/components/forms/date_picker_field.dart';
import '../../../transaction/presentation/widgets/payment_method_dialog.dart';
import '../../../transaction/data/models/payment_method_model.dart';
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
  DateTime? _selectedDate;
  final List<String> _attachmentFilePaths = [];
  final List<PaymentMethodModel> _paymentMethods = [];
  final Map<String, String> _paymentAttachmentFilePaths = {};

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


  void _removePaymentMethod(int index) {
    setState(() {
      _paymentMethods.removeAt(index);
    });
  }

  void _updatePaymentMethod(int index, PaymentMethodModel updatedMethod) {
    setState(() {
      _paymentMethods[index] = updatedMethod;
    });
  }

  Future<void> _showPaymentMethodDialog({PaymentMethodModel? initialMethod, int? index}) async {
    final existingMethods = index != null
        ? _paymentMethods.where((method) => method != _paymentMethods[index]).toList()
        : _paymentMethods;

    final attachmentPath = initialMethod != null
        ? _paymentAttachmentFilePaths[initialMethod.method]
        : null;

    final result = await PaymentMethodDialog.show(
      context,
      initialPaymentMethod: initialMethod,
      initialAttachmentFilePath: attachmentPath,
      existingPaymentMethods: existingMethods,
    );

    if (result != null && mounted) {
      if (index != null) {
        _updatePaymentMethod(index, result);
      } else {
        setState(() {
          _paymentMethods.add(result);
        });
      }

      // Store attachment file path if exists
      if (result.attachment != null && result.attachment!.isNotEmpty) {
        _paymentAttachmentFilePaths[result.method] = result.attachment!;
      }
    }
  }

  Widget _buildExpensePaymentMethodsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Methods (${_paymentMethods.length})',
          style: context.subtitle(),
        ),
        SizedBox(height: AppSizes.md),
        ..._paymentMethods.asMap().entries.map((entry) {
          final index = entry.key;
          final method = entry.value;
          return _buildExpensePaymentMethodCard(method, index);
        }),
      ],
    );
  }

  Widget _buildExpensePaymentMethodCard(PaymentMethodModel method, int index) {
    final l10n = AppLocalizations.of(context);

    return Container(
      margin: EdgeInsets.only(bottom: AppSizes.sm),
      padding: const EdgeInsets.all(AppSizes.sm),
      decoration: BoxDecoration(
        color: BrandColors.surfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(AppSizes.radius),
        border: Border.all(
          color: BrandColors.outline.withOpacity(0.2),
        ),
      ),
      child: Row(
        children: [
          // Show receipt image if exists, otherwise show icon
          _buildPaymentMethodLeading(method),
          SizedBox(width: AppSizes.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  method.method.toUpperCase(),
                  style: context.body(bold: true),
                ),
                if (method.bankName != null) ...[
                  SizedBox(height: AppSizes.xs),
                  Text(
                    method.bankName!,
                    style: context.small(),
                  ),
                ],
                if (method.referenceNumber != null) ...[
                  SizedBox(height: AppSizes.xs),
                  Text(
                    'Ref: ${method.referenceNumber}',
                    style: context.small(),
                  ),
                ],
                if (method.attachment != null && method.attachment!.isNotEmpty) ...[
                  SizedBox(height: AppSizes.xs),
                  Row(
                    children: [
                      Icon(
                        Icons.attach_file,
                        size: AppSizes.iconSizeSm,
                        color: BrandColors.primary,
                      ),
                      SizedBox(width: AppSizes.xs),
                      Text(
                        'Receipt attached',
                        style: context.smallPrimary(bold: true),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          Text(
            'ETB ${method.amount}',
            style: context.body(bold: true, color: BrandColors.primary),
          ),
          SizedBox(width: AppSizes.sm),
          IconButton(
            icon: Icon(Icons.edit, size: AppSizes.iconSizeSm),
            color: BrandColors.primary,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () => _showPaymentMethodDialog(initialMethod: method, index: index),
          ),
          SizedBox(width: AppSizes.xs),
          IconButton(
            icon: Icon(Icons.delete_outline, size: AppSizes.iconSizeSm),
            color: BrandColors.error,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () => _removePaymentMethod(index),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodLeading(PaymentMethodModel method) {
    // Check if attachment exists and is a file path (not URL)
    final hasAttachment = method.attachment != null &&
        method.attachment!.isNotEmpty &&
        !method.attachment!.startsWith('http');

    // Also check form state for attachment file path
    final attachmentPath = _paymentAttachmentFilePaths[method.method];
    final filePath = attachmentPath ?? (hasAttachment ? method.attachment : null);

    if (filePath != null) {
      return GestureDetector(
        onTap: () => _showImagePreview(filePath),
        child: Container(
          width: AppSizes.attachmentThumbSize * 0.4,
          height: AppSizes.attachmentThumbSize * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.radiusSm),
            border: Border.all(
              color: BrandColors.outline.withOpacity(0.2),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.radiusSm),
            child: Image.file(
              File(filePath),
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                // Fallback to icon if image fails to load
                return Icon(
                  _getPaymentMethodIcon(method.method),
                  size: AppSizes.iconSize,
                  color: BrandColors.primary,
                );
              },
            ),
          ),
        ),
      );
    }

    // Default icon if no attachment
    return Icon(
      _getPaymentMethodIcon(method.method),
      size: AppSizes.iconSize,
      color: BrandColors.primary,
    );
  }

  IconData _getPaymentMethodIcon(String method) {
    switch (method) {
      case 'cash':
        return Icons.money;
      case 'telebirr':
      case 'mPesa':
        return Icons.phone_android;
      case 'bankTransfer':
        return Icons.account_balance;
      case 'check':
        return Icons.receipt;
      default:
        return Icons.payment;
    }
  }

  void _showImagePreview(String filePath) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Stack(
          children: [
            Image.file(
              File(filePath),
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

    // Validate that payment method amounts add up to expense amount
    final totalPaymentAmount = _paymentMethods.fold<double>(
      0.0,
      (sum, method) => sum + method.amount,
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
        'method': method.method,
        'amount': method.amount,
        'referenceNumber': method.referenceNumber,
        'bankId': method.bankId,
        'attachment': method.attachment, // Add attachment field
      };
    }).toList();

    final expenseDate = _selectedDate;
    if (expenseDate == null) return;

    await ref.read(expenseProvider.notifier).createExpense(
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
                        SizedBox(
                          height: 100,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                _attachmentFilePaths.length,
                                (index) => Container(
                                  margin: EdgeInsets.only(
                                    right: index < _attachmentFilePaths.length - 1 ? AppSizes.sm : 0,
                                  ),
                                  child: Stack(
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
                            onPressed: () => _showPaymentMethodDialog(),
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
                        _buildExpensePaymentMethodsList(),
                      ],
                    ],
                  ),
                ),
              ),

              const SizedBox(height: AppSizes.xxl),

              // Submit Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
                child: CustomButton(
                  text: l10n.createExpense,
                  onPressed: creating ? null : _handleSubmit,
                  isLoading: creating,
                ),
              ),

              const SizedBox(height: AppSizes.lg),
            ],
          ),
        ),
      ),
    );
  }


}
