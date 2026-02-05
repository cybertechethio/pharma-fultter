// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BatchModel _$BatchModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_BatchModel', json, ($checkedConvert) {
      final val = _BatchModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        itemId: $checkedConvert('itemId', (v) => (v as num).toInt()),
        batchNumber: $checkedConvert('batchNumber', (v) => v as String? ?? ''),
        batchName: $checkedConvert('batchName', (v) => v as String? ?? 'N/A'),
        itemName: $checkedConvert('itemName', (v) => v as String? ?? 'N/A'),
        itemCode: $checkedConvert('itemCode', (v) => v as String? ?? 'N/A'),
        expirationDate: $checkedConvert(
          'expirationDate',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        manufacturingDate: $checkedConvert(
          'manufacturingDate',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        costPrice: $checkedConvert(
          'costPrice',
          (v) => JsonTypeConverters.doubleFromDynamicNullable(v),
        ),
        unitPrice: $checkedConvert(
          'unitPrice',
          (v) => JsonTypeConverters.doubleFromDynamicNullable(v),
        ),
        supplierBatchNumber: $checkedConvert(
          'supplierBatchNumber',
          (v) => v as String?,
        ),
        notes: $checkedConvert('notes', (v) => v as String?),
        isActive: $checkedConvert('isActive', (v) => v as bool? ?? true),
        quantity: $checkedConvert(
          'quantity',
          (v) => v == null ? 0 : JsonTypeConverters.intFromDynamic(v),
        ),
        createdAt: $checkedConvert(
          'createdAt',
          (v) => DateTime.parse(v as String),
        ),
        createdBy: $checkedConvert('createdBy', (v) => v as String?),
        updatedBy: $checkedConvert('updatedBy', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$BatchModelToJson(_BatchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itemId': instance.itemId,
      'batchNumber': instance.batchNumber,
      'batchName': instance.batchName,
      'itemName': instance.itemName,
      'itemCode': instance.itemCode,
      'expirationDate': ?instance.expirationDate?.toIso8601String(),
      'manufacturingDate': ?instance.manufacturingDate?.toIso8601String(),
      'costPrice': ?instance.costPrice,
      'unitPrice': ?instance.unitPrice,
      'supplierBatchNumber': ?instance.supplierBatchNumber,
      'notes': ?instance.notes,
      'isActive': instance.isActive,
      'quantity': instance.quantity,
      'createdAt': instance.createdAt.toIso8601String(),
      'createdBy': ?instance.createdBy,
      'updatedBy': ?instance.updatedBy,
    };
