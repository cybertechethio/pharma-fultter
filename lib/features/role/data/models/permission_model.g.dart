// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PermissionModel _$PermissionModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_PermissionModel', json, ($checkedConvert) {
      final val = _PermissionModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
        description: $checkedConvert('description', (v) => v as String?),
        category: $checkedConvert('category', (v) => v as String?),
        isActive: $checkedConvert('isActive', (v) => v as bool? ?? true),
        createdAt: $checkedConvert(
          'createdAt',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        createdBy: $checkedConvert('createdBy', (v) => (v as num?)?.toInt()),
        updatedBy: $checkedConvert('updatedBy', (v) => (v as num?)?.toInt()),
      );
      return val;
    });

Map<String, dynamic> _$PermissionModelToJson(_PermissionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': ?instance.description,
      'category': ?instance.category,
      'isActive': instance.isActive,
      'createdAt': ?instance.createdAt?.toIso8601String(),
      'createdBy': ?instance.createdBy,
      'updatedBy': ?instance.updatedBy,
    };
