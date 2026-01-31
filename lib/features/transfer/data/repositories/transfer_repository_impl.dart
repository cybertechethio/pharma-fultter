import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../../../../shared/models/pagination_model.dart';
import '../../domain/entities/transfer.dart';
import '../../domain/entities/transfer_data.dart';
import '../../domain/repositories/transfer_repository.dart';
import '../datasources/transfer_remote_data_source.dart';
import '../mappers/transfer_mapper.dart';

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
      (models) {
        final transfers = models.map((model) => model.toDomain()).toList();
        // Create pagination model from response
        final pagination = PaginationModel(
          currentPage: page,
          totalPages: (transfers.length / limit).ceil(),
          totalItems: transfers.length,
          itemsPerPage: limit,
          hasNextPage: transfers.length == limit,
          hasPrevPage: page > 1,
          nextPage: transfers.length == limit ? page + 1 : null,
          prevPage: page > 1 ? page - 1 : null,
        );
        return Right(PaginatedResponse(
          data: transfers,
          pagination: pagination,
        ));
      },
    );
  }

  @override
  Future<Either<Failure, Transfer>> getTransferDetail(int id) async {
    final result = await _remoteDataSource.getTransferDetail(id);

    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, Transfer>> createTransfer({
    required TransferData data,
  }) async {
    final model = data.toModel();
    final result = await _remoteDataSource.createTransfer(request: model);

    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }
}













