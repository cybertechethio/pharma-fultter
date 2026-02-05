import 'package:flutter/material.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/utils/formatters.dart';
import '../../../domain/entities/transaction.dart';

class TransactionSummarySection extends StatelessWidget {
  final Transaction transaction;

  const TransactionSummarySection({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        color: BrandColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radius),
        border: Border.all(color: BrandColors.outline.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.summary, style: context.subtitle(bold: true)),
          const SizedBox(height: AppSizes.md),
          // Subtotal
          _AmountRow(
            label: l10n.subtotal,
            amount: transaction.subtotal,
          ),
          const SizedBox(height: AppSizes.sm),
          // Total Tax
          _AmountRow(
            label: l10n.totalTax,
            amount: transaction.totalTax,
          ),
          const Divider(height: AppSizes.lg),
          // Total Amount
          _AmountRow(
            label: l10n.totalAmount,
            amount: transaction.totalAmount,
            isPrimary: true,
          ),
          // Notes
          if (transaction.notes != null && transaction.notes!.isNotEmpty) ...[
            const Divider(height: AppSizes.lg),
            Text(l10n.notes, style: context.small()),
            const SizedBox(height: AppSizes.xs),
            Text(
              transaction.notes!,
              style: context.body(),
            ),
          ],
          if (transaction.notes == null || transaction.notes!.isEmpty) ...[
            const Divider(height: AppSizes.lg),
            Text(l10n.notes, style: context.small()),
            const SizedBox(height: AppSizes.xs),
            Text(l10n.notAvailable, style: context.body()),
          ],
        ],
      ),
    );
  }
}

class _AmountRow extends StatelessWidget {
  final String label;
  final double amount;
  final bool isPrimary;

  const _AmountRow({
    required this.label,
    required this.amount,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isPrimary ? context.body(bold: true) : context.body(),
        ),
        Text(
          Formatters.formatCurrency(amount),
          style: isPrimary
              ? context.subtitle(bold: true, color: BrandColors.primary)
              : context.body(bold: true),
        ),
      ],
    );
  }
}

