import 'package:flutter/material.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../domain/entities/expensereport/expense_summary.dart';
import 'expense_summary_card.dart';

/// Horizontal scrollable list of expense summary cards
/// Displays: Total Expenses (count), Total Amount, Average Expense, Largest Expense
class ExpenseSummaryList extends StatelessWidget {
  final ExpenseSummary summary;

  const ExpenseSummaryList({
    super.key,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return SizedBox(
      height: AppSizes.horizontalListHeight,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.sm,
          vertical: AppSizes.xs,
        ),
        children: [
          // Total Expenses (count)
          ExpenseSummaryCard(
            title: l10n.totalExpenses,
            value: summary.totalExpenses.toDouble(),
            icon: Icons.bar_chart_rounded,
            borderColor: BrandColors.success,
            iconBackgroundColor: BrandColors.success,
            isCount: true,
          ),
          const SizedBox(width: AppSizes.sm),
          // Total Amount
          ExpenseSummaryCard(
            title: l10n.totalAmount,
            value: summary.totalAmount,
            icon: Icons.account_balance_wallet_rounded,
            borderColor: BrandColors.info,
            iconBackgroundColor: BrandColors.info,
          ),
          const SizedBox(width: AppSizes.sm),
          // Average Expense
          ExpenseSummaryCard(
            title: l10n.averageExpense,
            value: summary.averageExpense,
            icon: Icons.show_chart_rounded,
            borderColor: BrandColors.warning,
            iconBackgroundColor: BrandColors.warning,
          ),
          const SizedBox(width: AppSizes.sm),
          // Largest Expense
          ExpenseSummaryCard(
            title: l10n.largestExpense,
            value: summary.largestExpense,
            icon: Icons.trending_up_rounded,
            borderColor: BrandColors.warning,
            iconBackgroundColor: BrandColors.warning,
          ),
        ],
      ),
    );
  }
}

