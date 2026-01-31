import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/user_role_model.dart';

abstract class UserRoleRemoteDataSource {
  Future<Either<Failure, List<UserBranchRoleAssignmentModel>>> getUserRoleAssignments({
    required int userId,
  });
  
  Future<Either<Failure, List<UserBranchRoleAssignmentModel>>> assignUserRoles({
    required int userId,
    required List<Map<String, dynamic>> assignments,
  });
}

