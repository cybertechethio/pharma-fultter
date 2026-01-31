// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BatchModel _$BatchModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_BatchModel', json, ($checkedConvert) {
      final val = _BatchModel(
        id: $checkedConvert('id', (v) => JsonTypeConverters.intFromDynamic(v)),
        companyId: $checkedConvert('companyId', (v) => (v as num).toInt()),
        itemId: $checkedConvert('itemId', (v) => (v as num).toInt()),
        batchNumber: $checkedConvert('batchNumber', (v) => v as String? ?? ''),
        batchName: $checkedConvert('batchName', (v) => v as String),
        itemName: $checkedConvert('itemName', (v) => v as String? ?? 'N/A'),
        expirationDate: $checkedConvert(
          'expirationDate',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        manufacturingDate: $checkedConvert(
          'manufacturingDate',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        costPrice: $checkedConvert('costPrice', (v) => v as String?),
        supplierBatchNumber: $checkedConvert(
          'supplierBatchNumber',
          (v) => v as String?,
        ),
        notes: $checkedConvert('notes', (v) => v as String?),
        isActive: $checkedConvert('isActive', (v) => v as bool? ?? true),
        createdAt: $checkedConvert(
          'createdAt',
          (v) => DateTime.parse(v as String),
        ),
        updatedAt: $checkedConvert(
          'updatedAt',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        createdBy: $checkedConvert('createdBy', (v) => (v as num?)?.toInt()),
        updatedBy: $checkedConvert('updatedBy', (v) => (v as num?)?.toInt()),
      );
      return val;
    });

Map<String, dynamic> _$BatchModelToJson(_BatchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'itemId': instance.itemId,
      'batchNumber': instance.batchNumber,
      'batchName': instance.batchName,
      'itemName': instance.itemName,
      'expirationDate': ?instance.expirationDate?.toIso8601String(),
      'manufacturingDate': ?instance.manufacturingDate?.toIso8601String(),
      'costPrice': ?instance.costPrice,
      'supplierBatchNumber': ?instance.supplierBatchNumber,
      'notes': ?instance.notes,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': ?instance.updatedAt?.toIso8601String(),
      'createdBy': ?instance.createdBy,
      'updatedBy': ?instance.updatedBy,
    };
