import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/unit.dart';
import '../../domain/repositories/unit_repository.dart';
import '../datasources/unit_remote_data_source.dart';
import '../mappers/unit_mapper.dart';

class UnitRepositoryImpl implements UnitRepository {
  final UnitRemoteDataSource _remoteDataSource;

  UnitRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<UnitEntity>>> getUnits({String? search}) async {
    final response = await _remoteDataSource.getUnits(search: search);
    return response.fold(
      (failure) => Left(failure),
      (models) => Right(models.map((m) => m.toDomain()).toList()),
    );
  }

  @override
  Future<Either<Failure, UnitEntity>> createUnit({
    required String name,
    required String description,
  }) async {
    final response = await _remoteDataSource.createUnit(
      name: name,
      description: description,
    );
    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, UnitEntity>> updateUnit({
    required String id,
    required String name,
    required String description,
  }) async {
    final response = await _remoteDataSource.updateUnit(
      id: id,
      name: name,
      description: description,
    );
    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, UnitEntity>> deleteUnit({required String id}) async {
    final response = await _remoteDataSource.deleteUnit(id: id);
    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }
}

