import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/role.dart';

abstract class RoleRepository {
  Future<Either<Failure, List<RoleEntity>>> getRoles();
  
  Future<Either<Failure, RoleEntity>> createRole({
    required String name,
    String? description,
    required List<int> permissionIds,
    bool isActive = true,
  });
  
  Future<Either<Failure, RoleEntity>> updateRole({
    required int id,
    required String name,
    String? description,
    required List<int> permissionIds,
    bool isActive = true,
  });
  
  Future<Either<Failure, RoleEntity>> deleteRole({
    required int id,
  });
}

