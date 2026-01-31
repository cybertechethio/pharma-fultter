import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.freezed.dart';

@freezed
sealed class Item with _$Item {
  const factory Item({
    required String id,
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
    @Default(0.0) double weight,
    @Default(false) bool isTaxable,
    @Default(0) int taxRate,
    @Default(true) bool isActive,
    
    // Optional Foreign Keys
    int? categoryId,
    int? subCategoryId,
    int? brandId,
    int? unitId,
    int? modelId,
    
    // Optional Display Names (from API response)
    String? categoryName,
    String? subCategoryName,
    String? brandName,
    String? unitName,
    String? modelName,
    
    DateTime? createdAt,
    DateTime? updatedAt,
    int? createdBy,
    int? updatedBy,
  }) = _Item;
}

