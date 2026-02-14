import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../../../core/enums/payment_method_type_enum.dart';
import '../../../../../core/services/snackbar_service.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/components/forms/custom_text_field.dart';
import '../../../../../shared/components/forms/custom_button.dart';
import '../../../../../shared/utils/formatters.dart';
import '../../../../transaction/data/models/payment_method_model.dart';
import '../../../../transaction/presentation/widgets/payment_method_dialog.dart';
import '../../../data/models/supplier_customer_payment_request.dart';
import '../../../domain/entities/supplier_customer.dart';
import '../../providers/supplier_customer_notifier.dart';
import '../../providers/supplier_customer_loading_providers.dart';
import '../../providers/supplier_customer_events.dart';

class SupplierCustomerPaymentDialog extends ConsumerStatefulWidget {
  final SupplierCustomer supplierCustomer;
  final bool isRefund;

  const SupplierCustomerPaymentDialog({
    super.key,
    required this.supplierCustomer,
    required this.isRefund,
  });

  static Future<void> show(
    BuildContext context, {
    required SupplierCustomer supplierCustomer,
    required bool isRefund,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => SupplierCustomerPaymentDialog(
        supplierCustomer: supplierCustomer,
        isRefund: isRefund,
      ),
    );
  }

  @override
  ConsumerState<SupplierCustomerPaymentDialog> createState() =>
      _SupplierCustomerPaymentDialogState();
}

