// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(transactionApiService)
const transactionApiServiceProvider = TransactionApiServiceProvider._();

final class TransactionApiServiceProvider
    extends
        $FunctionalProvider<
          TransactionApiService,
          TransactionApiService,
          TransactionApiService
        >
    with $Provider<TransactionApiService> {
  const TransactionApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transactionApiServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transactionApiServiceHash();

  @$internal
  @override
  $ProviderElement<TransactionApiService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TransactionApiService create(Ref ref) {
    return transactionApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TransactionApiService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TransactionApiService>(value),
    );
  }
}

String _$transactionApiServiceHash() =>
    r'ca160969d67b23c3fbe6e8470ccd99a637d1d020';

@ProviderFor(transactionRemoteDataSource)
const transactionRemoteDataSourceProvider =
    TransactionRemoteDataSourceProvider._();

final class TransactionRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          TransactionRemoteDataSource,
          TransactionRemoteDataSource,
          TransactionRemoteDataSource
        >
    with $Provider<TransactionRemoteDataSource> {
  const TransactionRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transactionRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transactionRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<TransactionRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TransactionRemoteDataSource create(Ref ref) {
    return transactionRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TransactionRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TransactionRemoteDataSource>(value),
    );
  }
}

String _$transactionRemoteDataSourceHash() =>
    r'ce6231b04c99f85d0fc02758a14788673497e9a8';

@ProviderFor(transactionRepository)
const transactionRepositoryProvider = TransactionRepositoryProvider._();

final class TransactionRepositoryProvider
    extends
        $FunctionalProvider<
          TransactionRepository,
          TransactionRepository,
          TransactionRepository
        >
    with $Provider<TransactionRepository> {
  const TransactionRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transactionRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transactionRepositoryHash();

  @$internal
  @override
  $ProviderElement<TransactionRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TransactionRepository create(Ref ref) {
    return transactionRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TransactionRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TransactionRepository>(value),
    );
  }
}

String _$transactionRepositoryHash() =>
    r'448c81bdf48423476ec36542bfe3d11ce786917e';

@ProviderFor(createTransactionUseCase)
const createTransactionUseCaseProvider = CreateTransactionUseCaseProvider._();

final class CreateTransactionUseCaseProvider
    extends
        $FunctionalProvider<
          CreateTransactionUseCase,
          CreateTransactionUseCase,
          CreateTransactionUseCase
        >
    with $Provider<CreateTransactionUseCase> {
  const CreateTransactionUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createTransactionUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createTransactionUseCaseHash();

  @$internal
  @override
  $ProviderElement<CreateTransactionUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CreateTransactionUseCase create(Ref ref) {
    return createTransactionUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateTransactionUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateTransactionUseCase>(value),
    );
  }
}

String _$createTransactionUseCaseHash() =>
    r'3041a2ab0ffba64e1d4c71c5a0676299af810b6b';

@ProviderFor(getTransactionsUseCase)
const getTransactionsUseCaseProvider = GetTransactionsUseCaseProvider._();

final class GetTransactionsUseCaseProvider
    extends
        $FunctionalProvider<
          GetTransactionsUseCase,
          GetTransactionsUseCase,
          GetTransactionsUseCase
        >
    with $Provider<GetTransactionsUseCase> {
  const GetTransactionsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getTransactionsUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getTransactionsUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetTransactionsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetTransactionsUseCase create(Ref ref) {
    return getTransactionsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetTransactionsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetTransactionsUseCase>(value),
    );
  }
}

String _$getTransactionsUseCaseHash() =>
    r'2ee618e7f9c5e810aa16671da25a8f187378c2ad';

@ProviderFor(getTransactionDetailUseCase)
const getTransactionDetailUseCaseProvider =
    GetTransactionDetailUseCaseProvider._();

final class GetTransactionDetailUseCaseProvider
    extends
        $FunctionalProvider<
          GetTransactionDetailUseCase,
          GetTransactionDetailUseCase,
          GetTransactionDetailUseCase
        >
    with $Provider<GetTransactionDetailUseCase> {
  const GetTransactionDetailUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getTransactionDetailUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getTransactionDetailUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetTransactionDetailUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetTransactionDetailUseCase create(Ref ref) {
    return getTransactionDetailUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetTransactionDetailUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetTransactionDetailUseCase>(value),
    );
  }
}

String _$getTransactionDetailUseCaseHash() =>
    r'ddaf679ea8a029bcea53261b4ebff055ff8cc18d';

@ProviderFor(reverseTransactionUseCase)
const reverseTransactionUseCaseProvider = ReverseTransactionUseCaseProvider._();

final class ReverseTransactionUseCaseProvider
    extends
        $FunctionalProvider<
          ReverseTransactionUseCase,
          ReverseTransactionUseCase,
          ReverseTransactionUseCase
        >
    with $Provider<ReverseTransactionUseCase> {
  const ReverseTransactionUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reverseTransactionUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reverseTransactionUseCaseHash();

  @$internal
  @override
  $ProviderElement<ReverseTransactionUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ReverseTransactionUseCase create(Ref ref) {
    return reverseTransactionUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReverseTransactionUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReverseTransactionUseCase>(value),
    );
  }
}

String _$reverseTransactionUseCaseHash() =>
    r'3718141583fa1326ab80d8ee2fca7ac6bf72fbd6';
