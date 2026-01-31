// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoleModel _$RoleModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_RoleModel', json, ($checkedConvert) {
      final val = _RoleModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
        description: $checkedConvert('description', (v) => v as String?),
        companyId: $checkedConvert('companyId', (v) => (v as num).toInt()),
        isActive: $checkedConvert('isActive', (v) => v as bool? ?? true),
        createdAt: $checkedConvert(
          'createdAt',
          (v) => DateTime.parse(v as String),
        ),
        updatedAt: $checkedConvert(
          'updatedAt',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        permissions: $checkedConvert(
          'permissions',
          (v) =>
              (v as List<dynamic>?)
                  ?.map(
                    (e) =>
                        RolePermissionModel.fromJson(e as Map<String, dynamic>),
                  )
                  .toList() ??
              const <RolePermissionModel>[],
        ),
      );
      return val;
    });

Map<String, dynamic> _$RoleModelToJson(_RoleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': ?instance.description,
      'companyId': instance.companyId,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': ?instance.updatedAt?.toIso8601String(),
      'permissions': instance.permissions.map((e) => e.toJson()).toList(),
    };
