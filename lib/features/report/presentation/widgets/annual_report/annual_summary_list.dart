import 'package:flutter/material.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../domain/entities/annualreport/annual_report_details.dart';
import 'annual_summary_card.dart';

/// Horizontal scrollable list of annual report summary cards
/// Displays: Total Sales, Total Cost, VAT, Gross Profit, Expenses, Net Profit
class AnnualSummaryList extends StatelessWidget {
  final AnnualReportDetails report;

  const AnnualSummaryList({
    super.key,
    required this.report,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    // Determine colors for profit values (green if positive, red if negative)
    final grossProfitColor = report.totals.grossProfit >= 0
        ? BrandColors.success
        : BrandColors.error;
    final netProfitColor = report.netProfit >= 0
        ? BrandColors.success
        : BrandColors.error;

    return SizedBox(
      height: AppSizes.horizontalListHeight,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.sm,
          vertical: AppSizes.xs,
        ),
        children: [
          // Total Sales
          AnnualSummaryCard(
            title: l10n.totalSales,
            value: report.totals.sales,
            icon: Icons.trending_up_rounded,
            borderColor: BrandColors.info,
            iconBackgroundColor: BrandColors.info,
          ),
          const SizedBox(width: AppSizes.sm),
          // Total Cost
          AnnualSummaryCard(
            title: l10n.totalCost,
            value: report.totals.cost,
            icon: Icons.trending_down_rounded,
            borderColor: BrandColors.error,
            iconBackgroundColor: BrandColors.error,
          ),
          const SizedBox(width: AppSizes.sm),
          // VAT
          AnnualSummaryCard(
            title: l10n.vat,
            value: report.totals.vat,
            icon: Icons.receipt_rounded,
            borderColor: BrandColors.secondary,
            iconBackgroundColor: BrandColors.secondary,
          ),
          const SizedBox(width: AppSizes.sm),
          // Gross Profit
          AnnualSummaryCard(
            title: l10n.grossProfit,
            value: report.totals.grossProfit,
            icon: report.totals.grossProfit >= 0
                ? Icons.arrow_upward_rounded
                : Icons.arrow_downward_rounded,
            borderColor: grossProfitColor,
            iconBackgroundColor: grossProfitColor,
          ),
          const SizedBox(width: AppSizes.sm),
          // Expenses
          AnnualSummaryCard(
            title: l10n.expenses,
            value: report.expenses,
            icon: Icons.money_off_rounded,
            borderColor: BrandColors.warning,
            iconBackgroundColor: BrandColors.warning,
          ),
          const SizedBox(width: AppSizes.sm),
          // Net Profit
          AnnualSummaryCard(
            title: l10n.netProfit,
            value: report.netProfit,
            icon: report.netProfit >= 0
                ? Icons.arrow_upward_rounded
                : Icons.arrow_downward_rounded,
            borderColor: netProfitColor,
            iconBackgroundColor: netProfitColor,
          ),
        ],
      ),
    );
  }
}

