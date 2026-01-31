// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BankModel _$BankModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_BankModel', json, ($checkedConvert) {
      final val = _BankModel(
        id: $checkedConvert('id', (v) => JsonTypeConverters.intFromDynamic(v)),
        companyId: $checkedConvert('companyId', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
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

Map<String, dynamic> _$BankModelToJson(_BankModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'name': instance.name,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': ?instance.updatedAt?.toIso8601String(),
      'createdBy': ?instance.createdBy,
      'updatedBy': ?instance.updatedBy,
    };
