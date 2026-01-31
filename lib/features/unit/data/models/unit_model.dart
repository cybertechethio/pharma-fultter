// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'unit_model.freezed.dart';
part 'unit_model.g.dart';

@freezed
sealed class UnitModel with _$UnitModel {
  const factory UnitModel({
    @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required String id,
    required int companyId,
    required String name,
    required String description,
    required DateTime createdAt,
    DateTime? updatedAt,
    int? createdBy,
    int? updatedBy,
  }) = _UnitModel;

  factory UnitModel.fromJson(Map<String, dynamic> json) =>
      _$UnitModelFromJson(json);
}

