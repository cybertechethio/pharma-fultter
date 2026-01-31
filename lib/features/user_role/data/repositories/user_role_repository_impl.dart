import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/user_role.dart';
import '../../domain/repositories/user_role_repository.dart';
import '../datasources/user_role_remote_data_source.dart';
import '../mappers/user_role_mapper.dart';

class UserRoleRepositoryImpl implements UserRoleRepository {
  final UserRoleRemoteDataSource _remote;

  UserRoleRepositoryImpl(this._remote);

  @override
  Future<Either<Failure, List<UserBranchRoleAssignment>>> getUserRoleAssignments({
    required int userId,
  }) async {
    final response = await _remote.getUserRoleAssignments(userId: userId);
    return response.fold(
      (failure) => Left(failure),
      (models) {
        // Convert models to entities
        final entities = models.map((m) => m.toDomain()).toList();
        return Right(entities);
      },
    );
  }

  @override
  Future<Either<Failure, List<UserBranchRoleAssignment>>> assignUserRoles({
    required int userId,
    required List<BranchRoleAssignmentRequest> assignments,
  }) async {
    // Convert request objects to Map for API
    final assignmentsData = assignments.map((assignment) => {
      'branchId': assignment.branchId,
      'roleIds': assignment.roleIds,
    }).toList();

    final response = await _remote.assignUserRoles(
      userId: userId,
      assignments: assignmentsData,
    );

    return response.fold(
      (failure) => Left(failure),
      (models) {
        // Convert models to entities
        final entities = models.map((m) => m.toDomain()).toList();
        return Right(entities);
      },
    );
  }
}

