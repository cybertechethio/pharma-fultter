// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'salesstatistics_data_model.freezed.dart';
part 'salesstatistics_data_model.g.dart';

@freezed
sealed class SalesStatisticsDataModel with _$SalesStatisticsDataModel {
  const factory SalesStatisticsDataModel({
    @JsonKey(name: 'date')
    required String date,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double revenue,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double expense,
  }) = _SalesStatisticsDataModel;

  factory SalesStatisticsDataModel.fromJson(Map<String, dynamic> json) =>
      _$SalesStatisticsDataModelFromJson(json);
}

