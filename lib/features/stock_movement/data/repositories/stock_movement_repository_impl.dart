import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../../domain/entities/stock_movement.dart';
import '../../domain/repositories/stock_movement_repository.dart';
import '../datasources/stock_movement_remote_data_source.dart';
import '../mappers/stock_movement_mapper.dart';

class StockMovementRepositoryImpl implements StockMovementRepository {
  final StockMovementRemoteDataSource _remoteDataSource;

  StockMovementRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, PaginatedResponse<StockMovement>>> getStockMovements({
    required int itemId,
    int page = 1,
    int limit = 500,
  }) async {
    final result = await _remoteDataSource.getStockMovements(
      itemId: itemId,
      page: page,
      limit: limit,
    );

    return result.fold(
      (failure) => Left(failure),
      (paginatedModels) {
        final entities = paginatedModels.data
            .map((model) => model.toDomain())
            .toList();

        return Right(PaginatedResponse(
          data: entities,
          pagination: paginatedModels.pagination,
        ));
      },
    );
  }
}
