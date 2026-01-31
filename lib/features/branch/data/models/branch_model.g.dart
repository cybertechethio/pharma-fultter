// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BranchModel _$BranchModelFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_BranchModel',
  json,
  ($checkedConvert) {
    final val = _BranchModel(
      id: $checkedConvert('id', (v) => JsonTypeConverters.stringFromDynamic(v)),
      name: $checkedConvert('name', (v) => v as String),
      companyId: $checkedConvert(
        'companyId',
        (v) => JsonTypeConverters.stringFromDynamic(v),
      ),
      isActive: $checkedConvert('isActive', (v) => v as bool? ?? true),
      createdAt: $checkedConvert(
        'createdAt',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      createdBy: $checkedConvert(
        'createdBy',
        (v) => JsonTypeConverters.stringFromDynamicNullable(v),
      ),
      updatedBy: $checkedConvert(
        'updatedBy',
        (v) => JsonTypeConverters.stringFromDynamicNullable(v),
      ),
    );
    return val;
  },
);

Map<String, dynamic> _$BranchModelToJson(_BranchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'companyId': instance.companyId,
      'isActive': instance.isActive,
      'createdAt': ?instance.createdAt?.toIso8601String(),
      'createdBy': ?instance.createdBy,
      'updatedBy': ?instance.updatedBy,
    };
