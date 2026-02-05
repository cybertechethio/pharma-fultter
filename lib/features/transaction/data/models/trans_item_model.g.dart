// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trans_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransItemModel _$TransItemModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_TransItemModel', json, ($checkedConvert) {
      final val = _TransItemModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        itemId: $checkedConvert('itemId', (v) => (v as num).toInt()),
        itemName: $checkedConvert('itemName', (v) => v as String),
        itemCode: $checkedConvert('itemCode', (v) => v as String),
        quantity: $checkedConvert(
          'quantity',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        unitPrice: $checkedConvert(
          'unitPrice',
          (v) => JsonTypeConverters.doubleFromDynamicOrZero(v),
        ),
        costPrice: $checkedConvert(
          'costPrice',
          (v) => JsonTypeConverters.doubleFromDynamicOrZero(v),
        ),
        taxRate: $checkedConvert(
          'taxRate',
          (v) => JsonTypeConverters.doubleFromDynamicNullable(v),
        ),
        taxableAmount: $checkedConvert(
          'taxableAmount',
          (v) => JsonTypeConverters.doubleFromDynamicNullable(v),
        ),
        taxAmount: $checkedConvert(
          'taxAmount',
          (v) => JsonTypeConverters.doubleFromDynamicNullable(v),
        ),
        total: $checkedConvert(
          'total',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$TransItemModelToJson(_TransItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itemId': instance.itemId,
      'itemName': instance.itemName,
      'itemCode': instance.itemCode,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
      'costPrice': instance.costPrice,
      'taxRate': ?instance.taxRate,
      'taxableAmount': ?instance.taxableAmount,
      'taxAmount': ?instance.taxAmount,
      'total': instance.total,
    };
