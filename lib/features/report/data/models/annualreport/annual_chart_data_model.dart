// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'annual_months_model.dart';
import 'annual_item_types_breakdown_model.dart';

part 'annual_chart_data_model.freezed.dart';
part 'annual_chart_data_model.g.dart';

@freezed
sealed class AnnualChartDataModel with _$AnnualChartDataModel {
  const factory AnnualChartDataModel({
    required AnnualMonthsModel salesProfitTrend,
    required AnnualItemTypesBreakdownModel itemTypesBreakdown,
  }) = _AnnualChartDataModel;

  factory AnnualChartDataModel.fromJson(Map<String, dynamic> json) =>
      _$AnnualChartDataModelFromJson(json);
}

