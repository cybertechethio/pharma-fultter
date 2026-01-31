// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_ItemModel',
  json,
  ($checkedConvert) {
    final val = _ItemModel(
      id: $checkedConvert('id', (v) => JsonTypeConverters.stringFromDynamic(v)),
      name: $checkedConvert('name', (v) => v as String),
      code: $checkedConvert('code', (v) => v as String),
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
        (v) => v == null ? 0.0 : JsonTypeConverters.doubleFromDynamic(v),
      ),
      isTaxable: $checkedConvert('isTaxable', (v) => v as bool? ?? false),
      taxRate: $checkedConvert('taxRate', (v) => (v as num?)?.toInt() ?? 0),
      isActive: $checkedConvert('isActive', (v) => v as bool? ?? true),
      categoryId: $checkedConvert('categoryId', (v) => (v as num?)?.toInt()),
      subCategoryId: $checkedConvert(
        'subCategoryId',
        (v) => (v as num?)?.toInt(),
      ),
      brandId: $checkedConvert('brandId', (v) => (v as num?)?.toInt()),
      unitId: $checkedConvert('unitId', (v) => (v as num?)?.toInt()),
      modelId: $checkedConvert('modelId', (v) => (v as num?)?.toInt()),
      categoryName: $checkedConvert('categoryName', (v) => v as String?),
      subCategoryName: $checkedConvert('subCategoryName', (v) => v as String?),
      brandName: $checkedConvert('brandName', (v) => v as String?),
      unitName: $checkedConvert('unitName', (v) => v as String?),
      modelName: $checkedConvert('modelName', (v) => v as String?),
      createdAt: $checkedConvert(
        'createdAt',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      updatedAt: $checkedConvert(
        'updatedAt',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      createdBy: $checkedConvert('createdBy', (v) => (v as num?)?.toInt()),
      updatedBy: $checkedConvert('updatedBy', (v) => (v as num?)?.toInt()),
    );
    return val;
  },
);

Map<String, dynamic> _$ItemModelToJson(_ItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'companyId': ?instance.companyId,
      'description': ?instance.description,
      'imageUrl': ?instance.imageUrl,
      'sku': ?instance.sku,
      'barcode': ?instance.barcode,
      'color': ?instance.color,
      'size': ?instance.size,
      'material': ?instance.material,
      'weight': instance.weight,
      'isTaxable': instance.isTaxable,
      'taxRate': instance.taxRate,
      'isActive': instance.isActive,
      'categoryId': ?instance.categoryId,
      'subCategoryId': ?instance.subCategoryId,
      'brandId': ?instance.brandId,
      'unitId': ?instance.unitId,
      'modelId': ?instance.modelId,
      'categoryName': ?instance.categoryName,
      'subCategoryName': ?instance.subCategoryName,
      'brandName': ?instance.brandName,
      'unitName': ?instance.unitName,
      'modelName': ?instance.modelName,
      'createdAt': ?instance.createdAt?.toIso8601String(),
      'updatedAt': ?instance.updatedAt?.toIso8601String(),
      'createdBy': ?instance.createdBy,
      'updatedBy': ?instance.updatedBy,
    };
