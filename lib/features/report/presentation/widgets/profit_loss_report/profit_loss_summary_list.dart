import 'package:flutter/material.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../domain/entities/profitlossreport/profit_loss_totals.dart';
import 'profit_loss_summary_card.dart';

/// Horizontal scrollable list of profit-loss summary cards
/// Displays: Total Sales, Total Cost, VAT, Gross Profit
class ProfitLossSummaryList extends StatelessWidget {
  final ProfitLossTotals totals;

  const ProfitLossSummaryList({
    super.key,
    required this.totals,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    // Determine gross profit color (green if positive, red if negative)
    final grossProfitColor = totals.grossProfit >= 0
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
          ProfitLossSummaryCard(
            title: l10n.totalSales,
            value: totals.sales,
            icon: Icons.trending_up_rounded,
            borderColor: BrandColors.info,
            iconBackgroundColor: BrandColors.info,
          ),
          const SizedBox(width: AppSizes.sm),
          // Total Cost
          ProfitLossSummaryCard(
            title: l10n.totalCost,
            value: totals.cost,
            icon: Icons.trending_down_rounded,
            borderColor: BrandColors.warning,
            iconBackgroundColor: BrandColors.warning,
          ),
          const SizedBox(width: AppSizes.sm),
          // VAT
          ProfitLossSummaryCard(
            title: l10n.vat,
            value: totals.vat,
            icon: Icons.receipt_rounded,
            borderColor: BrandColors.secondary,
            iconBackgroundColor: BrandColors.secondary,
          ),
          const SizedBox(width: AppSizes.sm),
          // Gross Profit
          ProfitLossSummaryCard(
            title: l10n.grossProfit,
            value: totals.grossProfit,
            icon: totals.grossProfit >= 0
                ? Icons.arrow_upward_rounded
                : Icons.arrow_downward_rounded,
            borderColor: grossProfitColor,
            iconBackgroundColor: grossProfitColor,
          ),
        ],
      ),
    );
  }
}

