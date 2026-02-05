// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'overall_info_model.freezed.dart';
part 'overall_info_model.g.dart';

@freezed
sealed class OverallInfoModel with _$OverallInfoModel {
  const factory OverallInfoModel({
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
    required int suppliers,
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
    required int customers,
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
    required int orders,
  }) = _OverallInfoModel;

  factory OverallInfoModel.fromJson(Map<String, dynamic> json) =>
      _$OverallInfoModelFromJson(json);
}

