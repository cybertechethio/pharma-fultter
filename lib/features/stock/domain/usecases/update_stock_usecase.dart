import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/enums/stock_status_enum.dart';
import '../entities/stock.dart';
import '../repositories/stock_repository.dart';

class UpdateStockUseCase {
  final StockRepository _repository;

  UpdateStockUseCase(this._repository);

  /// Update stock with optional fields
  /// 
  /// [id] - Stock ID to update
  /// [lowStockThreshold] - Optional new threshold value
  /// [location] - Optional new location value
  /// [lowStockStatus] - Optional new status (new, critical, ignored)
  Future<Either<Failure, Stock>> call({
    required int id,
    String? lowStockThreshold,
    String? location,
    StockStatus? lowStockStatus,
  }) async {
    return await _repository.updateStock(
      id: id,
      lowStockThreshold: lowStockThreshold,
      location: location,
      lowStockStatus: lowStockStatus,
    );
  }
}

