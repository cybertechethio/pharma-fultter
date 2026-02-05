// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dashboardApiService)
const dashboardApiServiceProvider = DashboardApiServiceProvider._();

final class DashboardApiServiceProvider
    extends
        $FunctionalProvider<
          DashboardApiService,
          DashboardApiService,
          DashboardApiService
        >
    with $Provider<DashboardApiService> {
  const DashboardApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashboardApiServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardApiServiceHash();

  @$internal
  @override
  $ProviderElement<DashboardApiService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DashboardApiService create(Ref ref) {
    return dashboardApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DashboardApiService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DashboardApiService>(value),
    );
  }
}

String _$dashboardApiServiceHash() =>
    r'd495c9cbc82facf599965a9be2b80a56473bbc88';

@ProviderFor(dashboardRemoteDataSource)
const dashboardRemoteDataSourceProvider = DashboardRemoteDataSourceProvider._();

final class DashboardRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          DashboardRemoteDataSource,
          DashboardRemoteDataSource,
          DashboardRemoteDataSource
        >
    with $Provider<DashboardRemoteDataSource> {
  const DashboardRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashboardRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<DashboardRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DashboardRemoteDataSource create(Ref ref) {
    return dashboardRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DashboardRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DashboardRemoteDataSource>(value),
    );
  }
}

String _$dashboardRemoteDataSourceHash() =>
    r'6755a79a72c52e5fe62581aed4a09155d40fdf41';

@ProviderFor(dashboardRepository)
const dashboardRepositoryProvider = DashboardRepositoryProvider._();

final class DashboardRepositoryProvider
    extends
        $FunctionalProvider<
          DashboardRepository,
          DashboardRepository,
          DashboardRepository
        >
    with $Provider<DashboardRepository> {
  const DashboardRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashboardRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardRepositoryHash();

  @$internal
  @override
  $ProviderElement<DashboardRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DashboardRepository create(Ref ref) {
    return dashboardRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DashboardRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DashboardRepository>(value),
    );
  }
}

String _$dashboardRepositoryHash() =>
    r'5a8fce339f8fd826273081df3d529fa8aaf58d25';

@ProviderFor(getDashboardUseCase)
const getDashboardUseCaseProvider = GetDashboardUseCaseProvider._();

final class GetDashboardUseCaseProvider
    extends
        $FunctionalProvider<
          GetDashboardUseCase,
          GetDashboardUseCase,
          GetDashboardUseCase
        >
    with $Provider<GetDashboardUseCase> {
  const GetDashboardUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getDashboardUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getDashboardUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetDashboardUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetDashboardUseCase create(Ref ref) {
    return getDashboardUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetDashboardUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetDashboardUseCase>(value),
    );
  }
}

String _$getDashboardUseCaseHash() =>
    r'ab6d93980d1ee944b3e108c237b4c2d6b20bd455';

@ProviderFor(getDashboard)
const getDashboardProvider = GetDashboardFamily._();

final class GetDashboardProvider
    extends
        $FunctionalProvider<
          AsyncValue<Dashboard>,
          Dashboard,
          FutureOr<Dashboard>
        >
    with $FutureModifier<Dashboard>, $FutureProvider<Dashboard> {
  const GetDashboardProvider._({
    required GetDashboardFamily super.from,
    required ({DateTime startDate, DateTime endDate}) super.argument,
  }) : super(
         retry: null,
         name: r'getDashboardProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getDashboardHash();

  @override
  String toString() {
    return r'getDashboardProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<Dashboard> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Dashboard> create(Ref ref) {
    final argument = this.argument as ({DateTime startDate, DateTime endDate});
    return getDashboard(
      ref,
      startDate: argument.startDate,
      endDate: argument.endDate,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetDashboardProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getDashboardHash() => r'247fdb8b524331a81a1fcdcaa14fed32bfb501ab';

final class GetDashboardFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<Dashboard>,
          ({DateTime startDate, DateTime endDate})
        > {
  const GetDashboardFamily._()
    : super(
        retry: null,
        name: r'getDashboardProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetDashboardProvider call({
    required DateTime startDate,
    required DateTime endDate,
  }) => GetDashboardProvider._(
    argument: (startDate: startDate, endDate: endDate),
    from: this,
  );

  @override
  String toString() => r'getDashboardProvider';
}
