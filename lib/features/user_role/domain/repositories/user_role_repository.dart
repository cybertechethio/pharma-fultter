import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/user_role.dart';

abstract class UserRoleRepository {
  Future<Either<Failure, List<UserBranchRoleAssignment>>> getUserRoleAssignments({
    required int userId,
  });
  
  Future<Either<Failure, List<UserBranchRoleAssignment>>> assignUserRoles({
    required int userId,
    required List<BranchRoleAssignmentRequest> assignments,
  });
}

class BranchRoleAssignmentRequest {
  final int branchId;
  final List<int> roleIds;

  BranchRoleAssignmentRequest({
    required this.branchId,
    required this.roleIds,
  });
}

