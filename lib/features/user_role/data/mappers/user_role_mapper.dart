import '../../domain/entities/user_role.dart';
import '../models/user_role_model.dart';

extension UserRoleMapper on UserBranchRoleAssignmentModel {
  UserBranchRoleAssignment toDomain() {
    return UserBranchRoleAssignment(
      branchId: branchId,
      branchName: branchName,
      roles: roles.map((r) => r.toDomain()).toList(),
    );
  }
}

extension RoleAssignmentMapper on RoleAssignmentModel {
  RoleAssignment toDomain() {
    return RoleAssignment(
      id: id,
      name: name,
    );
  }
}

