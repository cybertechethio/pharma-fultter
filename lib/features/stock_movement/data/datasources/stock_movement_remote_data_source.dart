import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../models/stock_movement_model.dart';

abstract class StockMovementRemoteDataSource {
  Future<Either<Failure, PaginatedResponse<StockMovementModel>>> getStockMovements({
    required int itemId,
    int page = 1,
    int limit = 500,
  });
}
