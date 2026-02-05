import 'package:flutter/material.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../domain/entities/customerreport/customer_summary.dart';
import 'customer_summary_card.dart';

/// Horizontal scrollable list of customer summary cards
/// Displays: Total to Pay Customers, Total Customers Owe Us, Net Balance
class CustomerSummaryList extends StatelessWidget {
  final CustomerSummary summary;

  const CustomerSummaryList({
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
          // Total to Pay Customers
          CustomerSummaryCard(
            title: l10n.totalToPayCustomers,
            value: summary.totalToPayCustomers,
            icon: Icons.arrow_downward_rounded,
            borderColor: BrandColors.error,
            iconBackgroundColor: BrandColors.error,
          ),
          const SizedBox(width: AppSizes.sm),
          // Total Customers Owe Us
          CustomerSummaryCard(
            title: l10n.totalCustomersOweUs,
            value: summary.totalCustomersOweUs,
            icon: Icons.arrow_upward_rounded,
            borderColor: BrandColors.success,
            iconBackgroundColor: BrandColors.success,
          ),
          const SizedBox(width: AppSizes.sm),
          // Net Balance
          CustomerSummaryCard(
            title: l10n.netBalance,
            value: summary.netBalance,
            icon: Icons.account_balance_wallet_rounded,
            borderColor: summary.netBalance >= 0 ? BrandColors.success : BrandColors.error,
            iconBackgroundColor: summary.netBalance >= 0 ? BrandColors.success : BrandColors.error,
          ),
        ],
      ),
    );
  }
}

