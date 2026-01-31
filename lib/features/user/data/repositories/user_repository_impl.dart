import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_remote_data_source.dart';
import '../mappers/user_mapper.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _remote;

  UserRepositoryImpl(this._remote);

  @override
  Future<Either<Failure, List<UserEntity>>> getUsers() async {
    final response = await _remote.getUsers();
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
  Future<Either<Failure, UserEntity>> createUser({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    bool isActive = true,
  }) async {
    final response = await _remote.createUser(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      isActive: isActive,
    );

    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, UserEntity>> updateUser({
    required int id,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    bool isActive = true,
  }) async {
    final response = await _remote.updateUser(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      isActive: isActive,
    );

    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, UserEntity>> deleteUser({
    required int id,
  }) async {
    final response = await _remote.deleteUser(id: id);
    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }
}

