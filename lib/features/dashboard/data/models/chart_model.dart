// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'chart_salespurchase_model.dart';
import 'chart_customer_model.dart';
import 'chart_salesstatistics_model.dart';
import 'chart_heatmap_model.dart';

part 'chart_model.freezed.dart';
part 'chart_model.g.dart';

@freezed
sealed class ChartModel with _$ChartModel {
  const factory ChartModel({
    required ChartSalesPerchaseModel salesPurchase,
    required ChartCustomerModel customer,
    required ChartSalesStatisticsModel salesStatistics,
    required ChartHeatmapModel heatmap,
  }) = _ChartModel;

  factory ChartModel.fromJson(Map<String, dynamic> json) =>
      _$ChartModelFromJson(json);
}

