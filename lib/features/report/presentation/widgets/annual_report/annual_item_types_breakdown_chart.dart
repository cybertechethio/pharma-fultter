import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../domain/entities/annualreport/annual_item_types_breakdown.dart';
import '../../../domain/entities/annualreport/annual_item_type_data.dart';

/// Item Types Breakdown grouped bar chart widget
class AnnualItemTypesBreakdownChart extends StatelessWidget {
  final AnnualItemTypesBreakdown itemTypesBreakdown;

  const AnnualItemTypesBreakdownChart({
    super.key,
    required this.itemTypesBreakdown,
  });

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat('#,##0.##', 'en_US');

    final salesColor = BrandColors.chartRevenueBar;
    final costColor = BrandColors.error;
    final grossProfitColor = BrandColors.chartExpenseBar;

    final direct = itemTypesBreakdown.direct;
    final processed = itemTypesBreakdown.processed;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        color: BrandColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        border: Border.all(
          color: BrandColors.border.withValues(alpha: 0.1),
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
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSizes.xs2),
                decoration: BoxDecoration(
                  color: salesColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                ),
                child: Icon(
                  Icons.pie_chart_rounded,
                  color: salesColor,
                  size: AppSizes.iconSizeSm + 2,
                ),
              ),
              const SizedBox(width: AppSizes.sm),
              Expanded(
                child: Text(
                  'Item Types Breakdown',
                  style: context.title(color: BrandColors.textPrimary, bold: true),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.lg),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _LegendItem(
                color: salesColor,
                label: 'Sales',
              ),
              const SizedBox(width: AppSizes.lg),
              _LegendItem(
                color: costColor,
                label: 'Cost',
              ),
              const SizedBox(width: AppSizes.lg),
              _LegendItem(
                color: grossProfitColor,
                label: 'Gross Profit',
              ),
            ],
          ),
          const SizedBox(height: AppSizes.xxl),

          SizedBox(
            height: AppSizes.chartHeight,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: _getMaxY(direct, processed),
                minY: 0,
                barTouchData: BarTouchData(
                  enabled: true,
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipColor: (_) =>
                        BrandColors.inputBackground,
                    tooltipBorderRadius: BorderRadius.circular(AppSizes.radiusSm),
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      final isDirect = groupIndex == 0;
                      final data = isDirect ? direct : processed;
                      String label;
                      double value;
                      if (rodIndex == 0) {
                        label = 'Sales';
                        value = data.sales;
                      } else if (rodIndex == 1) {
                        label = 'Cost';
                        value = data.cost;
                      } else {
                        label = 'Gross Profit';
                        value = data.grossProfit;
                      }
                      return BarTooltipItem(
                        '$label\nETB ${numberFormat.format(value)}',
                        context.label(
                          color: BrandColors.textPrimary,
                          bold: true,
                        ),
                      );
                    },
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        if (value.toInt() == 0) {
                          return Padding(
                            padding: const EdgeInsets.only(top: AppSizes.sm),
                            child: Text(
                              'Direct',
                              style: context.caption(color: BrandColors.textSecondary),
                              textAlign: TextAlign.center,
                            ),
                          );
                        } else if (value.toInt() == 1) {
                          return Padding(
                            padding: const EdgeInsets.only(top: AppSizes.sm),
                            child: Text(
                              'Processed',
                              style: context.caption(color: BrandColors.textSecondary),
                              textAlign: TextAlign.center,
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                      reservedSize: AppSizes.xxxxl,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 50,
                      getTitlesWidget: (value, meta) =>
                          _leftTitleWidget(value, meta, context),
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: _getInterval(direct, processed),
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: BrandColors.border.withValues(alpha: 0.1),
                    strokeWidth: 1,
                  ),
                ),
                barGroups: [
                  // Direct category
                  BarChartGroupData(
                    x: 0,
                    barRods: [
                      BarChartRodData(
                        toY: direct.sales,
                        color: salesColor,
                        width: 20,
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                      ),
                      BarChartRodData(
                        toY: direct.cost,
                        color: costColor,
                        width: 20,
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                      ),
                      BarChartRodData(
                        toY: direct.grossProfit,
                        color: grossProfitColor,
                        width: 20,
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                      ),
                    ],
                    barsSpace: 8,
                  ),
                  // Processed category
                  BarChartGroupData(
                    x: 1,
                    barRods: [
                      BarChartRodData(
                        toY: processed.sales,
                        color: salesColor,
                        width: 20,
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                      ),
                      BarChartRodData(
                        toY: processed.cost,
                        color: costColor,
                        width: 20,
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                      ),
                      BarChartRodData(
                        toY: processed.grossProfit,
                        color: grossProfitColor,
                        width: 20,
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                      ),
                    ],
                    barsSpace: 8,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  double _getMaxY(AnnualItemTypeData direct, AnnualItemTypeData processed) {
    double maxValue = 0;
    if (direct.sales > maxValue) maxValue = direct.sales;
    if (direct.cost > maxValue) maxValue = direct.cost;
    if (direct.grossProfit > maxValue) maxValue = direct.grossProfit;
    if (processed.sales > maxValue) maxValue = processed.sales;
    if (processed.cost > maxValue) maxValue = processed.cost;
    if (processed.grossProfit > maxValue) maxValue = processed.grossProfit;
    if (maxValue == 0) return 100;
    return maxValue * 1.2;
  }

  double _getInterval(AnnualItemTypeData direct, AnnualItemTypeData processed) {
    final maxY = _getMaxY(direct, processed);
    return maxY / 6;
  }

  Widget _leftTitleWidget(double value, TitleMeta meta, BuildContext context) {
    String text;
    if (value.abs() >= 1000000) {
      text = 'ETB ${(value / 1000000).toStringAsFixed(1)}M';
    } else if (value.abs() >= 1000) {
      text = 'ETB ${(value / 1000).toStringAsFixed(0)}K';
    } else {
      text = 'ETB ${value.toStringAsFixed(0)}';
    }
    return Padding(
      padding: const EdgeInsets.only(right: AppSizes.xs),
      child: Text(
        text,
        style: context.caption(color: BrandColors.textSecondary),
        textAlign: TextAlign.right,
      ),
    );
  }
}

/// Legend item widget
class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: AppSizes.iconSizeSm,
          height: AppSizes.iconSizeSm,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(AppSizes.radiusXs),
          ),
        ),
        const SizedBox(width: AppSizes.sm),
        Text(
          label,
          style: context.small(color: BrandColors.textSecondary),
        ),
      ],
    );
  }
}

