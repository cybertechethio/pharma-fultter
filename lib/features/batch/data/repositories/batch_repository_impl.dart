import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../../domain/entities/batch.dart';
import '../../domain/entities/batch_input.dart';
import '../../domain/repositories/batch_repository.dart';
import '../datasources/batch_remote_data_source.dart';
import '../mappers/batch_mapper.dart';
import '../models/batch_consolidation_request_model.dart';
import '../models/batch_split_request_model.dart';
import '../models/batch_transfer_request_model.dart';

class BatchRepositoryImpl implements BatchRepository {
  final BatchRemoteDataSource _remoteDataSource;

  BatchRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<BatchEntity>>> getBatchesByItemId(int itemId) async {
    final result = await _remoteDataSource.getBatchesByItemId(itemId);
    return result.fold(
      (failure) => Left(failure),
      (models) => Right(models.map((m) => m.toDomain()).toList()),
    );
  }

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
  Future<Either<Failure, BatchEntity>> createBatch(BatchInput input) async {
    final response = await _remoteDataSource.createBatch(input.toRequestModel());
    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, BatchEntity>> updateBatch(int id, BatchInput input) async {
    final response = await _remoteDataSource.updateBatch(
      id,
      input.toRequestModel(itemIdOverride: 0),
    );
    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, void>> transfer(
    BatchTransferRequestModel request,
  ) async {
    return _remoteDataSource.transfer(request);
  }

  @override
  Future<Either<Failure, void>> consolidation(
    BatchConsolidationRequestModel request,
  ) async {
    return _remoteDataSource.consolidation(request);
  }

  @override
  Future<Either<Failure, void>> split(BatchSplitRequestModel request) async {
    return _remoteDataSource.split(request);
  }
}

