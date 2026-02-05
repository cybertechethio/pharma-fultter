import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../domain/entities/annualreport/annual_months.dart';
import '../../../domain/entities/annualreport/annual_month_data.dart';

/// Sales and Profit Trend line chart widget
class AnnualSalesProfitTrendChart extends StatelessWidget {
  final AnnualMonths salesProfitTrend;

  const AnnualSalesProfitTrendChart({
    super.key,
    required this.salesProfitTrend,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final numberFormat = NumberFormat('#,##0.##', 'en_US');

    final salesColor = BrandColors.chartRevenueBar;
    final profitColor = BrandColors.chartExpenseBar;

    final months = salesProfitTrend.months;
    final isEmpty = months.isEmpty;

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
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSizes.xs2),
                decoration: BoxDecoration(
                  color: salesColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                ),
                child: Icon(
                  Icons.trending_up_rounded,
                  color: salesColor,
                  size: AppSizes.iconSizeSm + 2,
                ),
              ),
              const SizedBox(width: AppSizes.sm),
              Expanded(
                child: Text(
                  'Sales and Profit Trend',
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
              const SizedBox(width: AppSizes.xxl),
              _LegendItem(
                color: profitColor,
                label: 'Profit',
              ),
            ],
          ),
          const SizedBox(height: AppSizes.xxl),

          SizedBox(
            height: AppSizes.chartHeight,
            child: isEmpty
                ? Center(
                    child: Text(
                      l10n.noData,
                      style: context.body(color: BrandColors.textSecondary),
                    ),
                  )
                : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: _getChartWidth(context, months.length),
                      child: LineChart(
                        LineChartData(
                          maxY: _getMaxY(months),
                          minY: _getMinY(months),
                          lineTouchData: LineTouchData(
                            enabled: true,
                            touchTooltipData: LineTouchTooltipData(
                              getTooltipColor: (_) =>
                                  BrandColors.inputBackground,
                              tooltipBorderRadius: BorderRadius.circular(AppSizes.radiusSm),
                              getTooltipItems: (List<LineBarSpot> spots) {
                                return spots.map((spot) {
                                  final monthData = months[spot.x.toInt()];
                                  final isSales = spot.barIndex == 0;
                                  final value = isSales
                                      ? monthData.sales
                                      : monthData.profit;
                                  final label = isSales ? 'Sales' : 'Profit';
                                  return LineTooltipItem(
                                    '$label\nETB ${numberFormat.format(value)}',
                                    context.label(
                                      color: BrandColors.textPrimary,
                                      bold: true,
                                    ),
                                  );
                                }).toList();
                              },
                            ),
                          ),
                          titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) =>
                                    _bottomTitleWidget(value.toInt(), context, months),
                                reservedSize: 50,
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
                          borderData: FlBorderData(
                            show: true,
                            border: Border(
                              bottom: BorderSide(
                                color: BrandColors.border.withOpacity(0.1),
                                width: 1,
                              ),
                              left: BorderSide(
                                color: BrandColors.border.withOpacity(0.1),
                                width: 1,
                              ),
                            ),
                          ),
                          gridData: FlGridData(
                            show: true,
                            drawVerticalLine: false,
                            horizontalInterval: _getInterval(months),
                            getDrawingHorizontalLine: (value) => FlLine(
                              color: BrandColors.border.withOpacity(0.1),
                              strokeWidth: 1,
                            ),
                          ),
                          lineBarsData: [
                            // Sales line
                            LineChartBarData(
                              spots: months.asMap().entries.map((entry) {
                                return FlSpot(entry.key.toDouble(), entry.value.sales);
                              }).toList(),
                              isCurved: true,
                              color: salesColor,
                              barWidth: 3,
                              dotData: FlDotData(
                                show: true,
                                getDotPainter: (spot, percent, barData, index) {
                                  return FlDotCirclePainter(
                                    radius: 4,
                                    color: salesColor,
                                    strokeWidth: AppSizes.loaderStrokeWidth,
                                    strokeColor: BrandColors.textLight,
                                  );
                                },
                              ),
                              belowBarData: BarAreaData(show: false),
                            ),
                            // Profit line
                            LineChartBarData(
                              spots: months.asMap().entries.map((entry) {
                                return FlSpot(entry.key.toDouble(), entry.value.profit);
                              }).toList(),
                              isCurved: true,
                              color: profitColor,
                              barWidth: 3,
                              dotData: FlDotData(
                                show: true,
                                getDotPainter: (spot, percent, barData, index) {
                                  return FlDotCirclePainter(
                                    radius: 4,
                                    color: profitColor,
                                    strokeWidth: AppSizes.loaderStrokeWidth,
                                    strokeColor: BrandColors.textLight,
                                  );
                                },
                              ),
                              belowBarData: BarAreaData(show: false),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  double _getMaxY(List<AnnualMonthData> months) {
    if (months.isEmpty) return 1000000;
    double maxValue = 0;
    bool allZero = true;
    for (final month in months) {
      if (month.sales > maxValue) maxValue = month.sales;
      if (month.profit > maxValue) maxValue = month.profit;
      if (month.sales > 0 || month.profit > 0) allZero = false;
    }
    if (allZero) return 10;
    return maxValue * 1.2;
  }

  double _getMinY(List<AnnualMonthData> months) {
    return 0;
  }

  double _getInterval(List<AnnualMonthData> months) {
    final maxY = _getMaxY(months);
    return maxY / 6;
  }

  double _getChartWidth(BuildContext context, int dataLength) {
    if (dataLength == 0) {
      return MediaQuery.of(context).size.width - 32;
    }
    // Calculate width: 100px per month + left reserved space (50) + right padding (16)
    return dataLength * 100.0 + 50 + 16 + 20;
  }

  Widget _bottomTitleWidget(int index, BuildContext context, List<AnnualMonthData> months) {
    if (index < 0 || index >= months.length) {
      return const SizedBox.shrink();
    }
    final monthLabel = months[index].month;

    return Padding(
      padding: const EdgeInsets.only(top: AppSizes.sm),
      child: Transform.rotate(
        angle: -0.5,
        child: Text(
          monthLabel,
          style: context.caption(color: BrandColors.textSecondary),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
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
            shape: BoxShape.circle,
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

