import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/role.dart';
import '../../domain/repositories/role_repository.dart';
import '../datasources/role_remote_data_source.dart';
import '../mappers/role_mapper.dart';

class RoleRepositoryImpl implements RoleRepository {
  final RoleRemoteDataSource _remote;

  RoleRepositoryImpl(this._remote);

  @override
  Future<Either<Failure, List<RoleEntity>>> getRoles() async {
    final response = await _remote.getRoles();
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
  Future<Either<Failure, RoleEntity>> createRole({
    required String name,
    String? description,
    required List<int> permissionIds,
    bool isActive = true,
  }) async {
    final response = await _remote.createRole(
      name: name,
      description: description,
      permissionIds: permissionIds,
      isActive: isActive,
    );

    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, RoleEntity>> updateRole({
    required int id,
    required String name,
    String? description,
    required List<int> permissionIds,
    bool isActive = true,
  }) async {
    final response = await _remote.updateRole(
      id: id,
      name: name,
      description: description,
      permissionIds: permissionIds,
      isActive: isActive,
    );

    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, RoleEntity>> deleteRole({
    required int id,
  }) async {
    final response = await _remote.deleteRole(id: id);
    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }
}

