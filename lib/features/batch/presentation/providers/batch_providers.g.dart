// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(batchApiService)
const batchApiServiceProvider = BatchApiServiceProvider._();

final class BatchApiServiceProvider
    extends
        $FunctionalProvider<BatchApiService, BatchApiService, BatchApiService>
    with $Provider<BatchApiService> {
  const BatchApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'batchApiServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$batchApiServiceHash();

  @$internal
  @override
  $ProviderElement<BatchApiService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BatchApiService create(Ref ref) {
    return batchApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BatchApiService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BatchApiService>(value),
    );
  }
}

String _$batchApiServiceHash() => r'ac62afd793dabc8b9469c03a22434b3406e7438c';

@ProviderFor(batchRemoteDataSource)
const batchRemoteDataSourceProvider = BatchRemoteDataSourceProvider._();

final class BatchRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          BatchRemoteDataSource,
          BatchRemoteDataSource,
          BatchRemoteDataSource
        >
    with $Provider<BatchRemoteDataSource> {
  const BatchRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'batchRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$batchRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<BatchRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BatchRemoteDataSource create(Ref ref) {
    return batchRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BatchRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BatchRemoteDataSource>(value),
    );
  }
}

String _$batchRemoteDataSourceHash() =>
    r'3edc56d1d9c9916fd72c65fba1fcf34eaea1dbc2';

@ProviderFor(batchRepository)
const batchRepositoryProvider = BatchRepositoryProvider._();

final class BatchRepositoryProvider
    extends
        $FunctionalProvider<BatchRepository, BatchRepository, BatchRepository>
    with $Provider<BatchRepository> {
  const BatchRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'batchRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$batchRepositoryHash();

  @$internal
  @override
  $ProviderElement<BatchRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BatchRepository create(Ref ref) {
    return batchRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BatchRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BatchRepository>(value),
    );
  }
}

String _$batchRepositoryHash() => r'3c31627d4360873dbd59a561357214f4a9f3dbd9';

@ProviderFor(getBatchesByItemUseCase)
const getBatchesByItemUseCaseProvider = GetBatchesByItemUseCaseProvider._();

final class GetBatchesByItemUseCaseProvider
    extends
        $FunctionalProvider<
          GetBatchesByItemUseCase,
          GetBatchesByItemUseCase,
          GetBatchesByItemUseCase
        >
    with $Provider<GetBatchesByItemUseCase> {
  const GetBatchesByItemUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getBatchesByItemUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getBatchesByItemUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetBatchesByItemUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetBatchesByItemUseCase create(Ref ref) {
    return getBatchesByItemUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetBatchesByItemUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetBatchesByItemUseCase>(value),
    );
  }
}

String _$getBatchesByItemUseCaseHash() =>
    r'fb901c9e9cc86cd164a72d240404c5f2ec89d23b';

@ProviderFor(createBatchUseCase)
const createBatchUseCaseProvider = CreateBatchUseCaseProvider._();

final class CreateBatchUseCaseProvider
    extends
        $FunctionalProvider<
          CreateBatchUseCase,
          CreateBatchUseCase,
          CreateBatchUseCase
        >
    with $Provider<CreateBatchUseCase> {
  const CreateBatchUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createBatchUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createBatchUseCaseHash();

  @$internal
  @override
  $ProviderElement<CreateBatchUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CreateBatchUseCase create(Ref ref) {
    return createBatchUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateBatchUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateBatchUseCase>(value),
    );
  }
}

String _$createBatchUseCaseHash() =>
    r'e2e7c2cd7681311e88d40b67430fb933c297fff5';

@ProviderFor(updateBatchUseCase)
const updateBatchUseCaseProvider = UpdateBatchUseCaseProvider._();

final class UpdateBatchUseCaseProvider
    extends
        $FunctionalProvider<
          UpdateBatchUseCase,
          UpdateBatchUseCase,
          UpdateBatchUseCase
        >
    with $Provider<UpdateBatchUseCase> {
  const UpdateBatchUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateBatchUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateBatchUseCaseHash();

  @$internal
  @override
  $ProviderElement<UpdateBatchUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UpdateBatchUseCase create(Ref ref) {
    return updateBatchUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateBatchUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateBatchUseCase>(value),
    );
  }
}

String _$updateBatchUseCaseHash() =>
    r'e1ca2d6bb78a5a5def91baf8ab921e809eee1c22';

@ProviderFor(transferBatchUseCase)
const transferBatchUseCaseProvider = TransferBatchUseCaseProvider._();

final class TransferBatchUseCaseProvider
    extends
        $FunctionalProvider<
          TransferBatchUseCase,
          TransferBatchUseCase,
          TransferBatchUseCase
        >
    with $Provider<TransferBatchUseCase> {
  const TransferBatchUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transferBatchUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transferBatchUseCaseHash();

  @$internal
  @override
  $ProviderElement<TransferBatchUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TransferBatchUseCase create(Ref ref) {
    return transferBatchUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TransferBatchUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TransferBatchUseCase>(value),
    );
  }
}

String _$transferBatchUseCaseHash() =>
    r'49c128585a6943e1b1e6ca944289d7d34955f2c8';

@ProviderFor(consolidateBatchUseCase)
const consolidateBatchUseCaseProvider = ConsolidateBatchUseCaseProvider._();

final class ConsolidateBatchUseCaseProvider
    extends
        $FunctionalProvider<
          ConsolidateBatchUseCase,
          ConsolidateBatchUseCase,
          ConsolidateBatchUseCase
        >
    with $Provider<ConsolidateBatchUseCase> {
  const ConsolidateBatchUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'consolidateBatchUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$consolidateBatchUseCaseHash();

  @$internal
  @override
  $ProviderElement<ConsolidateBatchUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ConsolidateBatchUseCase create(Ref ref) {
    return consolidateBatchUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConsolidateBatchUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConsolidateBatchUseCase>(value),
    );
  }
}

String _$consolidateBatchUseCaseHash() =>
    r'a63cddf96b5ec873b34be305c9e7495c56c5f7ae';

@ProviderFor(splitBatchUseCase)
const splitBatchUseCaseProvider = SplitBatchUseCaseProvider._();

final class SplitBatchUseCaseProvider
    extends
        $FunctionalProvider<
          SplitBatchUseCase,
          SplitBatchUseCase,
          SplitBatchUseCase
        >
    with $Provider<SplitBatchUseCase> {
  const SplitBatchUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'splitBatchUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$splitBatchUseCaseHash();

  @$internal
  @override
  $ProviderElement<SplitBatchUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SplitBatchUseCase create(Ref ref) {
    return splitBatchUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SplitBatchUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SplitBatchUseCase>(value),
    );
  }
}

String _$splitBatchUseCaseHash() => r'b6ef37c31225cb8f9db5d11c0be52f9ecf39da23';
