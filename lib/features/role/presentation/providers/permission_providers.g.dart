// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(permissionApiService)
const permissionApiServiceProvider = PermissionApiServiceProvider._();

final class PermissionApiServiceProvider
    extends
        $FunctionalProvider<
          PermissionApiService,
          PermissionApiService,
          PermissionApiService
        >
    with $Provider<PermissionApiService> {
  const PermissionApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'permissionApiServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$permissionApiServiceHash();

  @$internal
  @override
  $ProviderElement<PermissionApiService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PermissionApiService create(Ref ref) {
    return permissionApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PermissionApiService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PermissionApiService>(value),
    );
  }
}

String _$permissionApiServiceHash() =>
    r'c70a48fc55fee501179dce0eb02acfd9edf9f02d';

@ProviderFor(permissionRemoteDataSource)
const permissionRemoteDataSourceProvider =
    PermissionRemoteDataSourceProvider._();

final class PermissionRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          PermissionRemoteDataSource,
          PermissionRemoteDataSource,
          PermissionRemoteDataSource
        >
    with $Provider<PermissionRemoteDataSource> {
  const PermissionRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'permissionRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$permissionRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<PermissionRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PermissionRemoteDataSource create(Ref ref) {
    return permissionRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PermissionRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PermissionRemoteDataSource>(value),
    );
  }
}

String _$permissionRemoteDataSourceHash() =>
    r'00b9b8bed9cabdd8f0b3d0e2e7505dad040d6747';

@ProviderFor(permissionRepository)
const permissionRepositoryProvider = PermissionRepositoryProvider._();

final class PermissionRepositoryProvider
    extends
        $FunctionalProvider<
          PermissionRepository,
          PermissionRepository,
          PermissionRepository
        >
    with $Provider<PermissionRepository> {
  const PermissionRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'permissionRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$permissionRepositoryHash();

  @$internal
  @override
  $ProviderElement<PermissionRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PermissionRepository create(Ref ref) {
    return permissionRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PermissionRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PermissionRepository>(value),
    );
  }
}

String _$permissionRepositoryHash() =>
    r'1f990b701886a466693de281eeb9b2ee927ca552';

@ProviderFor(getPermissionsUseCase)
const getPermissionsUseCaseProvider = GetPermissionsUseCaseProvider._();

final class GetPermissionsUseCaseProvider
    extends
        $FunctionalProvider<
          GetPermissionsUseCase,
          GetPermissionsUseCase,
          GetPermissionsUseCase
        >
    with $Provider<GetPermissionsUseCase> {
  const GetPermissionsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getPermissionsUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getPermissionsUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetPermissionsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetPermissionsUseCase create(Ref ref) {
    return getPermissionsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetPermissionsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetPermissionsUseCase>(value),
    );
  }
}

String _$getPermissionsUseCaseHash() =>
    r'fc5fa4e28a8eed74f7bff47ac6bbdf9e647999a7';
