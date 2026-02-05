// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_movement_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(stockMovementApiService)
const stockMovementApiServiceProvider = StockMovementApiServiceProvider._();

final class StockMovementApiServiceProvider
    extends
        $FunctionalProvider<
          StockMovementApiService,
          StockMovementApiService,
          StockMovementApiService
        >
    with $Provider<StockMovementApiService> {
  const StockMovementApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stockMovementApiServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stockMovementApiServiceHash();

  @$internal
  @override
  $ProviderElement<StockMovementApiService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  StockMovementApiService create(Ref ref) {
    return stockMovementApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StockMovementApiService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StockMovementApiService>(value),
    );
  }
}

String _$stockMovementApiServiceHash() =>
    r'9bb3f7a2c3acf7e349c798f43ddf27a634583391';

@ProviderFor(stockMovementRemoteDataSource)
const stockMovementRemoteDataSourceProvider =
    StockMovementRemoteDataSourceProvider._();

final class StockMovementRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          StockMovementRemoteDataSource,
          StockMovementRemoteDataSource,
          StockMovementRemoteDataSource
        >
    with $Provider<StockMovementRemoteDataSource> {
  const StockMovementRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stockMovementRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stockMovementRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<StockMovementRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  StockMovementRemoteDataSource create(Ref ref) {
    return stockMovementRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StockMovementRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StockMovementRemoteDataSource>(
        value,
      ),
    );
  }
}

String _$stockMovementRemoteDataSourceHash() =>
    r'b838f787f69372261416e05ffd085ec6859f235e';

@ProviderFor(stockMovementRepository)
const stockMovementRepositoryProvider = StockMovementRepositoryProvider._();

final class StockMovementRepositoryProvider
    extends
        $FunctionalProvider<
          StockMovementRepository,
          StockMovementRepository,
          StockMovementRepository
        >
    with $Provider<StockMovementRepository> {
  const StockMovementRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stockMovementRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stockMovementRepositoryHash();

  @$internal
  @override
  $ProviderElement<StockMovementRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  StockMovementRepository create(Ref ref) {
    return stockMovementRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StockMovementRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StockMovementRepository>(value),
    );
  }
}

String _$stockMovementRepositoryHash() =>
    r'1852f55e36fb9dd10848912f3bad94cd7bf7bdda';

@ProviderFor(getStockMovementsUseCase)
const getStockMovementsUseCaseProvider = GetStockMovementsUseCaseProvider._();

final class GetStockMovementsUseCaseProvider
    extends
        $FunctionalProvider<
          GetStockMovementsUseCase,
          GetStockMovementsUseCase,
          GetStockMovementsUseCase
        >
    with $Provider<GetStockMovementsUseCase> {
  const GetStockMovementsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getStockMovementsUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getStockMovementsUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetStockMovementsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetStockMovementsUseCase create(Ref ref) {
    return getStockMovementsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetStockMovementsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetStockMovementsUseCase>(value),
    );
  }
}

String _$getStockMovementsUseCaseHash() =>
    r'ce8b1b344dd352f2102a9259d1e50df197d64a3d';
