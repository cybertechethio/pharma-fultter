import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../domain/entities/summary.dart';
import 'summary_card.dart';

/// Grid layout for summary cards (2 columns)
/// Displays: Total Sales, Total Sales Return, Total Purchase, Total Purchase Return
class SummaryGrid extends StatelessWidget {
  final Summary summary;

  const SummaryGrid({
    super.key,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: AppSizes.lg,
        crossAxisSpacing: AppSizes.lg,
        childAspectRatio: 1.8, //from 1.4
        children: [
          // Total Sales
          SummaryCard(
            title: l10n.totalSales,
            value: summary.totalSales,
            backgroundColor: BrandColors.cardSales,
          ),
          // Total Sales Return
          // SummaryCard(
          //   title: l10n.totalSalesReturn,
          //   value: summary.totalSalesReturn,
          //   backgroundColor: BrandColors.cardSalesReturn,
          // ),
          // Total Purchase
          SummaryCard(
            title: l10n.totalPurchase,
            value: summary.totalPurchase,
            backgroundColor: BrandColors.cardPurchase,
          ),
          // Total Purchase Return
          // SummaryCard(
          //   title: l10n.totalPurchaseReturn,
          //   value: summary.totalPurchaseReturn,
          //   backgroundColor: BrandColors.cardPurchaseReturn,
          // ),
        ],
      ),
    );
  }
}

