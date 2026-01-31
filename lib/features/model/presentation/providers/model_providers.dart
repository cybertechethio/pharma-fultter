import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/datasources/model_api_service.dart';
import '../../data/datasources/model_remote_data_source.dart';
import '../../data/datasources/model_remote_data_source_impl.dart';
import '../../data/repositories/model_repository_impl.dart';
import '../../domain/repositories/model_repository.dart';
import '../../domain/usecases/get_models_usecase.dart';
import '../../domain/usecases/create_model_usecase.dart';
import '../../domain/usecases/update_model_usecase.dart';
import '../../domain/usecases/delete_model_usecase.dart';

part 'model_providers.g.dart';

@riverpod
ModelApiService modelApiService(Ref ref) {
  return const ModelApiService();
}

@riverpod
ModelRemoteDataSource modelRemoteDataSource(Ref ref) {
  return ModelRemoteDataSourceImpl(
    ref.watch(modelApiServiceProvider),
  );
}

@riverpod
ModelRepository modelRepository(Ref ref) {
  return ModelRepositoryImpl(
    ref.watch(modelRemoteDataSourceProvider),
  );
}

@riverpod
GetModelsUseCase getModelsUseCase(Ref ref) {
  return GetModelsUseCase(
    ref.watch(modelRepositoryProvider),
  );
}

@riverpod
CreateModelUseCase createModelUseCase(Ref ref) {
  return CreateModelUseCase(
    ref.watch(modelRepositoryProvider),
  );
}

@riverpod
UpdateModelUseCase updateModelUseCase(Ref ref) {
  return UpdateModelUseCase(
    ref.watch(modelRepositoryProvider),
  );
}

@riverpod
DeleteModelUseCase deleteModelUseCase(Ref ref) {
  return DeleteModelUseCase(
    ref.watch(modelRepositoryProvider),
  );
}

