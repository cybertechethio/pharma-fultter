// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'best_seller_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BestSellerModel _$BestSellerModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_BestSellerModel', json, ($checkedConvert) {
      final val = _BestSellerModel(
        id: $checkedConvert('id', (v) => JsonTypeConverters.intFromDynamic(v)),
        itemId: $checkedConvert(
          'itemId',
          (v) => JsonTypeConverters.intFromDynamic(v),
        ),
        itemName: $checkedConvert('itemName', (v) => v as String),
        itemCode: $checkedConvert('itemCode', (v) => v as String?),
        sku: $checkedConvert('sku', (v) => v as String?),
        category: $checkedConvert('category', (v) => v as String?),
        brand: $checkedConvert('brand', (v) => v as String?),
        imageUrl: $checkedConvert('imageUrl', (v) => v as String?),
        soldQty: $checkedConvert(
          'soldQty',
          (v) => JsonTypeConverters.intFromDynamic(v),
        ),
        soldAmount: $checkedConvert(
          'soldAmount',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        instockQty: $checkedConvert(
          'instockQty',
          (v) => JsonTypeConverters.intFromDynamic(v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$BestSellerModelToJson(_BestSellerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itemId': instance.itemId,
      'itemName': instance.itemName,
      'itemCode': ?instance.itemCode,
      'sku': ?instance.sku,
      'category': ?instance.category,
      'brand': ?instance.brand,
      'imageUrl': ?instance.imageUrl,
      'soldQty': instance.soldQty,
      'soldAmount': instance.soldAmount,
      'instockQty': instance.instockQty,
    };
