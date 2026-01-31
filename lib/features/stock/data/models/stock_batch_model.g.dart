// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_batch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StockBatchModel _$StockBatchModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_StockBatchModel', json, ($checkedConvert) {
      final val = _StockBatchModel(
        id: $checkedConvert('id', (v) => JsonTypeConverters.intFromDynamic(v)),
        batchId: $checkedConvert('batchId', (v) => (v as num).toInt()),
        quantity: $checkedConvert('quantity', (v) => v as String? ?? '0'),
        costPrice: $checkedConvert('costPrice', (v) => v as String? ?? '0'),
        unitPrice: $checkedConvert('unitPrice', (v) => v as String? ?? '0'),
        lastUsedAt: $checkedConvert(
          'lastUsedAt',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        batchNumber: $checkedConvert('batchNumber', (v) => v as String? ?? ''),
        batchName: $checkedConvert('batchName', (v) => v as String? ?? ''),
        expirationDate: $checkedConvert(
          'expirationDate',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
      );
      return val;
    });

Map<String, dynamic> _$StockBatchModelToJson(_StockBatchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'batchId': instance.batchId,
      'quantity': instance.quantity,
      'costPrice': instance.costPrice,
      'unitPrice': instance.unitPrice,
      'lastUsedAt': ?instance.lastUsedAt?.toIso8601String(),
      'batchNumber': instance.batchNumber,
      'batchName': instance.batchName,
      'expirationDate': ?instance.expirationDate?.toIso8601String(),
    };
