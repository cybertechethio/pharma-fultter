import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/utils/formatters.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/text_styles.dart';
import '../../domain/entities/expense_detail.dart';
import 'expense_payment_method_form_dialog.dart';
import 'expense_payment_method_card.dart';

class ExpensePaymentsWidget extends ConsumerWidget {
  final List<ExpensePayment> expensePayments;
  final String expenseId;

  const ExpensePaymentsWidget({
    super.key,
    required this.expensePayments,
    required this.expenseId,
  });

  void _showCreatePaymentMethodDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (dialogContext) => ExpensePaymentMethodFormDialog(
        expenseId: expenseId,
        title: l10n.addPaymentMethod,
        buttonText: l10n.add,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final l10n = AppLocalizations.of(context);

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
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.lg, vertical: AppSizes.sm),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            const SizedBox(height: AppSizes.md),
            Row(
              children: [
                Text(
                  l10n.paymentMethodsCount(allPaymentMethods.length),
                  style: context.subtitle(bold: true),
                ),
                Spacer(),
                TextButton.icon(
                    onPressed: () => _showCreatePaymentMethodDialog(context),
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
            const SizedBox(height: AppSizes.md),
            ...allPaymentMethods.map((method) => ExpensePaymentMethodCard(
              paymentMethod: method,
              expenseId: expenseId,
              canDelete: allPaymentMethods.length > 1,
            )),
            const SizedBox(height: AppSizes.lg),
            const Divider(),
            const SizedBox(height: AppSizes.md),
            _PaymentInfoRow(
              label: l10n.totalAmount,
              value: Formatters.formatAmount(totalAmount),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _PaymentInfoRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: context.bodySecondary(),
        ),
        Text(
          value,
          style: context.body(bold: true),
        ),
      ],
    );
  }
}
