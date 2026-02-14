import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/utils/formatters.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../domain/entities/expense_detail.dart';
import 'expense_payment_method_form_dialog.dart';
import 'expense_payment_method_card.dart';

class ExpensePaymentsWidget extends ConsumerWidget {
  final ExpenseDetail detail;

  const ExpensePaymentsWidget({
    super.key,
    required this.detail,
  });

  void _showCreatePaymentMethodDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (dialogContext) => ExpensePaymentMethodFormDialog(
        expenseId: detail.id,
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
    for (final payment in detail.expensePayments) {
      allPaymentMethods.addAll(payment.paymentMethods);
    }

    final totalAmount = (double.tryParse(detail.amount) ?? 0.0);
    final hasPaymentData = detail.expensePayments.isNotEmpty;

    final content = !hasPaymentData
        ? Center(
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.lg),
              child: Text(l10n.noPaymentData, style: context.body()),
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ExpensePaymentSummary(
                totalAmount: totalAmount,
                notes: detail.notes,
              ),
              const SizedBox(height: AppSizes.md),
              const Divider(height: AppSizes.lg),
              Row(
                children: [
                  Text(l10n.paymentMethods, style: context.body(bold: true)),
                  const SizedBox(width: AppSizes.xxs),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.sm,
                      vertical: AppSizes.xxs,
                    ),
                    decoration: BoxDecoration(
                      color: BrandColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                    ),
                    child: Text(
                      '${allPaymentMethods.length}',
                      style: context.small(color: BrandColors.primary, bold: true),
                    ),
                  ),
                  const Spacer(),
                  TextButton.icon(
                    onPressed: () => _showCreatePaymentMethodDialog(context),
                    icon: const Icon(Icons.add, size: 18),
                    label: Text(l10n.add),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.sm),
              if (allPaymentMethods.isNotEmpty)
                ...allPaymentMethods.asMap().entries.map((entry) {
                  final index = entry.key;
                  final method = entry.value;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: AppSizes.sm),
                    child: ExpensePaymentMethodCard(
                      paymentMethod: method,
                      expenseId: detail.id,
                      heroTag: 'expense_payment_receipt_${detail.id}_$index',
                      canDelete: allPaymentMethods.length > 1,
                    ),
                  );
                }),
              if (allPaymentMethods.isEmpty)
                Text(l10n.noPaymentMethods, style: context.small()),
            ],
          );

    return Container(
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        color: BrandColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radius),
        border: Border.all(color: BrandColors.outline.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.payment, style: context.subtitle(bold: true)),
          const SizedBox(height: AppSizes.md),
          content,
        ],
      ),
    );
  }
}

class _ExpensePaymentSummary extends StatelessWidget {
  final double totalAmount;
  final String? notes;

  const _ExpensePaymentSummary({
    required this.totalAmount,
    this.notes,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Column(
      children: [
        _SummaryRow(
          label: l10n.totalAmount,
          value: Formatters.formatCurrency(totalAmount),
        ),
        const SizedBox(height: AppSizes.sm),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(l10n.notes, style: context.small()),
            const SizedBox(width: AppSizes.md),
            Expanded(
              child: Text(
                notes ?? l10n.notAvailable,
                style: context.body(),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;

  const _SummaryRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: context.body()),
        Text(value, style: context.body(bold: true)),
      ],
    );
  }
}
