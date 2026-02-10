import 'package:cyber_pos/features/transfer/data/mappers/transfer_mapper.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/enums/transfer_status_enum.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../../domain/entities/transfer.dart';
import '../../domain/repositories/transfer_repository.dart';
import '../datasources/transfer_remote_data_source.dart';
import '../models/create_transfer_request.dart';

class TransferRepositoryImpl implements TransferRepository {
  final TransferRemoteDataSource _remoteDataSource;

  TransferRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, PaginatedResponse<Transfer>>> getTransfers({
    int page = 1,
    int limit = 25,
  }) async {
    final result = await _remoteDataSource.getTransfers(
      page: page,
      limit: limit,
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
  Future<Either<Failure, Transfer>> getTransferDetail(int id) async {
    final response = await _remoteDataSource.getTransferDetail(id);

    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, Transfer>> createTransfer({
    required CreateTransferRequest data,
  }) async {
    
    final response = await _remoteDataSource.createTransfer(
      request: data,
    );

    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, Transfer>> updateStatus({
    required int id,
    required TransferStatus status,
  }) async {
    final response = await _remoteDataSource.updateStatus(
      id: id,
      status: status,
    );

    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }
}

