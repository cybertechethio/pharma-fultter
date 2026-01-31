import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/brand.dart';
import '../../domain/repositories/brand_repository.dart';
import '../datasources/brand_remote_data_source.dart';
import '../mappers/brand_mapper.dart';

class BrandRepositoryImpl implements BrandRepository {
  final BrandRemoteDataSource _remoteDataSource;

  BrandRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<BrandEntity>>> getBrands({
    String? search,
  }) async {
    final response = await _remoteDataSource.getBrands(search: search);
    return response.fold(
      (failure) => Left(failure),
      (models) => Right(models.map((m) => m.toDomain()).toList()),
    );
  }

  @override
  Future<Either<Failure, BrandEntity>> createBrand({
    required String name,
    required String description,
  }) async {
    final response = await _remoteDataSource.createBrand(
      name: name,
      description: description,
    );
    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, BrandEntity>> updateBrand({
    required String id,
    required String name,
    required String description,
  }) async {
    final response = await _remoteDataSource.updateBrand(
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
  Future<Either<Failure, BrandEntity>> deleteBrand({required String id}) async {
    final response = await _remoteDataSource.deleteBrand(id: id);
    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }
}

