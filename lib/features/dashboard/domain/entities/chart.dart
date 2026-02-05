import 'package:freezed_annotation/freezed_annotation.dart';
import 'chart_salespurchase.dart';
import 'chart_customer.dart';
import 'chart_salesstatistics.dart';
import 'chart_heatmap.dart';

part 'chart.freezed.dart';

@freezed
sealed class Chart with _$Chart {
  const factory Chart({
    required ChartSalesPerchase salesPurchase,
    required ChartCustomer customer,
    required ChartSalesStatistics salesStatistics,
    required ChartHeatmap heatmap,
  }) = _Chart;
}

