import 'package:freezed_annotation/freezed_annotation.dart';
import 'salesstatistics_data.dart';

part 'chart_salesstatistics.freezed.dart';

@freezed
sealed class ChartSalesStatistics with _$ChartSalesStatistics {
  const factory ChartSalesStatistics({
    required List<SalesStatisticsData> data,
    required double totalRevenue,
    required double totalExpense,
  }) = _ChartSalesStatistics;
}

