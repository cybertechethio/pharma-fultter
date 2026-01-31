// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'brand_model.freezed.dart';
part 'brand_model.g.dart';

@freezed
sealed class BrandModel with _$BrandModel {
  const factory BrandModel({
    @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required String id,
    required int companyId,
    required String name,
    required String description,
    required DateTime createdAt,
    DateTime? updatedAt,
    int? createdBy,
    int? updatedBy,
  }) = _BrandModel;

  factory BrandModel.fromJson(Map<String, dynamic> json) =>
      _$BrandModelFromJson(json);
}

