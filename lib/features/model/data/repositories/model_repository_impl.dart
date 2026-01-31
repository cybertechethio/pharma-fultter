import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/model.dart';
import '../../domain/repositories/model_repository.dart';
import '../datasources/model_remote_data_source.dart';
import '../mappers/model_mapper.dart';

class ModelRepositoryImpl implements ModelRepository {
  final ModelRemoteDataSource _remoteDataSource;

  ModelRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<ModelEntity>>> getModels() async {
    final response = await _remoteDataSource.getModels();
    return response.fold(
      (failure) => Left(failure),
      (models) => Right(models.map((m) => m.toDomain()).toList()),
    );
  }

  @override
  Future<Either<Failure, ModelEntity>> createModel({
    required String name,
    required String description,
  }) async {
    final response = await _remoteDataSource.createModel(
      name: name,
      description: description,
    );
    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, ModelEntity>> updateModel({
    required String id,
    required String name,
    required String description,
  }) async {
    final response = await _remoteDataSource.updateModel(
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
  Future<Either<Failure, ModelEntity>> deleteModel({required String id}) async {
    final response = await _remoteDataSource.deleteModel(id: id);
    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }
}

