import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/user_role.dart';
import '../repositories/user_role_repository.dart';

class AssignUserRolesUseCase {
  final UserRoleRepository repository;

  AssignUserRolesUseCase(this.repository);

  Future<Either<Failure, List<UserBranchRoleAssignment>>> call({
    required int userId,
    required List<BranchRoleAssignmentRequest> assignments,
  }) async {
    // Validation: At least one branch must be selected
    if (assignments.isEmpty) {
      return Left(Failure.validationError('At least one branch must be selected'));
    }

    // Validation: Each assignment must have valid branchId
    for (final assignment in assignments) {
      if (assignment.branchId <= 0) {
        return Left(Failure.validationError('Invalid branch ID'));
      }
      // Empty roleIds array is allowed (removes all roles from branch)
    }

    return await repository.assignUserRoles(
      userId: userId,
      assignments: assignments,
    );
  }
}

