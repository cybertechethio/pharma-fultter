// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'model_model.freezed.dart';
part 'model_model.g.dart';

@freezed
sealed class ModelModel with _$ModelModel {
  const factory ModelModel({
    @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required String id,
    required int companyId,
    required String name,
    required String description,
    required DateTime createdAt,
    DateTime? updatedAt,
    int? createdBy,
    int? updatedBy,
  }) = _ModelModel;

  factory ModelModel.fromJson(Map<String, dynamic> json) =>
      _$ModelModelFromJson(json);
}

