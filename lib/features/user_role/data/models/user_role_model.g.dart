// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_role_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserBranchRoleAssignmentModel _$UserBranchRoleAssignmentModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_UserBranchRoleAssignmentModel', json, ($checkedConvert) {
  final val = _UserBranchRoleAssignmentModel(
    branchId: $checkedConvert('branchId', (v) => (v as num).toInt()),
    branchName: $checkedConvert('branchName', (v) => v as String),
    roles: $checkedConvert(
      'roles',
      (v) => (v as List<dynamic>)
          .map((e) => RoleAssignmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$UserBranchRoleAssignmentModelToJson(
  _UserBranchRoleAssignmentModel instance,
) => <String, dynamic>{
  'branchId': instance.branchId,
  'branchName': instance.branchName,
  'roles': instance.roles.map((e) => e.toJson()).toList(),
};

_RoleAssignmentModel _$RoleAssignmentModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_RoleAssignmentModel', json, ($checkedConvert) {
      final val = _RoleAssignmentModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$RoleAssignmentModelToJson(
  _RoleAssignmentModel instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};
