import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/datasources/brand_api_service.dart';
import '../../data/datasources/brand_remote_data_source.dart';
import '../../data/datasources/brand_remote_data_source_impl.dart';
import '../../data/repositories/brand_repository_impl.dart';
import '../../domain/repositories/brand_repository.dart';
import '../../domain/usecases/get_brands_usecase.dart';
import '../../domain/usecases/create_brand_usecase.dart';
import '../../domain/usecases/update_brand_usecase.dart';
import '../../domain/usecases/delete_brand_usecase.dart';

part 'brand_providers.g.dart';

@riverpod
BrandApiService brandApiService(Ref ref) {
  return const BrandApiService();
}

@riverpod
BrandRemoteDataSource brandRemoteDataSource(Ref ref) {
  return BrandRemoteDataSourceImpl(
    ref.watch(brandApiServiceProvider),
  );
}

@riverpod
BrandRepository brandRepository(Ref ref) {
  return BrandRepositoryImpl(
    ref.watch(brandRemoteDataSourceProvider),
  );
}

@riverpod
GetBrandsUseCase getBrandsUseCase(Ref ref) {
  return GetBrandsUseCase(
    ref.watch(brandRepositoryProvider),
  );
}

@riverpod
CreateBrandUseCase createBrandUseCase(Ref ref) {
  return CreateBrandUseCase(
    ref.watch(brandRepositoryProvider),
  );
}

@riverpod
UpdateBrandUseCase updateBrandUseCase(Ref ref) {
  return UpdateBrandUseCase(
    ref.watch(brandRepositoryProvider),
  );
}

@riverpod
DeleteBrandUseCase deleteBrandUseCase(Ref ref) {
  return DeleteBrandUseCase(
    ref.watch(brandRepositoryProvider),
  );
}

