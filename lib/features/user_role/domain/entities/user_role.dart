import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_role.freezed.dart';

@freezed
sealed class UserBranchRoleAssignment with _$UserBranchRoleAssignment {
  const factory UserBranchRoleAssignment({
    required int branchId,
    required String branchName,
    required List<RoleAssignment> roles,
  }) = _UserBranchRoleAssignment;
}

@freezed
sealed class RoleAssignment with _$RoleAssignment {
  const factory RoleAssignment({
    required int id,
    required String name,
  }) = _RoleAssignment;
}

