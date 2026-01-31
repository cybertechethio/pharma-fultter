import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/datasources/role_api_service.dart';
import '../../data/datasources/role_remote_data_source.dart';
import '../../data/datasources/role_remote_data_source_impl.dart';
import '../../data/repositories/role_repository_impl.dart';
import '../../domain/repositories/role_repository.dart';
import '../../domain/usecases/get_roles_usecase.dart';
import '../../domain/usecases/create_role_usecase.dart';
import '../../domain/usecases/update_role_usecase.dart';
import '../../domain/usecases/delete_role_usecase.dart';

part 'role_providers.g.dart';

@riverpod
RoleApiService roleApiService(Ref ref) {
  return const RoleApiService();
}

@riverpod
RoleRemoteDataSource roleRemoteDataSource(Ref ref) {
  return RoleRemoteDataSourceImpl(
    ref.watch(roleApiServiceProvider),
  );
}

@riverpod
RoleRepository roleRepository(Ref ref) {
  return RoleRepositoryImpl(
    ref.watch(roleRemoteDataSourceProvider),
  );
}

@riverpod
GetRolesUseCase getRolesUseCase(Ref ref) {
  return GetRolesUseCase(
    ref.watch(roleRepositoryProvider),
  );
}

@riverpod
CreateRoleUseCase createRoleUseCase(Ref ref) {
  return CreateRoleUseCase(
    ref.watch(roleRepositoryProvider),
  );
}

@riverpod
UpdateRoleUseCase updateRoleUseCase(Ref ref) {
  return UpdateRoleUseCase(
    ref.watch(roleRepositoryProvider),
  );
}

@riverpod
DeleteRoleUseCase deleteRoleUseCase(Ref ref) {
  return DeleteRoleUseCase(
    ref.watch(roleRepositoryProvider),
  );
}


