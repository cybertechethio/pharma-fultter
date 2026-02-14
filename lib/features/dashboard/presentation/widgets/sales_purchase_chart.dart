import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../domain/entities/chart_salespurchase.dart';

/// Sales & Purchase bar chart widget
class SalesPurchaseChart extends StatelessWidget {
  final ChartSalesPerchase chartData;

  const SalesPurchaseChart({
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
              Icon(
                Icons.shopping_cart_outlined,
                color: BrandColors.chartSalesBar,
                size: AppSizes.iconSize,
              ),
              const SizedBox(width: AppSizes.sm),
              Text(
                l10n.salesAndPurchase,
                style: context.title(color: BrandColors.textPrimary, bold: true),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.lg),

          // Legend with totals
          Row(
            children: [
              _LegendItem(
                color: BrandColors.chartPurchaseBar,
                label: l10n.totalPurchase,
                value: _formatValue(chartData.totalPurchase, numberFormat),
              ),
              const SizedBox(width: AppSizes.xxl),
              _LegendItem(
                color: BrandColors.chartSalesBar,
                label: l10n.totalSales,
                value: _formatValue(chartData.totalSales, numberFormat),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.xxl),

          // Chart with horizontal scrolling
          SizedBox(
            height: 200,
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
                          minY: 0,
                      barTouchData: BarTouchData(
                        enabled: true,
                        touchTooltipData: BarTouchTooltipData(
                          getTooltipColor: (_) =>
                              BrandColors.inputBackground,
                          tooltipBorderRadius: BorderRadius.circular(AppSizes.radiusSm),
                          getTooltipItem: (group, groupIndex, rod, rodIndex) {
                            final data = chartData.data[groupIndex];
                            final value = rodIndex == 0 ? data.purchase : data.sales;
                            final label = rodIndex == 0 ? l10n.purchase : l10n.sales;
                            return BarTooltipItem(
                              '$label\n${numberFormat.format(value)}',
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
                            reservedSize: 42,
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 60,
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
                        horizontalInterval: _getMaxY() / 4,
                        getDrawingHorizontalLine: (value) => FlLine(
                          color: BrandColors.border.withValues(alpha: 0.1),
                          strokeWidth: 1,
                        ),
                      ),
                      barGroups: _generateBarGroups(
                        BrandColors.chartPurchaseBar,
                        BrandColors.chartSalesBar,
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
    if (value >= 1000000) {
      return '${format.format(value / 1000)}K';
    } else if (value >= 1000) {
      return '${format.format(value / 1000)}K';
    }
    return format.format(value);
  }

  double _getMaxY() {
    if (chartData.data.isEmpty) return 100;
    double maxValue = 0;
    for (final item in chartData.data) {
      if (item.purchase > maxValue) maxValue = item.purchase;
      if (item.sales > maxValue) maxValue = item.sales;
    }
    // Add 20% padding
    return maxValue * 1.2;
  }

  double _getChartWidth(BuildContext context) {
    if (chartData.data.isEmpty) {
      return MediaQuery.of(context).size.width - 32; // Account for margins
    }
    // Calculate width: 70px per bar group + left reserved space (60) + right padding (16)
    final minWidth = chartData.data.length * 70.0 + 60 + 16;
    final screenWidth = MediaQuery.of(context).size.width - 32; // Account for margins
    return minWidth > screenWidth ? minWidth : screenWidth;
  }

  Widget _bottomTitleWidget(int index, BuildContext context) {
    if (index < 0 || index >= chartData.data.length) {
      return const SizedBox.shrink();
    }
    final date = chartData.data[index].date;
    final dateFormat = DateFormat('yyyy-MM-dd');
    return Padding(
      padding: const EdgeInsets.only(top: AppSizes.sm),
      child: Transform.rotate(
        angle: -0.5,
        child: Text(
          dateFormat.format(date),
          style: context.caption(color: BrandColors.textSecondary),
        ),
      ),
    );
  }

  Widget _leftTitleWidget(double value, TitleMeta meta, BuildContext context) {
    String text;
    if (value >= 1000000) {
      text = '${(value / 1000000).toStringAsFixed(0)}M';
    } else if (value >= 1000) {
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
    Color purchaseColor,
    Color salesColor,
  ) {
    return chartData.data.asMap().entries.map((entry) {
      final index = entry.key;
      final data = entry.value;
      return BarChartGroupData(
        x: index,
        barRods: [
          // Purchase bar
          BarChartRodData(
            toY: data.purchase,
            color: purchaseColor,
            width: 12,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
          ),
          // Sales bar
          BarChartRodData(
            toY: data.sales,
            color: salesColor,
            width: 12,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
          ),
        ],
        barsSpace: 2,
      );
    }).toList();
  }
}

/// Legend item widget
class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;
  final String value;

  const _LegendItem({
    required this.color,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: AppSizes.sm,
              height: AppSizes.sm,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: AppSizes.xs2),
            Text(
              label,
              style: context.small(color: BrandColors.textSecondary),
            ),
          ],
        ),
        const SizedBox(height: AppSizes.xs),
        Text(
          value,
          style: context.title(color: BrandColors.textPrimary, bold: true),
        ),
      ],
    );
  }
}

