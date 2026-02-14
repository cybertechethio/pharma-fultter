import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../domain/entities/chart_salesstatistics.dart';

/// Sales Statistics bar chart widget
class SalesStatisticsChart extends StatelessWidget {
  final ChartSalesStatistics chartData;

  const SalesStatisticsChart({
    super.key,
    required this.chartData,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final numberFormat = NumberFormat('#,##0.##', 'en_US');

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
          // Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSizes.xs2),
                decoration: BoxDecoration(
                  color: BrandColors.errorBackgroundLight,
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                ),
                child: Icon(
                  Icons.warning_amber_rounded,
                  color: BrandColors.error,
                  size: AppSizes.iconSizeSm + 2,
                ),
              ),
              const SizedBox(width: AppSizes.sm),
              Text(
                l10n.salesStatistics,
                style: context.title(color: BrandColors.textPrimary, bold: true),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.lg),

          // Summary cards
          Row(
            children: [
              // Revenue
              Expanded(
                child: _SummaryCard(
                  value: _formatValue(chartData.totalRevenue, numberFormat),
                  label: l10n.revenue,
                  percentage: 25, // Placeholder
                  isPositive: true,
                ),
              ),
              const SizedBox(width: AppSizes.xs),
              // Expense
              Expanded(
                child: _SummaryCard(
                  value: _formatValue(chartData.totalExpense, numberFormat),
                  label: l10n.expense,
                  percentage: 25, // Placeholder
                  isPositive: false,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.xxl),

          // Chart with horizontal scrolling
          SizedBox(
            height: 250,
            child: chartData.data.isEmpty
                ? Center(
                    child: Text(
                      l10n.noData,
                      style: context.body(color: BrandColors.textSecondary),
                    ),
                  )
                : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: _getChartWidth(context),
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.start,
                          maxY: _getMaxY(),
                          minY: _getMinY(),
                      barTouchData: BarTouchData(
                        enabled: true,
                        touchTooltipData: BarTouchTooltipData(
                          getTooltipColor: (_) =>
                              BrandColors.inputBackground,
                          tooltipBorderRadius: BorderRadius.circular(AppSizes.radiusSm),
                          getTooltipItem: (group, groupIndex, rod, rodIndex) {
                            final data = chartData.data[groupIndex];
                            final isRevenue = rod.toY > 0;
                            final value = isRevenue ? data.revenue : data.expense;
                            final label = isRevenue ? l10n.revenue : l10n.expense;
                            return BarTooltipItem(
                              '$label\n${numberFormat.format(value.abs())}',
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
                            getTitlesWidget: (value, meta) =>
                                _bottomTitleWidget(value.toInt(), context),
                            reservedSize: 32,
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
                        horizontalInterval: _getInterval(),
                        getDrawingHorizontalLine: (value) => FlLine(
                          color: BrandColors.border.withValues(alpha: 0.1),
                          strokeWidth: 1,
                        ),
                      ),
                      barGroups: _generateBarGroups(
                        BrandColors.chartRevenueBar,
                        BrandColors.chartExpenseBar,
                      ),
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  String _formatValue(double value, NumberFormat format) {
    if (value.abs() >= 1000000) {
      return 'ETB ${format.format(value / 1000)}K';
    } else if (value.abs() >= 1000) {
      return 'ETB ${format.format(value / 1000)}K';
    }
    return 'ETB ${format.format(value)}';
  }

  double _getMaxY() {
    if (chartData.data.isEmpty) return 30000;
    double maxValue = 0;
    for (final item in chartData.data) {
      if (item.revenue > maxValue) maxValue = item.revenue;
    }
    return maxValue * 1.2;
  }

  double _getMinY() {
    if (chartData.data.isEmpty) return -30000;
    double minValue = 0;
    for (final item in chartData.data) {
      if (-item.expense < minValue) minValue = -item.expense;
    }
    return minValue * 1.2;
  }

  double _getInterval() {
    final range = _getMaxY() - _getMinY();
    return range / 6;
  }

  double _getChartWidth(BuildContext context) {
    if (chartData.data.isEmpty) {
      return MediaQuery.of(context).size.width - 32; // Account for margins
    }
    // Calculate width: 70px per bar group + left reserved space (50) + right padding (16)
    final minWidth = chartData.data.length * 70.0 + 50 + 16;
    final screenWidth = MediaQuery.of(context).size.width - 32; // Account for margins
    return minWidth > screenWidth ? minWidth : screenWidth;
  }

  Widget _bottomTitleWidget(int index, BuildContext context) {
    if (index < 0 || index >= chartData.data.length) {
      return const SizedBox.shrink();
    }
    final dateString = chartData.data[index].date;
    String formattedDate;
    try {
      final date = DateTime.parse(dateString);
      formattedDate = DateFormat('MMM d').format(date);
    } catch (e) {
      formattedDate = dateString;
    }
    return Padding(
      padding: const EdgeInsets.only(top: AppSizes.sm),
      child: Text(
        formattedDate,
        style: context.caption(color: BrandColors.textSecondary),
      ),
    );
  }

  Widget _leftTitleWidget(double value, TitleMeta meta, BuildContext context) {
    String text;
    if (value.abs() >= 1000) {
      text = '${(value / 1000).toStringAsFixed(0)}K';
    } else {
      text = value.toStringAsFixed(0);
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

  List<BarChartGroupData> _generateBarGroups(
    Color revenueColor,
    Color expenseColor,
  ) {
    return chartData.data.asMap().entries.map((entry) {
      final index = entry.key;
      final data = entry.value;
      return BarChartGroupData(
        x: index,
        barRods: [
          // Stacked bar: Revenue (positive) and Expense (negative)
          BarChartRodData(
            toY: data.revenue,
            color: revenueColor,
            width: 40,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
          ),
          BarChartRodData(
            toY: -data.expense, // Negative to show below zero
            color: expenseColor,
            width: 40,
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(4)),
          ),
        ],
        barsSpace: 0,
      );
    }).toList();
  }
}

/// Summary card widget
class _SummaryCard extends StatelessWidget {
  final String value;
  final String label;
  final double percentage;
  final bool isPositive;

  const _SummaryCard({
    required this.value,
    required this.label,
    required this.percentage,
    required this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    final badgeColor = isPositive ? BrandColors.success : BrandColors.error;

    return Container(
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: BrandColors.inputBackground,
        borderRadius: BorderRadius.circular(AppSizes.radius),
        border: Border.all(
          color: BrandColors.border.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  style: context.title(color: BrandColors.textPrimary, bold: true),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: AppSizes.sm),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.sm,
                  vertical: AppSizes.xxs,
                ),
                decoration: BoxDecoration(
                  color: badgeColor,
                  borderRadius: BorderRadius.circular(AppSizes.radiusXs),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isPositive ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                      color: BrandColors.textLight,
                      size: AppSizes.md2,
                    ),
                    Text(
                      '${percentage.toStringAsFixed(0)}%',
                      style: context.caption(
                        color: BrandColors.textLight,
                        bold: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.xs),
          Text(
            label,
            style: context.small(color: BrandColors.textSecondary),
          ),
        ],
      ),
    );
  }
}

