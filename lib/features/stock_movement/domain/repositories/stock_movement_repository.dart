import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../entities/stock_movement.dart';

abstract class StockMovementRepository {
  Future<Either<Failure, PaginatedResponse<StockMovement>>> getStockMovements({
    required int itemId,
    int page = 1,
    int limit = 500,
  });
}
