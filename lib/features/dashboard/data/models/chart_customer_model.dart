// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'chart_customer_model.freezed.dart';
part 'chart_customer_model.g.dart';

@freezed
sealed class ChartCustomerModel with _$ChartCustomerModel {
  const factory ChartCustomerModel({
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double firstTime,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double returning,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double firstTimePercentage,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double returningPercentage,
  }) = _ChartCustomerModel;

  factory ChartCustomerModel.fromJson(Map<String, dynamic> json) =>
      _$ChartCustomerModelFromJson(json);
}

