import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../domain/entities/summary.dart';
import 'metric_card.dart';

/// Grid layout for metric cards (2 columns)
/// Displays: Profit, Invoice Due, Total Expenses, Total Payment Returns
class MetricGrid extends StatelessWidget {
  final Summary summary;

  const MetricGrid({
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
        childAspectRatio: 1.6,
        children: [
          // Profit
          MetricCard(
            title: l10n.profit,
            value: summary.profit,
            icon: Icons.layers_rounded,
            iconColor: BrandColors.primary,
          ),
          // Invoice Due
          MetricCard(
            title: l10n.invoiceDue,
            value: summary.invoiceDue,
            icon: Icons.access_time_rounded,
            iconColor: BrandColors.success,
          ),
          // Total Expenses
          MetricCard(
            title: l10n.totalExpenses,
            value: summary.totalExpenses,
            icon: Icons.radio_button_checked_rounded,
            iconColor: BrandColors.error,
          ),
          // Total Payment Returns
          MetricCard(
            title: l10n.totalPaymentReturns,
            value: summary.totalPaymentReturns,
            icon: Icons.tag_rounded,
            iconColor: BrandColors.secondary,
          ),
        ],
      ),
    );
  }
}
