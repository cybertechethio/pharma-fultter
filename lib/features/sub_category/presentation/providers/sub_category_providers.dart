import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/datasources/sub_category_api_service.dart';
import '../../data/datasources/sub_category_remote_data_source.dart';
import '../../data/datasources/sub_category_remote_data_source_impl.dart';
import '../../data/repositories/sub_category_repository_impl.dart';
import '../../domain/repositories/sub_category_repository.dart';
import '../../domain/usecases/get_sub_categories_usecase.dart';
import '../../domain/usecases/get_sub_categories_by_category_usecase.dart';
import '../../domain/usecases/create_sub_category_usecase.dart';
import '../../domain/usecases/update_sub_category_usecase.dart';
import '../../domain/usecases/delete_sub_category_usecase.dart';

part 'sub_category_providers.g.dart';

@riverpod
SubCategoryApiService subCategoryApiService(Ref ref) {
  return const SubCategoryApiService();
}

@riverpod
SubCategoryRemoteDataSource subCategoryRemoteDataSource(Ref ref) {
  return SubCategoryRemoteDataSourceImpl(
    ref.watch(subCategoryApiServiceProvider),
  );
}

@riverpod
SubCategoryRepository subCategoryRepository(Ref ref) {
  return SubCategoryRepositoryImpl(
    ref.watch(subCategoryRemoteDataSourceProvider),
  );
}

@riverpod
GetSubCategoriesUseCase getSubCategoriesUseCase(Ref ref) {
  return GetSubCategoriesUseCase(
    ref.watch(subCategoryRepositoryProvider),
  );
}

@riverpod
GetSubCategoriesByCategoryUseCase getSubCategoriesByCategoryUseCase(Ref ref) {
  return GetSubCategoriesByCategoryUseCase(
    ref.watch(subCategoryRepositoryProvider),
  );
}

@riverpod
CreateSubCategoryUseCase createSubCategoryUseCase(Ref ref) {
  return CreateSubCategoryUseCase(
    ref.watch(subCategoryRepositoryProvider),
  );
}

@riverpod
UpdateSubCategoryUseCase updateSubCategoryUseCase(Ref ref) {
  return UpdateSubCategoryUseCase(
    ref.watch(subCategoryRepositoryProvider),
  );
}

@riverpod
DeleteSubCategoryUseCase deleteSubCategoryUseCase(Ref ref) {
  return DeleteSubCategoryUseCase(
    ref.watch(subCategoryRepositoryProvider),
  );
}

