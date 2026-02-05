// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'item_model.freezed.dart';
part 'item_model.g.dart';

@freezed
sealed class ItemModel with _$ItemModel {
  const factory ItemModel({
    required int id,
    required String name,
    String? code,
    
    // Optional fields with defaults where appropriate
    int? companyId,
    String? description,
    String? imageUrl,
    String? sku,
    String? barcode,
    String? color,
    String? size,
    String? material,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)
    double? weight,
    required bool isTaxable,
    @Default(0) int taxRate,
    required bool isActive,

    // Pricing fields (mandatory)
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double costPrice,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double unitPrice,
    
    // Date fields
    DateTime? expirationDate,
    DateTime? manufacturingDate,
    
    // Optional Foreign Keys
    int? categoryId,
    int? subCategoryId,
    int? brandId,
    int? unitId,
    int? modelId,
    
    // Display Names from API response (plural form)
    String? categories,
    String? subCategories,
    String? brands,
    String? units,
    String? models,
    
    // Legacy display names (kept for backward compatibility)
    String? categoryName,
    String? subCategoryName,
    String? brandName,
    String? unitName,
    String? modelName,
    
    // Timestamps (mandatory)
    required DateTime createdAt,
    required DateTime updatedAt,
    int? createdBy,
    int? updatedBy,
    String? createdByName,
  }) = _ItemModel;

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);
}

