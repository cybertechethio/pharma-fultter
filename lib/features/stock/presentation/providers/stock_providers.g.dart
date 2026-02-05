// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(stockApiService)
const stockApiServiceProvider = StockApiServiceProvider._();

final class StockApiServiceProvider
    extends
        $FunctionalProvider<StockApiService, StockApiService, StockApiService>
    with $Provider<StockApiService> {
  const StockApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stockApiServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stockApiServiceHash();

  @$internal
  @override
  $ProviderElement<StockApiService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  StockApiService create(Ref ref) {
    return stockApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StockApiService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StockApiService>(value),
    );
  }
}

String _$stockApiServiceHash() => r'04b0af653ebbe2c9831f45863b624a41c762d7e4';

@ProviderFor(stockRemoteDataSource)
const stockRemoteDataSourceProvider = StockRemoteDataSourceProvider._();

final class StockRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          StockRemoteDataSource,
          StockRemoteDataSource,
          StockRemoteDataSource
        >
    with $Provider<StockRemoteDataSource> {
  const StockRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stockRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stockRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<StockRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  StockRemoteDataSource create(Ref ref) {
    return stockRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StockRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StockRemoteDataSource>(value),
    );
  }
}

String _$stockRemoteDataSourceHash() =>
    r'a2f4c48d959e3fe0cbb91cc7a7a6bbe535207bf5';

@ProviderFor(stockRepository)
const stockRepositoryProvider = StockRepositoryProvider._();

final class StockRepositoryProvider
    extends
        $FunctionalProvider<StockRepository, StockRepository, StockRepository>
    with $Provider<StockRepository> {
  const StockRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stockRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stockRepositoryHash();

  @$internal
  @override
  $ProviderElement<StockRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  StockRepository create(Ref ref) {
    return stockRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StockRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StockRepository>(value),
    );
  }
}

String _$stockRepositoryHash() => r'5af80ed453b82202af9820e72da95db4a18edcf8';

@ProviderFor(getStocksUseCase)
const getStocksUseCaseProvider = GetStocksUseCaseProvider._();

final class GetStocksUseCaseProvider
    extends
        $FunctionalProvider<
          GetStocksUseCase,
          GetStocksUseCase,
          GetStocksUseCase
        >
    with $Provider<GetStocksUseCase> {
  const GetStocksUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getStocksUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getStocksUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetStocksUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetStocksUseCase create(Ref ref) {
    return getStocksUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetStocksUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetStocksUseCase>(value),
    );
  }
}

String _$getStocksUseCaseHash() => r'70c24cbb7ae54291d07962c753b3ea77ff0e82fe';

@ProviderFor(updateStockUseCase)
const updateStockUseCaseProvider = UpdateStockUseCaseProvider._();

final class UpdateStockUseCaseProvider
    extends
        $FunctionalProvider<
          UpdateStockUseCase,
          UpdateStockUseCase,
          UpdateStockUseCase
        >
    with $Provider<UpdateStockUseCase> {
  const UpdateStockUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateStockUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateStockUseCaseHash();

  @$internal
  @override
  $ProviderElement<UpdateStockUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UpdateStockUseCase create(Ref ref) {
    return updateStockUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateStockUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateStockUseCase>(value),
    );
  }
}

String _$updateStockUseCaseHash() =>
    r'5a1f66210f7947fbd7be211876b74f4432a2c357';
