import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.freezed.dart';

@freezed
sealed class Item with _$Item {
  const factory Item({
    required int id,
    required String name,
    required String code,
    
    // Optional fields with defaults where appropriate
    int? companyId,
    String? description,
    String? imageUrl,
    String? sku,
    String? barcode,
    @Default('N/A') String? color,
    String? size,
    String? material,
    @Default(0.0) double? weight,
    required bool isTaxable,
    @Default(0) int taxRate,
    required bool isActive,

    // Pricing fields (mandatory)
    required double costPrice,
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
  }) = _Item;
}

