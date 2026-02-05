// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'heatmap_data_model.freezed.dart';
part 'heatmap_data_model.g.dart';

@freezed
sealed class HeatmapDataModel with _$HeatmapDataModel {
  const factory HeatmapDataModel({
    required DateTime date,
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
    required int value,
  }) = _HeatmapDataModel;

  factory HeatmapDataModel.fromJson(Map<String, dynamic> json) =>
      _$HeatmapDataModelFromJson(json);
}

