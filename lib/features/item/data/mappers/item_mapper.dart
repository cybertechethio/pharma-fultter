import '../../domain/entities/item.dart';
import '../models/item_model.dart';

extension ItemMapper on ItemModel {
  Item toDomain() {
    return Item(
      id: id,
      name: name,
      code: code ?? 'N/A',
      companyId: companyId,
      description: description,
      imageUrl: imageUrl,
      sku: sku,
      barcode: barcode,
      color: color,
      size: size,
      material: material,
      weight: weight,
      isTaxable: isTaxable,
      taxRate: taxRate,
      isActive: isActive,
      costPrice: costPrice,
      unitPrice: unitPrice,
      expirationDate: expirationDate,
      manufacturingDate: manufacturingDate,
      categoryId: categoryId,
      subCategoryId: subCategoryId,
      brandId: brandId,
      unitId: unitId,
      modelId: modelId,
      categories: categories,
      subCategories: subCategories,
      brands: brands,
      units: units,
      models: models,
      categoryName: categoryName,
      subCategoryName: subCategoryName,
      brandName: brandName,
      unitName: unitName,
      modelName: modelName,
      createdAt: createdAt,
      updatedAt: updatedAt,
      createdBy: createdBy,
      updatedBy: updatedBy,
      createdByName: createdByName,
    );
  }
}

