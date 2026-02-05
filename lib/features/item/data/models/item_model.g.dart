// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ItemModel _$ItemModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ItemModel', json, ($checkedConvert) {
  final val = _ItemModel(
    id: $checkedConvert('id', (v) => (v as num).toInt()),
    name: $checkedConvert('name', (v) => v as String),
    code: $checkedConvert('code', (v) => v as String?),
    companyId: $checkedConvert('companyId', (v) => (v as num?)?.toInt()),
    description: $checkedConvert('description', (v) => v as String?),
    imageUrl: $checkedConvert('imageUrl', (v) => v as String?),
    sku: $checkedConvert('sku', (v) => v as String?),
    barcode: $checkedConvert('barcode', (v) => v as String?),
    color: $checkedConvert('color', (v) => v as String?),
    size: $checkedConvert('size', (v) => v as String?),
    material: $checkedConvert('material', (v) => v as String?),
    weight: $checkedConvert(
      'weight',
      (v) => JsonTypeConverters.doubleFromDynamicNullable(v),
    ),
    isTaxable: $checkedConvert('isTaxable', (v) => v as bool),
    taxRate: $checkedConvert('taxRate', (v) => (v as num?)?.toInt() ?? 0),
    isActive: $checkedConvert('isActive', (v) => v as bool),
    costPrice: $checkedConvert(
      'costPrice',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
    unitPrice: $checkedConvert(
      'unitPrice',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
    expirationDate: $checkedConvert(
      'expirationDate',
      (v) => v == null ? null : DateTime.parse(v as String),
    ),
    manufacturingDate: $checkedConvert(
      'manufacturingDate',
      (v) => v == null ? null : DateTime.parse(v as String),
    ),
    categoryId: $checkedConvert('categoryId', (v) => (v as num?)?.toInt()),
    subCategoryId: $checkedConvert(
      'subCategoryId',
      (v) => (v as num?)?.toInt(),
    ),
    brandId: $checkedConvert('brandId', (v) => (v as num?)?.toInt()),
    unitId: $checkedConvert('unitId', (v) => (v as num?)?.toInt()),
    modelId: $checkedConvert('modelId', (v) => (v as num?)?.toInt()),
    categories: $checkedConvert('categories', (v) => v as String?),
    subCategories: $checkedConvert('subCategories', (v) => v as String?),
    brands: $checkedConvert('brands', (v) => v as String?),
    units: $checkedConvert('units', (v) => v as String?),
    models: $checkedConvert('models', (v) => v as String?),
    categoryName: $checkedConvert('categoryName', (v) => v as String?),
    subCategoryName: $checkedConvert('subCategoryName', (v) => v as String?),
    brandName: $checkedConvert('brandName', (v) => v as String?),
    unitName: $checkedConvert('unitName', (v) => v as String?),
    modelName: $checkedConvert('modelName', (v) => v as String?),
    createdAt: $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
    updatedAt: $checkedConvert('updatedAt', (v) => DateTime.parse(v as String)),
    createdBy: $checkedConvert('createdBy', (v) => (v as num?)?.toInt()),
    updatedBy: $checkedConvert('updatedBy', (v) => (v as num?)?.toInt()),
    createdByName: $checkedConvert('createdByName', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$ItemModelToJson(_ItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': ?instance.code,
      'companyId': ?instance.companyId,
      'description': ?instance.description,
      'imageUrl': ?instance.imageUrl,
      'sku': ?instance.sku,
      'barcode': ?instance.barcode,
      'color': ?instance.color,
      'size': ?instance.size,
      'material': ?instance.material,
      'weight': ?instance.weight,
      'isTaxable': instance.isTaxable,
      'taxRate': instance.taxRate,
      'isActive': instance.isActive,
      'costPrice': instance.costPrice,
      'unitPrice': instance.unitPrice,
      'expirationDate': ?instance.expirationDate?.toIso8601String(),
      'manufacturingDate': ?instance.manufacturingDate?.toIso8601String(),
      'categoryId': ?instance.categoryId,
      'subCategoryId': ?instance.subCategoryId,
      'brandId': ?instance.brandId,
      'unitId': ?instance.unitId,
      'modelId': ?instance.modelId,
      'categories': ?instance.categories,
      'subCategories': ?instance.subCategories,
      'brands': ?instance.brands,
      'units': ?instance.units,
      'models': ?instance.models,
      'categoryName': ?instance.categoryName,
      'subCategoryName': ?instance.subCategoryName,
      'brandName': ?instance.brandName,
      'unitName': ?instance.unitName,
      'modelName': ?instance.modelName,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'createdBy': ?instance.createdBy,
      'updatedBy': ?instance.updatedBy,
      'createdByName': ?instance.createdByName,
    };
