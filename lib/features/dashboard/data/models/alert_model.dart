// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'alert_model.freezed.dart';
part 'alert_model.g.dart';

@freezed
sealed class AlertModel with _$AlertModel {
  const factory AlertModel({
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
    required int id,
    required String name,
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
    required int stock,
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamicNullable)
    int? threshold,
  }) = _AlertModel;

  factory AlertModel.fromJson(Map<String, dynamic> json) =>
      _$AlertModelFromJson(json);
}