class _SupplierCustomerPaymentDialogState
    extends ConsumerState<SupplierCustomerPaymentDialog> {
  final _formKey = GlobalKey<FormState>();
  final _notesController = TextEditingController();

  List<PaymentMethodModel> _paymentMethods = [];
  Map<String, String> _attachmentFilePaths = {}; // method type -> file path

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  double get _totalPaid => _paymentMethods.fold(0.0, (sum, pm) => sum + pm.amount);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final isLoading = widget.isRefund
        ? ref.watch(refundLoadingProvider)
        : ref.watch(addBalanceLoadingProvider);

    final scType = widget.supplierCustomer.type;
    final scId = widget.supplierCustomer.id;

    // Listen for events to handle success/failure
    ref.listen<SupplierCustomerUiEvent?>(
      supplierCustomerUiEventsProvider(scType),
      (prev, next) {
        if (next == null) return;

        if ((next is AddBalanceSuccess && !widget.isRefund) ||
            (next is RefundSuccess && widget.isRefund)) {
          final matches = (next is AddBalanceSuccess && (next.customerId == scId || next.supplierId == scId)) ||
              (next is RefundSuccess && (next.customerId == scId || next.supplierId == scId));
          if (matches && mounted) {
            ref.read(supplierCustomerUiEventsProvider(scType).notifier).clear();
            ref.read(snackbarServiceProvider).showSuccess(
              widget.isRefund ? l10n.refundSuccess : l10n.addBalanceSuccess,
            );
            context.pop();
          }
        } else if (next is SupplierCustomerFailure) {
          ref.read(snackbarServiceProvider).showError(next.failure);
        }
      },
    );

    return Dialog(
      elevation: 0,
      backgroundColor: BrandColors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: AppSizes.lg, vertical: AppSizes.xl),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500, maxHeight: 700),
        decoration: BoxDecoration(
          color: BrandColors.surface,
          borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            _buildHeader(context, isLoading, l10n),
            // Content
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSizes.lg),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Customer info
                      _buildCustomerInfo(context, l10n),
                      const SizedBox(height: AppSizes.lg),

                      // Notes
                      CustomTextField(
                        controller: _notesController,
                        labelText: '${l10n.notes} (${l10n.optional})',
                        maxLines: 3,
                        subtle: true,
                      ),
                      const SizedBox(height: AppSizes.lg),

                      // Payment Summary
                      _buildPaymentSummary(context, l10n),
                      const SizedBox(height: AppSizes.md),

                      // Payment Methods List
                      if (_paymentMethods.isNotEmpty) ...[
                        _buildPaymentMethodsList(context, l10n),
                        const SizedBox(height: AppSizes.md),
                      ],

                      // Add Payment Method Button
                      _buildAddPaymentButton(context, l10n),
                    ],
                  ),
                ),
              ),
            ),
            // Actions
            _buildActions(context, isLoading, l10n),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isLoading, AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: BrandColors.outline.withValues(alpha: 0.2))),
      ),
      child: Row(
        children: [
          Icon(
            widget.isRefund ? Icons.replay_outlined : Icons.add_circle_outline,
            color: widget.isRefund ? BrandColors.warning : BrandColors.success,
          ),
          const SizedBox(width: AppSizes.sm),
          Expanded(
            child: Text(
              widget.isRefund ? l10n.refund : l10n.addBalance,
              style: context.subtitle(bold: true),
            ),
          ),
          IconButton(
            onPressed: isLoading ? null : () => context.pop(),
            icon: Icon(Icons.close, color: BrandColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerInfo(BuildContext context, AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: BrandColors.primaryContainer.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
      ),
      child: Row(
        children: [
          Icon(Icons.person, color: BrandColors.primary, size: AppSizes.iconSize),
          const SizedBox(width: AppSizes.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.supplierCustomer.name,
                  style: context.subtitle(bold: true),
                ),
                Text(
                  '${l10n.balance}: ${Formatters.formatCurrency(double.tryParse(widget.supplierCustomer.balance) ?? 0)}',
                  style: context.smallSecondary(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentSummary(BuildContext context, AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: BrandColors.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(l10n.totalAmount, style: context.body()),
          Text(
            Formatters.formatCurrency(_totalPaid),
            style: context.bodyPrimary(bold: true),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodsList(BuildContext context, AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${l10n.paymentMethods} (${_paymentMethods.length})',
          style: context.subtitle(),
        ),
        const SizedBox(height: AppSizes.sm),
        ..._paymentMethods.asMap().entries.map((entry) {
          final index = entry.key;
          final method = entry.value;
          final methodType = PaymentMethodTypeExtension.fromString(method.method);
          final attachmentPath = _attachmentFilePaths[method.method];

          return Container(
            margin: const EdgeInsets.only(bottom: AppSizes.sm),
            padding: const EdgeInsets.all(AppSizes.md),
            decoration: BoxDecoration(
              color: BrandColors.surfaceContainerHighest.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(AppSizes.radiusSm),
              border: Border.all(color: BrandColors.outline.withValues(alpha: 0.2)),
            ),
            child: Row(
              children: [
                _buildPaymentIcon(method, methodType, attachmentPath),
                const SizedBox(width: AppSizes.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        methodType.getDisplayLabel().toUpperCase(),
                        style: context.body(bold: true),
                      ),
                      if (method.bankName != null)
                        Text(method.bankName!, style: context.small()),
                      if (method.referenceNumber != null)
                        Text(l10n.refLabel(method.referenceNumber ?? ''), style: context.small()),
                      if (attachmentPath != null)
                        Row(
                          children: [
                            Icon(Icons.attach_file, size: AppSizes.md, color: BrandColors.primary),
                            const SizedBox(width: AppSizes.xxs),
                            Text(
                              l10n.receipt,
                              style: context.smallPrimary(),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                Text(
                  Formatters.formatCurrency(method.amount),
                  style: context.bodyPrimary(bold: true),
                ),
                const SizedBox(width: AppSizes.sm),
                IconButton(
                  icon: const Icon(Icons.edit, size: AppSizes.md2),
                  color: BrandColors.primary,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () => _editPaymentMethod(index),
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline, size: AppSizes.md2),
                  color: BrandColors.error,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () => _removePaymentMethod(index),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildPaymentIcon(
    PaymentMethodModel method,
    PaymentMethodType methodType,
    String? attachmentPath,
  ) {
    if (attachmentPath != null) {
      return Container(
        width: AppSizes.xxxxl - AppSizes.xs,
        height: AppSizes.xxxxl - AppSizes.xs,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.xs2),
          border: Border.all(color: BrandColors.outline.withValues(alpha: 0.2)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.xs2),
          child: Image.file(File(attachmentPath), fit: BoxFit.cover),
        ),
      );
    }
    return Icon(methodType.getIcon(), size: AppSizes.iconSize, color: BrandColors.primary);
  }

  Widget _buildAddPaymentButton(BuildContext context, AppLocalizations l10n) {
    return OutlinedButton.icon(
      onPressed: _addPaymentMethod,
      icon: const Icon(Icons.add),
      label: Text(l10n.addPaymentMethod),
      style: OutlinedButton.styleFrom(
        foregroundColor: BrandColors.primary,
        side: BorderSide(color: BrandColors.primary),
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg, vertical: AppSizes.md),
      ),
    );
  }

  Widget _buildActions(BuildContext context, bool isLoading, AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        color: BrandColors.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(AppSizes.radiusLg),
          bottomRight: Radius.circular(AppSizes.radiusLg),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: isLoading ? null : () => context.pop(),
              child: Text(l10n.cancel),
            ),
          ),
          const SizedBox(width: AppSizes.md),
          Expanded(
            flex: 2,
            child: CustomButton(
              text: widget.isRefund ? l10n.refund : l10n.addBalance,
              onPressed: isLoading ? null : _handleSubmit,
              isLoading: isLoading,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _addPaymentMethod() async {
    final result = await PaymentMethodDialog.show(
      context,
      existingPaymentMethods: _paymentMethods,
    );

    if (result != null && mounted) {
      setState(() {
        _paymentMethods = [..._paymentMethods, result];
        // Store attachment file path if exists
        if (result.attachment != null && !result.attachment!.startsWith('http')) {
          _attachmentFilePaths[result.method] = result.attachment!;
        }
      });
    }
  }

  Future<void> _editPaymentMethod(int index) async {
    final method = _paymentMethods[index];
    final attachmentPath = _attachmentFilePaths[method.method];
    final existingMethods = _paymentMethods.where((pm) => pm != method).toList();

    final result = await PaymentMethodDialog.show(
      context,
      initialPaymentMethod: method,
      initialIndex: index,
      initialAttachmentFilePath: attachmentPath,
      existingPaymentMethods: existingMethods,
    );

    if (result != null && mounted) {
      setState(() {
        // Remove old attachment path if method type changed
        if (method.method != result.method) {
          _attachmentFilePaths.remove(method.method);
        }

        _paymentMethods = [
          ..._paymentMethods.sublist(0, index),
          result,
          ..._paymentMethods.sublist(index + 1),
        ];

        // Store new attachment file path if exists
        if (result.attachment != null && !result.attachment!.startsWith('http')) {
          _attachmentFilePaths[result.method] = result.attachment!;
        }
      });
    }
  }

  void _removePaymentMethod(int index) {
    final method = _paymentMethods[index];
    setState(() {
      _attachmentFilePaths.remove(method.method);
      _paymentMethods = [
        ..._paymentMethods.sublist(0, index),
        ..._paymentMethods.sublist(index + 1),
      ];
    });
  }

  void _handleSubmit() {
    if (!_formKey.currentState!.validate()) return;

    if (_paymentMethods.isEmpty) {
      ref.read(snackbarServiceProvider).showInfo(AppLocalizations.of(context).addAtLeastOnePaymentMethod);
      return;
    }

    // Build payment methods request
    final paymentMethodRequests = _paymentMethods.map((pm) => PaymentMethodRequest(
      method: pm.method,
      amount: pm.amount,
      referenceNumber: pm.referenceNumber,
      bankId: pm.bankId,
    )).toList();

    final sc = widget.supplierCustomer;
    final isCustomer = sc.type == SupplierCustomerType.customer;

    final request = SupplierCustomerPaymentRequest(
      customerId: isCustomer ? int.parse(sc.id) : null,
      supplierId: isCustomer ? null : int.parse(sc.id),
      notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
      paymentMethods: paymentMethodRequests,
    );

    final notifier = ref.read(supplierCustomerProvider(sc.type).notifier);
    if (widget.isRefund) {
      notifier.refund(
        type: sc.type,
        id: sc.id,
        request: request,
        paymentAttachmentFilePaths: _attachmentFilePaths,
      );
    } else {
      notifier.addBalance(
        type: sc.type,
        id: sc.id,
        request: request,
        paymentAttachmentFilePaths: _attachmentFilePaths,
      );
    }
  }
}

