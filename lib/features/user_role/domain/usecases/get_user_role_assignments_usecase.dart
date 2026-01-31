import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/user_role.dart';
import '../repositories/user_role_repository.dart';

class GetUserRoleAssignmentsUseCase {
  final UserRoleRepository repository;

  GetUserRoleAssignmentsUseCase(this.repository);

  Future<Either<Failure, List<UserBranchRoleAssignment>>> call({
    required int userId,
  }) async {
    return await repository.getUserRoleAssignments(userId: userId);
  }
}

