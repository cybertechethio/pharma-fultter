import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/datasources/user_api_service.dart';
import '../../data/datasources/user_remote_data_source.dart';
import '../../data/datasources/user_remote_data_source_impl.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/usecases/get_users_usecase.dart';
import '../../domain/usecases/create_user_usecase.dart';
import '../../domain/usecases/update_user_usecase.dart';
import '../../domain/usecases/delete_user_usecase.dart';

part 'user_providers.g.dart';

@riverpod
UserApiService userApiService(Ref ref) {
  return const UserApiService();
}

@riverpod
UserRemoteDataSource userRemoteDataSource(Ref ref) {
  return UserRemoteDataSourceImpl(
    ref.watch(userApiServiceProvider),
  );
}

@riverpod
UserRepository userRepository(Ref ref) {
  return UserRepositoryImpl(
    ref.watch(userRemoteDataSourceProvider),
  );
}

@riverpod
GetUsersUseCase getUsersUseCase(Ref ref) {
  return GetUsersUseCase(
    ref.watch(userRepositoryProvider),
  );
}

@riverpod
CreateUserUseCase createUserUseCase(Ref ref) {
  return CreateUserUseCase(
    ref.watch(userRepositoryProvider),
  );
}

@riverpod
UpdateUserUseCase updateUserUseCase(Ref ref) {
  return UpdateUserUseCase(
    ref.watch(userRepositoryProvider),
  );
}

@riverpod
DeleteUserUseCase deleteUserUseCase(Ref ref) {
  return DeleteUserUseCase(
    ref.watch(userRepositoryProvider),
  );
}

