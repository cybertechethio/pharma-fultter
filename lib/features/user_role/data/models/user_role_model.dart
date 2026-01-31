// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_role_model.freezed.dart';
part 'user_role_model.g.dart';

@freezed
sealed class UserBranchRoleAssignmentModel with _$UserBranchRoleAssignmentModel {
  const factory UserBranchRoleAssignmentModel({
    required int branchId,
    required String branchName,
    required List<RoleAssignmentModel> roles,
  }) = _UserBranchRoleAssignmentModel;

  factory UserBranchRoleAssignmentModel.fromJson(Map<String, dynamic> json) =>
      _$UserBranchRoleAssignmentModelFromJson(json);
}

@freezed
sealed class RoleAssignmentModel with _$RoleAssignmentModel {
  const factory RoleAssignmentModel({
    required int id,
    required String name,
  }) = _RoleAssignmentModel;

  factory RoleAssignmentModel.fromJson(Map<String, dynamic> json) =>
      _$RoleAssignmentModelFromJson(json);
}

