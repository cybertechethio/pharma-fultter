// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_selling_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TopSellingProductModel _$TopSellingProductModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_TopSellingProductModel', json, ($checkedConvert) {
  final val = _TopSellingProductModel(
    id: $checkedConvert('id', (v) => JsonTypeConverters.intFromDynamic(v)),
    name: $checkedConvert('name', (v) => v as String),
    imageUrl: $checkedConvert('imageUrl', (v) => v as String?),
    price: $checkedConvert(
      'price',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
    sales: $checkedConvert(
      'sales',
      (v) => JsonTypeConverters.intFromDynamic(v),
    ),
    growth: $checkedConvert(
      'growth',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
  );
  return val;
});

Map<String, dynamic> _$TopSellingProductModelToJson(
  _TopSellingProductModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'imageUrl': ?instance.imageUrl,
  'price': instance.price,
  'sales': instance.sales,
  'growth': instance.growth,
};
