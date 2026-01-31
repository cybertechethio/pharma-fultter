import 'package:flutter/material.dart';
import '../../../../shared/utils/formatters.dart';
import '../../domain/entities/expense_detail.dart';
import 'expense_payment_method_card.dart';

class ExpensePaymentsWidget extends StatelessWidget {
  final List<ExpensePayment> expensePayments;
  final String expenseId;

  const ExpensePaymentsWidget({
    super.key,
    required this.expensePayments,
    required this.expenseId,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Flatten all payment methods from all payments
    final allPaymentMethods = <ExpensePaymentMethod>[];
    for (final payment in expensePayments) {
      allPaymentMethods.addAll(payment.paymentMethods);
    }

    if (allPaymentMethods.isEmpty) {
      return const SizedBox.shrink();
    }

    // Calculate total amount from all payments
    double totalAmount = 0.0;
    for (final payment in expensePayments) {
      final amount = double.tryParse(payment.amount) ?? 0.0;
      totalAmount += amount;
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.payment,
                  size: 20,
                  color: colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Payment Details',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _PaymentInfoRow(
              label: 'Total Amount',
              value: Formatters.formatAmount(totalAmount),
              theme: theme,
              colorScheme: colorScheme,
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 12),
            Text(
              'Payment Methods (${allPaymentMethods.length})',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ...allPaymentMethods.map((method) => ExpensePaymentMethodCard(
              paymentMethod: method,
              expenseId: expenseId,
              canDelete: allPaymentMethods.length > 1, // Can delete if more than one method
            )),
          ],
        ),
      ),
    );
  }
}

class _PaymentInfoRow extends StatelessWidget {
  final String label;
  final String value;
  final ThemeData theme;
  final ColorScheme colorScheme;

  const _PaymentInfoRow({
    required this.label,
    required this.value,
    required this.theme,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
