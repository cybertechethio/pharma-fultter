// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(transferApiService)
const transferApiServiceProvider = TransferApiServiceProvider._();

final class TransferApiServiceProvider
    extends
        $FunctionalProvider<
          TransferApiService,
          TransferApiService,
          TransferApiService
        >
    with $Provider<TransferApiService> {
  const TransferApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transferApiServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transferApiServiceHash();

  @$internal
  @override
  $ProviderElement<TransferApiService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TransferApiService create(Ref ref) {
    return transferApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TransferApiService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TransferApiService>(value),
    );
  }
}

String _$transferApiServiceHash() =>
    r'de2579fcac3336b5ea9f9bb384f8be4340177a0e';

@ProviderFor(transferRemoteDataSource)
const transferRemoteDataSourceProvider = TransferRemoteDataSourceProvider._();

final class TransferRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          TransferRemoteDataSource,
          TransferRemoteDataSource,
          TransferRemoteDataSource
        >
    with $Provider<TransferRemoteDataSource> {
  const TransferRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transferRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transferRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<TransferRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TransferRemoteDataSource create(Ref ref) {
    return transferRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TransferRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TransferRemoteDataSource>(value),
    );
  }
}

String _$transferRemoteDataSourceHash() =>
    r'b90d7aa09f951f3ad43c9a3630fd2cf307d70b5a';

@ProviderFor(transferRepository)
const transferRepositoryProvider = TransferRepositoryProvider._();

final class TransferRepositoryProvider
    extends
        $FunctionalProvider<
          TransferRepository,
          TransferRepository,
          TransferRepository
        >
    with $Provider<TransferRepository> {
  const TransferRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transferRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transferRepositoryHash();

  @$internal
  @override
  $ProviderElement<TransferRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TransferRepository create(Ref ref) {
    return transferRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TransferRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TransferRepository>(value),
    );
  }
}

String _$transferRepositoryHash() =>
    r'4d174a14f98833243527b6a1e700652543bcb523';

@ProviderFor(createTransferUseCase)
const createTransferUseCaseProvider = CreateTransferUseCaseProvider._();

final class CreateTransferUseCaseProvider
    extends
        $FunctionalProvider<
          CreateTransferUseCase,
          CreateTransferUseCase,
          CreateTransferUseCase
        >
    with $Provider<CreateTransferUseCase> {
  const CreateTransferUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createTransferUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createTransferUseCaseHash();

  @$internal
  @override
  $ProviderElement<CreateTransferUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CreateTransferUseCase create(Ref ref) {
    return createTransferUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateTransferUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateTransferUseCase>(value),
    );
  }
}

String _$createTransferUseCaseHash() =>
    r'eedf5c8d03bae14af11bca02725bc02076800b24';

@ProviderFor(getTransfersUseCase)
const getTransfersUseCaseProvider = GetTransfersUseCaseProvider._();

final class GetTransfersUseCaseProvider
    extends
        $FunctionalProvider<
          GetTransfersUseCase,
          GetTransfersUseCase,
          GetTransfersUseCase
        >
    with $Provider<GetTransfersUseCase> {
  const GetTransfersUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getTransfersUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getTransfersUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetTransfersUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetTransfersUseCase create(Ref ref) {
    return getTransfersUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetTransfersUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetTransfersUseCase>(value),
    );
  }
}

String _$getTransfersUseCaseHash() =>
    r'46e93bafba79ca5c09ae7c158d42f644f277571b';

@ProviderFor(getTransferDetailUseCase)
const getTransferDetailUseCaseProvider = GetTransferDetailUseCaseProvider._();

final class GetTransferDetailUseCaseProvider
    extends
        $FunctionalProvider<
          GetTransferDetailUseCase,
          GetTransferDetailUseCase,
          GetTransferDetailUseCase
        >
    with $Provider<GetTransferDetailUseCase> {
  const GetTransferDetailUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getTransferDetailUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getTransferDetailUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetTransferDetailUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetTransferDetailUseCase create(Ref ref) {
    return getTransferDetailUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetTransferDetailUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetTransferDetailUseCase>(value),
    );
  }
}

String _$getTransferDetailUseCaseHash() =>
    r'79836a5a1432c77f9753a8b50302984bcca7aa3f';

@ProviderFor(updateTransferStatusUseCase)
const updateTransferStatusUseCaseProvider =
    UpdateTransferStatusUseCaseProvider._();

final class UpdateTransferStatusUseCaseProvider
    extends
        $FunctionalProvider<
          UpdateTransferStatusUseCase,
          UpdateTransferStatusUseCase,
          UpdateTransferStatusUseCase
        >
    with $Provider<UpdateTransferStatusUseCase> {
  const UpdateTransferStatusUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateTransferStatusUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateTransferStatusUseCaseHash();

  @$internal
  @override
  $ProviderElement<UpdateTransferStatusUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UpdateTransferStatusUseCase create(Ref ref) {
    return updateTransferStatusUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateTransferStatusUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateTransferStatusUseCase>(value),
    );
  }
}

String _$updateTransferStatusUseCaseHash() =>
    r'f9bb7261dbe31f62c119455604a92d3ec4a377a9';
