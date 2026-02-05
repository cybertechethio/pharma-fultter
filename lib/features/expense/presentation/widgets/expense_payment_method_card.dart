import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/utils/formatters.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../core/enums/payment_method_type_enum.dart';
import '../../domain/entities/expense_detail.dart';
import '../providers/expense_payment_methods_notifier.dart';
import '../providers/expense_loading_providers.dart';
import 'payment_method_edit_dialog.dart';

class ExpensePaymentMethodCard extends ConsumerWidget {
  final ExpensePaymentMethod paymentMethod;
  final String expenseId;
  final bool canDelete;

  const ExpensePaymentMethodCard({
    super.key,
    required this.paymentMethod,
    required this.expenseId,
    this.canDelete = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final updating = ref.watch(expensePaymentMethodUpdateLoadingProvider).contains(paymentMethod.id);
    final deleting = ref.watch(expensePaymentMethodDeleteLoadingProvider).contains(paymentMethod.id);

    final method = PaymentMethodType.values.firstWhere(
      (type) => type.toApiString() == paymentMethod.method,
      orElse: () => PaymentMethodType.cash,
    );

    return Container(
      margin: const EdgeInsets.only(bottom: AppSizes.md),
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: BrandColors.surfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
        border: Border.all(
          color: BrandColors.outline.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Icon(
                      _getPaymentMethodIcon(method),
                      size: AppSizes.iconSize,
                      color: BrandColors.primary,
                    ),
                    const SizedBox(width: AppSizes.sm),
                    Flexible(
                      child: Text(
                        method.getDisplayLabel().toUpperCase(),
                        style: context.body(bold: true),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                Formatters.formatAmount(double.tryParse(paymentMethod.amount) ?? 0.0),
                style: context.bodyPrimary(bold: true),
              ),
              if (updating || deleting) ...[
                const SizedBox(width: AppSizes.sm),
                SizedBox(
                  width: AppSizes.lg,
                  height: AppSizes.lg,
                  child: CircularProgressIndicator(
                    strokeWidth: AppSizes.xxs,
                    color: BrandColors.primary,
                  ),
                ),
              ] else ...[
                const SizedBox(width: AppSizes.sm),
                IconButton(
                  icon: Icon(Icons.edit, size: AppSizes.md2, color: BrandColors.primary),
                  onPressed: () => _handleEdit(context, ref),
                  tooltip: 'Edit payment method',
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const SizedBox(width: AppSizes.xs),
                IconButton(
                  icon: Icon(Icons.delete, size: AppSizes.md2, color: BrandColors.error),
                  onPressed: canDelete ? () => _handleDelete(context, ref) : null,
                  tooltip: 'Delete payment method',
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ],
          ),
          if (paymentMethod.referenceNumber != null) ...[
            const SizedBox(height: AppSizes.sm),
            Text(
              'Reference: ${paymentMethod.referenceNumber}',
              style: context.smallSecondary(),
            ),
          ],
        ],
      ),
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

  Future<void> _handleEdit(BuildContext context, WidgetRef ref) async {
    final updated = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (context) => PaymentMethodEditDialog(
        initialMethod: paymentMethod.method,
        initialAmount: paymentMethod.amount,
        initialReferenceNumber: paymentMethod.referenceNumber,
        initialBankId: paymentMethod.bankId,
      ),
    );

    if (updated != null && context.mounted) {
      await ref.read(expensePaymentMethodsProvider.notifier).updatePaymentMethod(
        expenseId: expenseId,
        paymentMethodId: paymentMethod.id,
        method: updated['method'] as String?,
        amount: updated['amount'] as String?,
        referenceNumber: updated['referenceNumber'] as String?,
        bankId: updated['bankId'] as int?,
      );
    }
  }

  Future<void> _handleDelete(BuildContext context, WidgetRef ref) async {
    // Check if this is the last payment method
    // The backend will handle this validation, but we can show a better message
    await ref.read(expensePaymentMethodsProvider.notifier).deletePaymentMethod(
      expenseId: expenseId,
      paymentMethodId: paymentMethod.id,
    );
  }
}
