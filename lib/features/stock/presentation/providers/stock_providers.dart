import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/datasources/stock_api_service.dart';
import '../../data/datasources/stock_remote_data_source.dart';
import '../../data/datasources/stock_remote_data_source_impl.dart';
import '../../data/repositories/stock_repository_impl.dart';
import '../../domain/repositories/stock_repository.dart';
import '../../domain/usecases/get_stocks_usecase.dart';
import '../../domain/usecases/update_stock_usecase.dart';

part 'stock_providers.g.dart';

// Dependency Injection Providers
@riverpod
StockApiService stockApiService(Ref ref) {
  return const StockApiService();
}

@riverpod
StockRemoteDataSource stockRemoteDataSource(Ref ref) {
  return StockRemoteDataSourceImpl(
    ref.watch(stockApiServiceProvider),
  );
}

@riverpod
StockRepository stockRepository(Ref ref) {
  return StockRepositoryImpl(
    ref.watch(stockRemoteDataSourceProvider),
  );
}

@riverpod
GetStocksUseCase getStocksUseCase(Ref ref) {
  return GetStocksUseCase(
    ref.watch(stockRepositoryProvider),
  );
}

@riverpod
UpdateStockUseCase updateStockUseCase(Ref ref) {
  return UpdateStockUseCase(
    ref.watch(stockRepositoryProvider),
  );
}

