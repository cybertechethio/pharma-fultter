// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ItemRequestModel _$ItemRequestModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ItemRequestModel', json, ($checkedConvert) {
      final val = _ItemRequestModel(
        name: $checkedConvert('name', (v) => v as String),
        description: $checkedConvert('description', (v) => v as String?),
        categoryId: $checkedConvert('categoryId', (v) => (v as num?)?.toInt()),
        subCategoryId: $checkedConvert(
          'subCategoryId',
          (v) => (v as num?)?.toInt(),
        ),
        brandId: $checkedConvert('brandId', (v) => (v as num?)?.toInt()),
        unitId: $checkedConvert('unitId', (v) => (v as num?)?.toInt()),
        modelId: $checkedConvert('modelId', (v) => (v as num?)?.toInt()),
        sku: $checkedConvert('sku', (v) => v as String?),
        code: $checkedConvert('code', (v) => v as String),
        barcode: $checkedConvert('barcode', (v) => v as String?),
        color: $checkedConvert('color', (v) => v as String?),
        size: $checkedConvert('size', (v) => v as String?),
        material: $checkedConvert('material', (v) => v as String?),
        weight: $checkedConvert('weight', (v) => (v as num?)?.toDouble()),
        isTaxable: $checkedConvert('isTaxable', (v) => v as bool),
        taxRate: $checkedConvert('taxRate', (v) => (v as num?)?.toInt() ?? 0),
        isActive: $checkedConvert('isActive', (v) => v as bool),
        imageUrl: $checkedConvert('imageUrl', (v) => v as String?),
        costPrice: $checkedConvert('costPrice', (v) => (v as num).toDouble()),
        unitPrice: $checkedConvert('unitPrice', (v) => (v as num).toDouble()),
        expirationDate: $checkedConvert('expirationDate', (v) => v as String?),
        manufacturingDate: $checkedConvert(
          'manufacturingDate',
          (v) => v as String?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$ItemRequestModelToJson(_ItemRequestModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': ?instance.description,
      'categoryId': ?instance.categoryId,
      'subCategoryId': ?instance.subCategoryId,
      'brandId': ?instance.brandId,
      'unitId': ?instance.unitId,
      'modelId': ?instance.modelId,
      'sku': ?instance.sku,
      'code': instance.code,
      'barcode': ?instance.barcode,
      'color': ?instance.color,
      'size': ?instance.size,
      'material': ?instance.material,
      'weight': ?instance.weight,
      'isTaxable': instance.isTaxable,
      'taxRate': instance.taxRate,
      'isActive': instance.isActive,
      'imageUrl': ?instance.imageUrl,
      'costPrice': instance.costPrice,
      'unitPrice': instance.unitPrice,
      'expirationDate': ?instance.expirationDate,
      'manufacturingDate': ?instance.manufacturingDate,
    };
