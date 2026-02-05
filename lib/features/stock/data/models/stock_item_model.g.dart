// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StockItemModel _$StockItemModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_StockItemModel', json, ($checkedConvert) {
      final val = _StockItemModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
        code: $checkedConvert('code', (v) => v as String?),
        categories: $checkedConvert('categories', (v) => v as String?),
        subCategories: $checkedConvert('subCategories', (v) => v as String?),
        brands: $checkedConvert('brands', (v) => v as String?),
        units: $checkedConvert('units', (v) => v as String?),
        models: $checkedConvert('models', (v) => v as String?),
        color: $checkedConvert('color', (v) => v as String?),
        size: $checkedConvert('size', (v) => v as String?),
        material: $checkedConvert('material', (v) => v as String?),
        weight: $checkedConvert('weight', (v) => v as String?),
        unitPrice: $checkedConvert('unitPrice', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$StockItemModelToJson(_StockItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': ?instance.code,
      'categories': ?instance.categories,
      'subCategories': ?instance.subCategories,
      'brands': ?instance.brands,
      'units': ?instance.units,
      'models': ?instance.models,
      'color': ?instance.color,
      'size': ?instance.size,
      'material': ?instance.material,
      'weight': ?instance.weight,
      'unitPrice': ?instance.unitPrice,
    };
