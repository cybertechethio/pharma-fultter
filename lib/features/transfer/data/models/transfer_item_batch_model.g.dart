// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_item_batch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransferItemBatchModel _$TransferItemBatchModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_TransferItemBatchModel', json, ($checkedConvert) {
  final val = _TransferItemBatchModel(
    id: $checkedConvert('id', (v) => (v as num).toInt()),
    transferItemId: $checkedConvert(
      'transferItemId',
      (v) => (v as num?)?.toInt(),
    ),
    batchNumber: $checkedConvert('batchNumber', (v) => v as String),
    quantity: $checkedConvert('quantity', (v) => (v as num).toInt()),
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

Map<String, dynamic> _$TransferItemBatchModelToJson(
  _TransferItemBatchModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'transferItemId': ?instance.transferItemId,
  'batchNumber': instance.batchNumber,
  'quantity': instance.quantity,
  'costPrice': ?instance.costPrice,
  'unitPrice': ?instance.unitPrice,
  'expirationDate': ?instance.expirationDate?.toIso8601String(),
};
