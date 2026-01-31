import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/datasources/batch_api_service.dart';
import '../../data/datasources/batch_remote_data_source.dart';
import '../../data/datasources/batch_remote_data_source_impl.dart';
import '../../data/repositories/batch_repository_impl.dart';
import '../../domain/repositories/batch_repository.dart';
import '../../domain/usecases/get_batches_usecase.dart';
import '../../domain/usecases/create_batch_usecase.dart';
import '../../domain/usecases/update_batch_usecase.dart';

part 'batch_providers.g.dart';

@riverpod
BatchApiService batchApiService(Ref ref) {
  return const BatchApiService();
}

@riverpod
BatchRemoteDataSource batchRemoteDataSource(Ref ref) {
  return BatchRemoteDataSourceImpl(
    ref.watch(batchApiServiceProvider),
  );
}

@riverpod
BatchRepository batchRepository(Ref ref) {
  return BatchRepositoryImpl(
    ref.watch(batchRemoteDataSourceProvider),
  );
}

@riverpod
GetBatchesUseCase getBatchesUseCase(Ref ref) {
  return GetBatchesUseCase(
    ref.watch(batchRepositoryProvider),
  );
}

@riverpod
CreateBatchUseCase createBatchUseCase(Ref ref) {
  return CreateBatchUseCase(
    ref.watch(batchRepositoryProvider),
  );
}

@riverpod
UpdateBatchUseCase updateBatchUseCase(Ref ref) {
  return UpdateBatchUseCase(
    ref.watch(batchRepositoryProvider),
  );
}

