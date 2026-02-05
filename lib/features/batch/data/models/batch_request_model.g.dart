// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BatchRequestModel _$BatchRequestModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_BatchRequestModel', json, ($checkedConvert) {
      final val = _BatchRequestModel(
        itemId: $checkedConvert('itemId', (v) => (v as num).toInt()),
        batchName: $checkedConvert('batchName', (v) => v as String),
        costPrice: $checkedConvert('costPrice', (v) => (v as num).toDouble()),
        unitPrice: $checkedConvert('unitPrice', (v) => (v as num).toDouble()),
        expirationDate: $checkedConvert('expirationDate', (v) => v as String?),
        manufacturingDate: $checkedConvert(
          'manufacturingDate',
          (v) => v as String?,
        ),
        supplierBatchNumber: $checkedConvert(
          'supplierBatchNumber',
          (v) => v as String?,
        ),
        notes: $checkedConvert('notes', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$BatchRequestModelToJson(_BatchRequestModel instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'batchName': instance.batchName,
      'costPrice': instance.costPrice,
      'unitPrice': instance.unitPrice,
      'expirationDate': ?instance.expirationDate,
      'manufacturingDate': ?instance.manufacturingDate,
      'supplierBatchNumber': ?instance.supplierBatchNumber,
      'notes': ?instance.notes,
    };
