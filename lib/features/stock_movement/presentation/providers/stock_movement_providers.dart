import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/datasources/stock_movement_api_service.dart';
import '../../data/datasources/stock_movement_remote_data_source.dart';
import '../../data/datasources/stock_movement_remote_data_source_impl.dart';
import '../../data/repositories/stock_movement_repository_impl.dart';
import '../../domain/repositories/stock_movement_repository.dart';
import '../../domain/usecases/get_stock_movements_usecase.dart';

part 'stock_movement_providers.g.dart';

// Dependency Injection Providers

@riverpod
StockMovementApiService stockMovementApiService(Ref ref) {
  return const StockMovementApiService();
}

@riverpod
StockMovementRemoteDataSource stockMovementRemoteDataSource(Ref ref) {
  return StockMovementRemoteDataSourceImpl(
    ref.watch(stockMovementApiServiceProvider),
  );
}

@riverpod
StockMovementRepository stockMovementRepository(Ref ref) {
  return StockMovementRepositoryImpl(
    ref.watch(stockMovementRemoteDataSourceProvider),
  );
}

@riverpod
GetStockMovementsUseCase getStockMovementsUseCase(Ref ref) {
  return GetStockMovementsUseCase(
    ref.watch(stockMovementRepositoryProvider),
  );
}

