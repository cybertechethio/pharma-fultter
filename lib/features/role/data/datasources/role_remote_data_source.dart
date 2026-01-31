import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/role_model.dart';

abstract class RoleRemoteDataSource {
  Future<Either<Failure, List<RoleModel>>> getRoles();
  Future<Either<Failure, RoleModel>> createRole({
    required String name,
    String? description,
    required List<int> permissionIds,
    bool isActive = true,
  });
  Future<Either<Failure, RoleModel>> updateRole({
    required int id,
    required String name,
    String? description,
    required List<int> permissionIds,
    bool isActive = true,
  });
  Future<Either<Failure, RoleModel>> deleteRole({required int id});
}

