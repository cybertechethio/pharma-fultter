import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/datasources/permission_api_service.dart';
import '../../data/datasources/permission_remote_data_source.dart';
import '../../data/datasources/permission_remote_data_source_impl.dart';
import '../../data/repositories/permission_repository_impl.dart';
import '../../domain/repositories/permission_repository.dart';
import '../../domain/usecases/get_permissions_usecase.dart';

part 'permission_providers.g.dart';

@riverpod
PermissionApiService permissionApiService(Ref ref) {
  return const PermissionApiService();
}

@riverpod
PermissionRemoteDataSource permissionRemoteDataSource(Ref ref) {
  return PermissionRemoteDataSourceImpl(
    ref.watch(permissionApiServiceProvider),
  );
}

@riverpod
PermissionRepository permissionRepository(Ref ref) {
  return PermissionRepositoryImpl(
    ref.watch(permissionRemoteDataSourceProvider),
  );
}

@riverpod
GetPermissionsUseCase getPermissionsUseCase(Ref ref) {
  return GetPermissionsUseCase(
    ref.watch(permissionRepositoryProvider),
  );
}


