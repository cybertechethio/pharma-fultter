// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'item_model.freezed.dart';
part 'item_model.g.dart';

@freezed
sealed class ItemModel with _$ItemModel {
  const factory ItemModel({
    @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required String id,
    required String name,
    required String code,
    
    // Optional fields with defaults where appropriate
    int? companyId,
    String? description,
    String? imageUrl,
    String? sku,
    String? barcode,
    String? color,
    String? size,
    String? material,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) @Default(0.0) double weight,
    @Default(false) bool isTaxable,
    @Default(0) int taxRate,
    @Default(true) bool isActive,
    
    // Optional Foreign Keys
    int? categoryId,
    int? subCategoryId,
    int? brandId,
    int? unitId,
    int? modelId,
    
    // Optional Display Names (from API response - plural keys)
    String? categoryName,
    String? subCategoryName,
    String? brandName,
    String? unitName,
    String? modelName,
    
    DateTime? createdAt,
    DateTime? updatedAt,
    int? createdBy,
    int? updatedBy,
  }) = _ItemModel;

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);
}

