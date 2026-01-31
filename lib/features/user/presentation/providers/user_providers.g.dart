// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userApiService)
const userApiServiceProvider = UserApiServiceProvider._();

final class UserApiServiceProvider
    extends $FunctionalProvider<UserApiService, UserApiService, UserApiService>
    with $Provider<UserApiService> {
  const UserApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userApiServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userApiServiceHash();

  @$internal
  @override
  $ProviderElement<UserApiService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserApiService create(Ref ref) {
    return userApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserApiService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserApiService>(value),
    );
  }
}

String _$userApiServiceHash() => r'e93f8aecddb95ec955beda73d04fa8ee7825b361';

@ProviderFor(userRemoteDataSource)
const userRemoteDataSourceProvider = UserRemoteDataSourceProvider._();

final class UserRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          UserRemoteDataSource,
          UserRemoteDataSource,
          UserRemoteDataSource
        >
    with $Provider<UserRemoteDataSource> {
  const UserRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<UserRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UserRemoteDataSource create(Ref ref) {
    return userRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserRemoteDataSource>(value),
    );
  }
}

String _$userRemoteDataSourceHash() =>
    r'9add9dd72fec3d3947747aced694d10d3f44db02';

@ProviderFor(userRepository)
const userRepositoryProvider = UserRepositoryProvider._();

final class UserRepositoryProvider
    extends $FunctionalProvider<UserRepository, UserRepository, UserRepository>
    with $Provider<UserRepository> {
  const UserRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userRepositoryHash();

  @$internal
  @override
  $ProviderElement<UserRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserRepository create(Ref ref) {
    return userRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserRepository>(value),
    );
  }
}

String _$userRepositoryHash() => r'78606b68c038a0b347d86931701bc33a28996c87';

@ProviderFor(getUsersUseCase)
const getUsersUseCaseProvider = GetUsersUseCaseProvider._();

final class GetUsersUseCaseProvider
    extends
        $FunctionalProvider<GetUsersUseCase, GetUsersUseCase, GetUsersUseCase>
    with $Provider<GetUsersUseCase> {
  const GetUsersUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getUsersUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getUsersUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetUsersUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetUsersUseCase create(Ref ref) {
    return getUsersUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetUsersUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetUsersUseCase>(value),
    );
  }
}

String _$getUsersUseCaseHash() => r'cf0715e264ac0a926877e10f1da176c8f06df688';

@ProviderFor(createUserUseCase)
const createUserUseCaseProvider = CreateUserUseCaseProvider._();

final class CreateUserUseCaseProvider
    extends
        $FunctionalProvider<
          CreateUserUseCase,
          CreateUserUseCase,
          CreateUserUseCase
        >
    with $Provider<CreateUserUseCase> {
  const CreateUserUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createUserUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createUserUseCaseHash();

  @$internal
  @override
  $ProviderElement<CreateUserUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CreateUserUseCase create(Ref ref) {
    return createUserUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateUserUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateUserUseCase>(value),
    );
  }
}

String _$createUserUseCaseHash() => r'a7da3515ec524ed4a8d2c17b8f90b29d6d2317b5';

@ProviderFor(updateUserUseCase)
const updateUserUseCaseProvider = UpdateUserUseCaseProvider._();

final class UpdateUserUseCaseProvider
    extends
        $FunctionalProvider<
          UpdateUserUseCase,
          UpdateUserUseCase,
          UpdateUserUseCase
        >
    with $Provider<UpdateUserUseCase> {
  const UpdateUserUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateUserUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateUserUseCaseHash();

  @$internal
  @override
  $ProviderElement<UpdateUserUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UpdateUserUseCase create(Ref ref) {
    return updateUserUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateUserUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateUserUseCase>(value),
    );
  }
}

String _$updateUserUseCaseHash() => r'6724f271250fc20e9b729b8640eb9f496683ed12';

@ProviderFor(deleteUserUseCase)
const deleteUserUseCaseProvider = DeleteUserUseCaseProvider._();

final class DeleteUserUseCaseProvider
    extends
        $FunctionalProvider<
          DeleteUserUseCase,
          DeleteUserUseCase,
          DeleteUserUseCase
        >
    with $Provider<DeleteUserUseCase> {
  const DeleteUserUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteUserUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteUserUseCaseHash();

  @$internal
  @override
  $ProviderElement<DeleteUserUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeleteUserUseCase create(Ref ref) {
    return deleteUserUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteUserUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteUserUseCase>(value),
    );
  }
}

String _$deleteUserUseCaseHash() => r'6f4c9be8ac05efa4e9e4db27416ce60f4b9bfb27';
