// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_permission_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RolePermissionModel _$RolePermissionModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_RolePermissionModel', json, ($checkedConvert) {
      final val = _RolePermissionModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        description: $checkedConvert('description', (v) => v as String?),
        category: $checkedConvert('category', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$RolePermissionModelToJson(
  _RolePermissionModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'description': ?instance.description,
  'category': ?instance.category,
};
