import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/enums/stock_status_enum.dart';
import '../../../../shared/models/paginated_response.dart';
import '../../domain/entities/stock.dart';
import '../../domain/repositories/stock_repository.dart';
import '../datasources/stock_remote_data_source.dart';
import '../mappers/stock_mapper.dart';

class StockRepositoryImpl implements StockRepository {
  final StockRemoteDataSource _remoteDataSource;

  StockRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, PaginatedResponse<Stock>>> getStocks({
    int page = 1,
    int limit = 25,
    String? search,
  }) async {
    final result = await _remoteDataSource.getStocks(
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
  Future<Either<Failure, Stock>> updateStock({
    required int id,
    String? lowStockThreshold,
    String? location,
    StockStatus? lowStockStatus,
  }) async {
    final result = await _remoteDataSource.updateStock(
      id: id,
      lowStockThreshold: lowStockThreshold,
      location: location,
      lowStockStatus: lowStockStatus,
    );
    
    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }
}

