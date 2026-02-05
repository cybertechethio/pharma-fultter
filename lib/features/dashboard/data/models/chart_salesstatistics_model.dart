// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';
import 'salesstatistics_data_model.dart';

part 'chart_salesstatistics_model.freezed.dart';
part 'chart_salesstatistics_model.g.dart';

@freezed
sealed class ChartSalesStatisticsModel with _$ChartSalesStatisticsModel {
  const factory ChartSalesStatisticsModel({
    required List<SalesStatisticsDataModel> data,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double totalRevenue,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double totalExpense,
  }) = _ChartSalesStatisticsModel;

  factory ChartSalesStatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$ChartSalesStatisticsModelFromJson(json);
}

