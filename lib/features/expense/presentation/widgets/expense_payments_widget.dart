import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/utils/formatters.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
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
            Row(
              children: [
                Icon(
                  Icons.payment,
                  size: AppSizes.iconSize,
                  color: BrandColors.primary,
                ),
                const SizedBox(width: AppSizes.sm),
                Text(
                  l10n.paymentDetails,
                  style: context.subtitle(bold: true),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.lg),
            _PaymentInfoRow(
              label: l10n.totalAmount,
              value: Formatters.formatAmount(totalAmount),
            ),
            const SizedBox(height: AppSizes.lg),
            const Divider(),
            const SizedBox(height: AppSizes.md),
            Text(
              l10n.paymentMethodsCount(allPaymentMethods.length),
              style: context.subtitle(bold: true),
            ),
            const SizedBox(height: AppSizes.md),
            ...allPaymentMethods.map((method) => ExpensePaymentMethodCard(
              paymentMethod: method,
              expenseId: expenseId,
              canDelete: allPaymentMethods.length > 1,
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
