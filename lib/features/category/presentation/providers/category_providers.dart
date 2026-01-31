import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/datasources/category_api_service.dart';
import '../../data/datasources/category_remote_data_source.dart';
import '../../data/datasources/category_remote_data_source_impl.dart';
import '../../data/repositories/category_repository_impl.dart';
import '../../domain/repositories/category_repository.dart';
import '../../domain/usecases/get_categories_usecase.dart';
import '../../domain/usecases/create_category_usecase.dart';
import '../../domain/usecases/update_category_usecase.dart';
import '../../domain/usecases/delete_category_usecase.dart';

part 'category_providers.g.dart';

@Riverpod(keepAlive: true)
CategoryApiService categoryApiService(Ref ref) {
  return const CategoryApiService();
}

@Riverpod(keepAlive: true)
CategoryRemoteDataSource categoryRemoteDataSource(Ref ref) {
  return CategoryRemoteDataSourceImpl(
    ref.watch(categoryApiServiceProvider),
  );
}

@Riverpod(keepAlive: true)
CategoryRepository categoryRepository(Ref ref) {
  return CategoryRepositoryImpl(
    ref.watch(categoryRemoteDataSourceProvider),
  );
}

@Riverpod(keepAlive: true)
GetCategoriesUseCase getCategoriesUseCase(Ref ref) {
  return GetCategoriesUseCase(
    ref.watch(categoryRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
CreateCategoryUseCase createCategoryUseCase(Ref ref) {
  return CreateCategoryUseCase(
    ref.watch(categoryRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
UpdateCategoryUseCase updateCategoryUseCase(Ref ref) {
  return UpdateCategoryUseCase(
    ref.watch(categoryRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
DeleteCategoryUseCase deleteCategoryUseCase(Ref ref) {
  return DeleteCategoryUseCase(
    ref.watch(categoryRepositoryProvider),
  );
}

