// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_batch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransferBatchModel _$TransferBatchModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_TransferBatchModel', json, ($checkedConvert) {
      final val = _TransferBatchModel(
        batchNumber: $checkedConvert('batchNumber', (v) => v as String),
        quantity: $checkedConvert('quantity', (v) => (v as num).toDouble()),
        costPrice: $checkedConvert('costPrice', (v) => (v as num).toDouble()),
        unitPrice: $checkedConvert('unitPrice', (v) => (v as num).toDouble()),
        expirationDate: $checkedConvert(
          'expirationDate',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        allocatedFrom: $checkedConvert('allocatedFrom', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$TransferBatchModelToJson(_TransferBatchModel instance) =>
    <String, dynamic>{
      'batchNumber': instance.batchNumber,
      'quantity': instance.quantity,
      'costPrice': instance.costPrice,
      'unitPrice': instance.unitPrice,
      'expirationDate': ?instance.expirationDate?.toIso8601String(),
      'allocatedFrom': ?instance.allocatedFrom,
    };
