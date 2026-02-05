// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_transfer_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BatchTransferRequestModel _$BatchTransferRequestModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_BatchTransferRequestModel', json, ($checkedConvert) {
  final val = _BatchTransferRequestModel(
    itemId: $checkedConvert('itemId', (v) => (v as num).toInt()),
    sourceBatchNumber: $checkedConvert('sourceBatchNumber', (v) => v as String),
    destinationBatchNumber: $checkedConvert(
      'destinationBatchNumber',
      (v) => v as String,
    ),
    quantity: $checkedConvert('quantity', (v) => (v as num).toInt()),
    costPrice: $checkedConvert('costPrice', (v) => (v as num?)?.toDouble()),
    unitPrice: $checkedConvert('unitPrice', (v) => (v as num?)?.toDouble()),
    expirationDate: $checkedConvert('expirationDate', (v) => v as String?),
    notes: $checkedConvert('notes', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$BatchTransferRequestModelToJson(
  _BatchTransferRequestModel instance,
) => <String, dynamic>{
  'itemId': instance.itemId,
  'sourceBatchNumber': instance.sourceBatchNumber,
  'destinationBatchNumber': instance.destinationBatchNumber,
  'quantity': instance.quantity,
  'costPrice': ?instance.costPrice,
  'unitPrice': ?instance.unitPrice,
  'expirationDate': ?instance.expirationDate,
  'notes': ?instance.notes,
};
