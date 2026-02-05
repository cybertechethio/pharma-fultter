// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'low_stock_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LowStockProductModel _$LowStockProductModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_LowStockProductModel', json, ($checkedConvert) {
  final val = _LowStockProductModel(
    id: $checkedConvert('id', (v) => JsonTypeConverters.intFromDynamic(v)),
    name: $checkedConvert('name', (v) => v as String),
    imageUrl: $checkedConvert('imageUrl', (v) => v as String?),
    code: $checkedConvert('code', (v) => v as String?),
    stock: $checkedConvert(
      'stock',
      (v) => JsonTypeConverters.intFromDynamic(v),
    ),
  );
  return val;
});

Map<String, dynamic> _$LowStockProductModelToJson(
  _LowStockProductModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'imageUrl': ?instance.imageUrl,
  'code': ?instance.code,
  'stock': instance.stock,
};
