import 'package:flutter/material.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../domain/entities/salesreport/sales_summary.dart';
import 'sales_summary_card.dart';

/// Horizontal scrollable list of sales summary cards
/// Displays: Total Amount, Total Paid, Total Unpaid, Overdue
class SalesSummaryList extends StatelessWidget {
  final SalesSummary summary;

  const SalesSummaryList({
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
          // Total Amount
          SalesSummaryCard(
            title: l10n.totalAmount,
            value: summary.totalAmount,
            icon: Icons.bar_chart_rounded,
            borderColor: BrandColors.success,
            iconBackgroundColor: BrandColors.success,
          ),
          const SizedBox(width: AppSizes.sm),
          // Total Paid
          SalesSummaryCard(
            title: l10n.totalPaid,
            value: summary.totalPaid,
            icon: Icons.bar_chart_rounded,
            borderColor: BrandColors.info,
            iconBackgroundColor: BrandColors.info,
          ),
          const SizedBox(width: AppSizes.sm),
          // Total Unpaid
          SalesSummaryCard(
            title: l10n.totalUnpaid,
            value: summary.totalUnpaid,
            icon: Icons.account_balance_wallet_rounded,
            borderColor: BrandColors.warning,
            iconBackgroundColor: BrandColors.warning,
          ),
          const SizedBox(width: AppSizes.sm),
          // Overdue
          SalesSummaryCard(
            title: l10n.overdue,
            value: summary.overdue,
            icon: Icons.error_outline_rounded,
            borderColor: BrandColors.error,
            iconBackgroundColor: BrandColors.error,
          ),
        ],
      ),
    );
  }
}

