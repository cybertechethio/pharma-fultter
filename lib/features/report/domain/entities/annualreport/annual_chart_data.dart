import 'package:freezed_annotation/freezed_annotation.dart';
import 'annual_months.dart';
import 'annual_item_types_breakdown.dart';

part 'annual_chart_data.freezed.dart';

@freezed
sealed class AnnualChartData with _$AnnualChartData {
  const factory AnnualChartData({
    required AnnualMonths salesProfitTrend,
    required AnnualItemTypesBreakdown itemTypesBreakdown,
  }) = _AnnualChartData;
}

