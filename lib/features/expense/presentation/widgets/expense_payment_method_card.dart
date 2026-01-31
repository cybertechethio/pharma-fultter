import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/utils/formatters.dart';
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final updating = ref.watch(expensePaymentMethodUpdateLoadingProvider).contains(paymentMethod.id);
    final deleting = ref.watch(expensePaymentMethodDeleteLoadingProvider).contains(paymentMethod.id);

    final method = PaymentMethodType.values.firstWhere(
      (type) => type.toApiString() == paymentMethod.method,
      orElse: () => PaymentMethodType.cash,
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: colorScheme.outline.withOpacity(0.2),
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
                      size: 20,
                      color: colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        method.getDisplayLabel().toUpperCase(),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                Formatters.formatAmount(double.tryParse(paymentMethod.amount) ?? 0.0),
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
              ),
              if (updating || deleting) ...[
                const SizedBox(width: 8),
                SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: colorScheme.primary,
                  ),
                ),
              ] else ...[
                const SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.edit, size: 18, color: colorScheme.primary),
                  onPressed: () => _handleEdit(context, ref),
                  tooltip: 'Edit payment method',
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const SizedBox(width: 4),
                IconButton(
                  icon: Icon(Icons.delete, size: 18, color: colorScheme.error),
                  onPressed: canDelete ? () => _handleDelete(context, ref) : null,
                  tooltip: 'Delete payment method',
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ],
          ),
          if (paymentMethod.referenceNumber != null) ...[
            const SizedBox(height: 8),
            Text(
              'Reference: ${paymentMethod.referenceNumber}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
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
      case PaymentMethodType.other:
        return Icons.more_horiz;
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
