import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../entities/stock_movement.dart';
import '../repositories/stock_movement_repository.dart';

class GetStockMovementsUseCase {
  final StockMovementRepository _repository;

  GetStockMovementsUseCase(this._repository);

  Future<Either<Failure, PaginatedResponse<StockMovement>>> call({
    required int itemId,
    int page = 1,
    int limit = 500,
  }) async {
    return await _repository.getStockMovements(
      itemId: itemId,
      page: page,
      limit: limit,
    );
  }
}
