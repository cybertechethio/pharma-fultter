import '../../domain/entities/item.dart';
import '../models/item_model.dart';

extension ItemMapper on ItemModel {
  Item toDomain() {
    return Item(
      id: id,
      companyId: companyId,
      name: name,
      description: description,
      imageUrl: imageUrl,
      sku: sku,
      code: code,
      barcode: barcode,
      color: color,
      size: size,
      material: material,
      weight: weight,
      isTaxable: isTaxable,
      taxRate: taxRate,
      isActive: isActive,
      categoryId: categoryId,
      subCategoryId: subCategoryId,
      brandId: brandId,
      unitId: unitId,
      modelId: modelId,
      categoryName: categoryName,
      subCategoryName: subCategoryName,
      brandName: brandName,
      unitName: unitName,
      modelName: modelName,
      createdAt: createdAt,
      updatedAt: updatedAt,
      createdBy: createdBy,
      updatedBy: updatedBy,
    );
  }
}

