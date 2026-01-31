// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(roleApiService)
const roleApiServiceProvider = RoleApiServiceProvider._();

final class RoleApiServiceProvider
    extends $FunctionalProvider<RoleApiService, RoleApiService, RoleApiService>
    with $Provider<RoleApiService> {
  const RoleApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'roleApiServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$roleApiServiceHash();

  @$internal
  @override
  $ProviderElement<RoleApiService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RoleApiService create(Ref ref) {
    return roleApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RoleApiService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RoleApiService>(value),
    );
  }
}

String _$roleApiServiceHash() => r'77ef6bc3da0f478022b0d8251f1c8acf867ee926';

@ProviderFor(roleRemoteDataSource)
const roleRemoteDataSourceProvider = RoleRemoteDataSourceProvider._();

final class RoleRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          RoleRemoteDataSource,
          RoleRemoteDataSource,
          RoleRemoteDataSource
        >
    with $Provider<RoleRemoteDataSource> {
  const RoleRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'roleRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$roleRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<RoleRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RoleRemoteDataSource create(Ref ref) {
    return roleRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RoleRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RoleRemoteDataSource>(value),
    );
  }
}

String _$roleRemoteDataSourceHash() =>
    r'eb78dfb8a7dd08c480aa7100d3a7b7e0863fcead';

@ProviderFor(roleRepository)
const roleRepositoryProvider = RoleRepositoryProvider._();

final class RoleRepositoryProvider
    extends $FunctionalProvider<RoleRepository, RoleRepository, RoleRepository>
    with $Provider<RoleRepository> {
  const RoleRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'roleRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$roleRepositoryHash();

  @$internal
  @override
  $ProviderElement<RoleRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RoleRepository create(Ref ref) {
    return roleRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RoleRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RoleRepository>(value),
    );
  }
}

String _$roleRepositoryHash() => r'615781e36ad24bf88e840c4d967b1448358cc830';

@ProviderFor(getRolesUseCase)
const getRolesUseCaseProvider = GetRolesUseCaseProvider._();

final class GetRolesUseCaseProvider
    extends
        $FunctionalProvider<GetRolesUseCase, GetRolesUseCase, GetRolesUseCase>
    with $Provider<GetRolesUseCase> {
  const GetRolesUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getRolesUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getRolesUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetRolesUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetRolesUseCase create(Ref ref) {
    return getRolesUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetRolesUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetRolesUseCase>(value),
    );
  }
}

String _$getRolesUseCaseHash() => r'7e1a4eea21578d8c40a3234192966461ea1079aa';

@ProviderFor(createRoleUseCase)
const createRoleUseCaseProvider = CreateRoleUseCaseProvider._();

final class CreateRoleUseCaseProvider
    extends
        $FunctionalProvider<
          CreateRoleUseCase,
          CreateRoleUseCase,
          CreateRoleUseCase
        >
    with $Provider<CreateRoleUseCase> {
  const CreateRoleUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createRoleUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createRoleUseCaseHash();

  @$internal
  @override
  $ProviderElement<CreateRoleUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CreateRoleUseCase create(Ref ref) {
    return createRoleUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateRoleUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateRoleUseCase>(value),
    );
  }
}

String _$createRoleUseCaseHash() => r'c09edd9e12e828cf7e8b9556aa97d336830cd75c';

@ProviderFor(updateRoleUseCase)
const updateRoleUseCaseProvider = UpdateRoleUseCaseProvider._();

final class UpdateRoleUseCaseProvider
    extends
        $FunctionalProvider<
          UpdateRoleUseCase,
          UpdateRoleUseCase,
          UpdateRoleUseCase
        >
    with $Provider<UpdateRoleUseCase> {
  const UpdateRoleUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateRoleUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateRoleUseCaseHash();

  @$internal
  @override
  $ProviderElement<UpdateRoleUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UpdateRoleUseCase create(Ref ref) {
    return updateRoleUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateRoleUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateRoleUseCase>(value),
    );
  }
}

String _$updateRoleUseCaseHash() => r'1a46cb20c0c6c313f74ace9ac92b8f44cbc8b2f8';

@ProviderFor(deleteRoleUseCase)
const deleteRoleUseCaseProvider = DeleteRoleUseCaseProvider._();

final class DeleteRoleUseCaseProvider
    extends
        $FunctionalProvider<
          DeleteRoleUseCase,
          DeleteRoleUseCase,
          DeleteRoleUseCase
        >
    with $Provider<DeleteRoleUseCase> {
  const DeleteRoleUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteRoleUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteRoleUseCaseHash();

  @$internal
  @override
  $ProviderElement<DeleteRoleUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeleteRoleUseCase create(Ref ref) {
    return deleteRoleUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteRoleUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteRoleUseCase>(value),
    );
  }
}

String _$deleteRoleUseCaseHash() => r'6741b35066ac0b75c4c01e5a1b6d19c5dc49210e';
