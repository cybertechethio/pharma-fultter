// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trans_item_batch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransItemBatchModel _$TransItemBatchModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_TransItemBatchModel', json, ($checkedConvert) {
      final val = _TransItemBatchModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        transactionItemId: $checkedConvert(
          'transactionItemId',
          (v) => (v as num).toInt(),
        ),
        batchNumber: $checkedConvert('batchNumber', (v) => v as String),
        quantity: $checkedConvert(
          'quantity',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        costPrice: $checkedConvert(
          'costPrice',
          (v) => JsonTypeConverters.doubleFromDynamicNullable(v),
        ),
        unitPrice: $checkedConvert(
          'unitPrice',
          (v) => JsonTypeConverters.doubleFromDynamicNullable(v),
        ),
        expirationDate: $checkedConvert(
          'expirationDate',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
      );
      return val;
    });

Map<String, dynamic> _$TransItemBatchModelToJson(
  _TransItemBatchModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'transactionItemId': instance.transactionItemId,
  'batchNumber': instance.batchNumber,
  'quantity': instance.quantity,
  'costPrice': ?instance.costPrice,
  'unitPrice': ?instance.unitPrice,
  'expirationDate': ?instance.expirationDate?.toIso8601String(),
};
