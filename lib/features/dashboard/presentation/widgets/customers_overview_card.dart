import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../domain/entities/chart_customer.dart';

/// Customers Overview card with donut chart
class CustomersOverviewCard extends StatelessWidget {
  final ChartCustomer chartCustomer;

  const CustomersOverviewCard({
    super.key,
    required this.chartCustomer,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        color: BrandColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        border: Border.all(
          color: BrandColors.border.withOpacity(0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: BrandColors.shadow,
            blurRadius: AppSizes.sm,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Text(
            l10n.customersOverview,
            style: context.title(color: BrandColors.textPrimary, bold: true),
          ),
          const SizedBox(height: AppSizes.xl),

          // Chart and Stats row
          Row(
            children: [
              // Donut Chart
              SizedBox(
                width: 100,
                height: 100,
                child: PieChart(
                  PieChartData(
                    sectionsSpace: AppSizes.xxs,
                    centerSpaceRadius: AppSizes.radiusLg + AppSizes.xs,
                    sections: [
                      PieChartSectionData(
                        value: chartCustomer.firstTime,
                        color: BrandColors.returnColor,
                        radius: 18,
                        showTitle: false,
                      ),
                      PieChartSectionData(
                        value: chartCustomer.returning,
                        color: BrandColors.transfer,
                        radius: 18,
                        showTitle: false,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: AppSizes.xxl),

              // Stats
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: _StatItem(
                        value: chartCustomer.firstTime.toInt().toString(),
                        label: l10n.firstTime,
                        percentage: chartCustomer.firstTimePercentage,
                        color: BrandColors.returnColor,
                      ),
                    ),
                    Expanded(
                      child: _StatItem(
                        value: chartCustomer.returning.toInt().toString(),
                        label: l10n.returning,
                        percentage: chartCustomer.returningPercentage,
                        color: BrandColors.transfer,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Individual stat item widget
class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  final double percentage;
  final Color color;

  const _StatItem({
    required this.value,
    required this.label,
    required this.percentage,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: context.header(color: BrandColors.textPrimary),
        ),
        const SizedBox(height: AppSizes.xs),
        Text(
          label,
          style: context.body(color: color, bold: true),
        ),
        const SizedBox(height: AppSizes.sm),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.md,
            vertical: AppSizes.xs,
          ),
          decoration: BoxDecoration(
            color: BrandColors.success,
            borderRadius: BorderRadius.circular(AppSizes.radiusXs),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.arrow_drop_down,
                color: BrandColors.textLight,
                size: AppSizes.iconSizeSm,
              ),
              Text(
                '${percentage.toStringAsFixed(0)}%',
                style: context.label(color: BrandColors.textLight, bold: true),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
