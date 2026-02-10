import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/utils/formatters.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../domain/entities/expense_detail.dart';

class ExpenseBasicInfoWidget extends StatelessWidget {
  final ExpenseDetail expense;

  const ExpenseBasicInfoWidget({
    super.key,
    required this.expense,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Card(
      margin: const EdgeInsets.all(AppSizes.lg),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        expense.name,
                        style: context.subtitle(bold: true),
                      ),
                    ],
                  ),
                ),
                _buildStatusBadge(context, expense.status ?? ''),
              ],
            ),
            const SizedBox(height: AppSizes.lg),
            const Divider(),
            const SizedBox(height: AppSizes.lg),
            _InfoRow(
              label: l10n.date,
              value: Formatters.formatDateTime(expense.expenseDate),
              isTotal: false,
            ),
            const SizedBox(height: AppSizes.sm),
            _InfoRow(
              label: l10n.amount,
              value: Formatters.formatAmount(double.tryParse(expense.amount) ?? 0.0),
              isTotal: true,
            ),
            if (expense.notes != null && expense.notes!.isNotEmpty) ...[
              const SizedBox(height: AppSizes.sm),
              _InfoRow(
                label: l10n.notes,
                value: expense.notes!,
                isTotal: false,
              ),
            ],
            const SizedBox(height: AppSizes.sm),
            _InfoRow(
              label: l10n.created,
              value: Formatters.formatDateTime(expense.createdAt),
              isTotal: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge(BuildContext context, String status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.xs2),
      decoration: BoxDecoration(
        color: BrandColors.primaryWithOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        border: Border.all(
          color: BrandColors.primary,
          width: 1,
        ),
      ),
      child: Text(
        status.toUpperCase(),
        style: context.labelPrimary(bold: true),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;

  const _InfoRow({
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: context.bodySecondary(bold: isTotal),
        ),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: isTotal ? context.bodyPrimary(bold: true) : context.body(bold: true),
          ),
        ),
      ],
    );
  }
}
