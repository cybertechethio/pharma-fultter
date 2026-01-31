import 'package:flutter/material.dart';
import '../../../../shared/utils/formatters.dart';
import '../../domain/entities/expense_detail.dart';

class ExpenseBasicInfoWidget extends StatelessWidget {
  final ExpenseDetail expense;

  const ExpenseBasicInfoWidget({
    super.key,
    required this.expense,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
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
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (expense.catName != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          expense.catName!,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                _buildStatusBadge(context, expense.status ?? '', colorScheme),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            _InfoRow(
              label: 'Date',
              value: Formatters.formatDateTime(expense.expenseDate),
              theme: theme,
              colorScheme: colorScheme,
            ),
            const SizedBox(height: 8),
            _InfoRow(
              label: 'Amount',
              value: Formatters.formatAmount(double.tryParse(expense.amount) ?? 0.0),
              theme: theme,
              colorScheme: colorScheme,
              isTotal: true,
            ),
            if (expense.notes != null && expense.notes!.isNotEmpty) ...[
              const SizedBox(height: 8),
              _InfoRow(
                label: 'Notes',
                value: expense.notes!,
                theme: theme,
                colorScheme: colorScheme,
              ),
            ],
            const SizedBox(height: 8),
            _InfoRow(
              label: 'Created',
              value: Formatters.formatDateTime(expense.createdAt),
              theme: theme,
              colorScheme: colorScheme,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge(BuildContext context, String status, ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.primary,
          width: 1,
        ),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(
          color: colorScheme.primary,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final ThemeData theme;
  final ColorScheme colorScheme;
  final bool isTotal;

  const _InfoRow({
    required this.label,
    required this.value,
    required this.theme,
    required this.colorScheme,
    this.isTotal = false,
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
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.w600,
              color: isTotal ? colorScheme.primary : null,
            ),
          ),
        ),
      ],
    );
  }
}
