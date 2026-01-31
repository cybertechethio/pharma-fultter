// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'sub_category_model.freezed.dart';
part 'sub_category_model.g.dart';

@freezed
sealed class SubCategoryModel with _$SubCategoryModel {
  const factory SubCategoryModel({
    @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required String id,
    required int companyId,
    required int categoryId,
    required String name,
    required String description,
    required DateTime createdAt,
    DateTime? updatedAt,
    int? createdBy,
    int? updatedBy,
  }) = _SubCategoryModel;

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryModelFromJson(json);
}

