import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../domain/entities/profitlossreport/profit_loss_graph.dart';

/// Profit-Loss bar chart widget with grouped bars (Sales and Profit)
class ProfitLossGraphWidget extends StatelessWidget {
  final ProfitLossGraph graph;
  final String title;

  const ProfitLossGraphWidget({
    super.key,
    required this.graph,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final numberFormat = NumberFormat('#,##0.##', 'en_US');

    final salesColor = BrandColors.chartRevenueBar;
    final profitColor = BrandColors.chartExpenseBar;

    final data = _getData();
    final hasData = data.isNotEmpty;

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
                  Icons.trending_up_rounded,
                  color: salesColor,
                  size: AppSizes.iconSizeSm + 2,
                ),
              ),
              const SizedBox(width: AppSizes.sm),
              Expanded(
                child: Text(
                  title,
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
            child: !hasData
                ? Center(
                    child: Text(
                      l10n.noData,
                      style: context.body(color: BrandColors.textSecondary),
                    ),
                  )
                : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: _getChartWidth(context, data),
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.start,
                          maxY: _getMaxY(data),
                          minY: _getMinY(data),
                          groupsSpace: 30,
                          barTouchData: BarTouchData(
                            enabled: true,
                            touchTooltipData: BarTouchTooltipData(
                              getTooltipColor: (_) =>
                                  BrandColors.inputBackground,
                              tooltipBorderRadius: BorderRadius.circular(AppSizes.radiusSm),
                              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                                final item = data[groupIndex];
                                final isSales = rodIndex == 0;
                                final value = isSales ? item.sales : item.profit;
                                final label = isSales ? 'Sales' : 'Profit';
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
                                  final index = value.toInt();
                                  return _bottomTitleWidget(index, context, data);
                                },
                                reservedSize: 60,
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
                            horizontalInterval: _getInterval(data),
                            getDrawingHorizontalLine: (value) => FlLine(
                              color: BrandColors.border.withValues(alpha: 0.1),
                              strokeWidth: 1,
                            ),
                          ),
                          barGroups: _generateBarGroups(data, salesColor, profitColor),
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  List<_ChartDataItem> _getData() {
    // Backend returns "days", "weeks", "months" (plural), but also check singular for compatibility
    if ((graph.granularity == 'day' || graph.granularity == 'days') && graph.days != null) {
      return graph.days!.map((d) => _ChartDataItem(
        label: DateFormat('d/M/yyyy').format(d.date), // DD/MM/YYYY format like "27/3/2019"
        sales: d.sales,
        profit: d.profit,
      )).toList();
    } else if ((graph.granularity == 'week' || graph.granularity == 'weeks') && graph.weeks != null) {
      return graph.weeks!.map((w) => _ChartDataItem(
        label: w.week,
        sales: w.sales,
        profit: w.profit,
      )).toList();
    } else if ((graph.granularity == 'month' || graph.granularity == 'months') && graph.months != null) {
      return graph.months!.map((m) => _ChartDataItem(
        label: m.month,
        sales: m.sales,
        profit: m.profit,
      )).toList();
    }
    return [];
  }

  double _getMaxY(List<_ChartDataItem> data) {
    if (data.isEmpty) return 1000000;
    double maxValue = 0;
    bool allZero = true;
    for (final item in data) {
      if (item.sales > maxValue) maxValue = item.sales;
      if (item.profit > maxValue) maxValue = item.profit;
      if (item.sales > 0 || item.profit > 0) allZero = false;
    }
    // If all values are 0, set a minimum height so bars and dates are visible
    if (allZero) return 10; // Small value to show zero bars
    return maxValue * 1.2;
  }

  double _getMinY(List<_ChartDataItem> data) {
    return 0; // Always start from 0 for profit-loss
  }

  double _getInterval(List<_ChartDataItem> data) {
    final maxY = _getMaxY(data);
    return maxY / 6;
  }

  double _getChartWidth(BuildContext context, List<_ChartDataItem> data) {
    if (data.isEmpty) {
      return MediaQuery.of(context).size.width - 32;
    }
    // Calculate width based on data type:
    // - For weeks: 100px per bar group (shorter format "W51, 2025" + rotation)
    // - For days: 90px per bar group (date labels: "27/3/2019")
    // - For months: 100px per bar group
    final isWeek = data.first.label.contains('Week') || 
        RegExp(r'^\d{4}-\d{1,2}$').hasMatch(data.first.label);
    final widthPerGroup = isWeek ? 100.0 : 90.0;
    
    // + left reserved space (50) + right padding (16) + extra padding for labels
    // Always return calculated width to ensure horizontal scrolling when needed
    return data.length * widthPerGroup + 50 + 16 + 20;
  }

  Widget _bottomTitleWidget(int index, BuildContext context, List<_ChartDataItem> data) {
    if (index < 0 || index >= data.length) {
      return const SizedBox.shrink();
    }

    final label = data[index].label;
    String displayLabel = label;

    final isWeekFormat = RegExp(r'^\d{4}-\d{1,2}$').hasMatch(label);
    if (isWeekFormat) {
      final parts = label.split('-');
      if (parts.length == 2) {
        final year = parts[0];
        final week = parts[1];
        displayLabel = 'W$week, $year';
      }
    } else {
      try {
        final date = DateFormat('d/M/yyyy').parse(label);
        displayLabel = DateFormat('d/M/yyyy').format(date);
      } catch (e) {
        try {
          final date = DateFormat('M/d/yyyy').parse(label);
          displayLabel = DateFormat('d/M/yyyy').format(date);
        } catch (e2) {
          try {
            final date = DateTime.parse(label);
            displayLabel = DateFormat('d/M/yyyy').format(date);
          } catch (e3) {
            displayLabel = label;
          }
        }
      }
    }

    final shouldRotate = isWeekFormat;

    return Padding(
      padding: const EdgeInsets.only(top: AppSizes.sm),
      child: shouldRotate
          ? Transform.rotate(
              angle: -0.5,
              child: Text(
                displayLabel,
                style: context.caption(color: BrandColors.textSecondary),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          : Text(
              displayLabel,
              style: context.caption(color: BrandColors.textSecondary),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
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

  List<BarChartGroupData> _generateBarGroups(
    List<_ChartDataItem> data,
    Color salesColor,
    Color profitColor,
  ) {
    // Ensure we create bar groups for ALL data points, even when values are zero
    return List.generate(data.length, (index) {
      final item = data[index];
      
      return BarChartGroupData(
        x: index, // x must be int
        barRods: [
          // Sales bar - show actual value (zero bars will be invisible but x-axis label will show)
          BarChartRodData(
            toY: item.sales > 0 ? item.sales : 0.0, // Ensure zero is explicitly 0.0
            color: salesColor,
            width: 16, // Narrower bars to give more room for labels
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
          ),
          // Profit bar (grouped, not stacked) - show actual value
          BarChartRodData(
            toY: item.profit > 0 ? item.profit : 0.0, // Ensure zero is explicitly 0.0
            color: profitColor,
            width: 16, // Narrower bars to give more room for labels
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
          ),
        ],
        barsSpace: 6, // Space between grouped bars (reduced since bars are narrower)
      );
    });
  }
}

/// Chart data item helper class
class _ChartDataItem {
  final String label;
  final double sales;
  final double profit;

  _ChartDataItem({
    required this.label,
    required this.sales,
    required this.profit,
  });
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

