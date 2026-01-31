import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/datasources/user_role_api_service.dart';
import '../../data/datasources/user_role_remote_data_source.dart';
import '../../data/datasources/user_role_remote_data_source_impl.dart';
import '../../data/repositories/user_role_repository_impl.dart';
import '../../domain/repositories/user_role_repository.dart';
import '../../domain/usecases/get_user_role_assignments_usecase.dart';
import '../../domain/usecases/assign_user_roles_usecase.dart';

part 'user_role_providers.g.dart';

@riverpod
UserRoleApiService userRoleApiService(Ref ref) {
  return const UserRoleApiService();
}

@riverpod
UserRoleRemoteDataSource userRoleRemoteDataSource(Ref ref) {
  return UserRoleRemoteDataSourceImpl(
    ref.watch(userRoleApiServiceProvider),
  );
}

@riverpod
UserRoleRepository userRoleRepository(Ref ref) {
  return UserRoleRepositoryImpl(
    ref.watch(userRoleRemoteDataSourceProvider),
  );
}

@riverpod
GetUserRoleAssignmentsUseCase getUserRoleAssignmentsUseCase(Ref ref) {
  return GetUserRoleAssignmentsUseCase(
    ref.watch(userRoleRepositoryProvider),
  );
}

@riverpod
AssignUserRolesUseCase assignUserRolesUseCase(Ref ref) {
  return AssignUserRolesUseCase(
    ref.watch(userRoleRepositoryProvider),
  );
}

