import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../../domain/entities/batch.dart';
import '../../domain/repositories/batch_repository.dart';
import '../datasources/batch_remote_data_source.dart';
import '../mappers/batch_mapper.dart';

class BatchRepositoryImpl implements BatchRepository {
  final BatchRemoteDataSource _remoteDataSource;

  BatchRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, PaginatedResponse<BatchEntity>>> getBatches({
    int page = 1,
    int limit = 25,
    String? search,
  }) async {
    final result = await _remoteDataSource.getBatches(
      page: page,
      limit: limit,
      search: search,
    );
    
    return result.fold(
      (failure) => Left(failure),
      (paginatedModels) {
        // Convert models to entities
        final entities = paginatedModels.data
            .map((model) => model.toDomain())
            .toList();

        // Return paginated response with entities
        return Right(PaginatedResponse(
          data: entities,
          pagination: paginatedModels.pagination,
        ));
      },
    );
  }

  @override
  Future<Either<Failure, BatchEntity>> createBatch({
    required int itemId,
    required String batchName,
  }) async {
    final response = await _remoteDataSource.createBatch(
      itemId: itemId,
      batchName: batchName,
    );
    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, BatchEntity>> updateBatch({
    required int id,
    required String batchName,
  }) async {
    final response = await _remoteDataSource.updateBatch(
      id: id,
      batchName: batchName,
    );
    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }
}

