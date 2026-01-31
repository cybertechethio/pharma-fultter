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
    r'e4757bd307ab1c9790a54373d2b139e0dc278364';

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
    r'ed8b37167d7cbc931d10ae8da3a573528836c853';

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
    r'27cdede29fffbae556d44cc8a83cfb37bc6bd2af';

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
    r'ffc5a7d1b3b21afd54b31737375be0b9f6a20e62';

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
    r'77cf86798f6675efafeec6de673cb9c907052df4';
