// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';
import 'salespurchase_data_model.dart';

part 'chart_salespurchase_model.freezed.dart';
part 'chart_salespurchase_model.g.dart';

@freezed
sealed class ChartSalesPerchaseModel with _$ChartSalesPerchaseModel {
  const factory ChartSalesPerchaseModel({
    required List<SalesPurchaseDataModel> data,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double totalSales,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double totalPurchase,
  }) = _ChartSalesPerchaseModel;

  factory ChartSalesPerchaseModel.fromJson(Map<String, dynamic> json) =>
      _$ChartSalesPerchaseModelFromJson(json);
}

