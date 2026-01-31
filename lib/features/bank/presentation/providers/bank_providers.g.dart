// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(bankApiService)
const bankApiServiceProvider = BankApiServiceProvider._();

final class BankApiServiceProvider
    extends $FunctionalProvider<BankApiService, BankApiService, BankApiService>
    with $Provider<BankApiService> {
  const BankApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bankApiServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bankApiServiceHash();

  @$internal
  @override
  $ProviderElement<BankApiService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BankApiService create(Ref ref) {
    return bankApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BankApiService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BankApiService>(value),
    );
  }
}

String _$bankApiServiceHash() => r'54d2c0feb41c5225d29f46cd430af1cb0106f75e';

@ProviderFor(bankRemoteDataSource)
const bankRemoteDataSourceProvider = BankRemoteDataSourceProvider._();

final class BankRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          BankRemoteDataSource,
          BankRemoteDataSource,
          BankRemoteDataSource
        >
    with $Provider<BankRemoteDataSource> {
  const BankRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bankRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bankRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<BankRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BankRemoteDataSource create(Ref ref) {
    return bankRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BankRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BankRemoteDataSource>(value),
    );
  }
}

String _$bankRemoteDataSourceHash() =>
    r'b38c37b0909c03432f7e5ca8ff5cfd5f4296dac6';

@ProviderFor(bankRepository)
const bankRepositoryProvider = BankRepositoryProvider._();

final class BankRepositoryProvider
    extends $FunctionalProvider<BankRepository, BankRepository, BankRepository>
    with $Provider<BankRepository> {
  const BankRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bankRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bankRepositoryHash();

  @$internal
  @override
  $ProviderElement<BankRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BankRepository create(Ref ref) {
    return bankRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BankRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BankRepository>(value),
    );
  }
}

String _$bankRepositoryHash() => r'd1c7ff17cdb820429142c8905a322fe974c08ca3';

@ProviderFor(getBanksUseCase)
const getBanksUseCaseProvider = GetBanksUseCaseProvider._();

final class GetBanksUseCaseProvider
    extends
        $FunctionalProvider<GetBanksUseCase, GetBanksUseCase, GetBanksUseCase>
    with $Provider<GetBanksUseCase> {
  const GetBanksUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getBanksUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getBanksUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetBanksUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetBanksUseCase create(Ref ref) {
    return getBanksUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetBanksUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetBanksUseCase>(value),
    );
  }
}

String _$getBanksUseCaseHash() => r'7914ca7be462d76b28b35ab5688d7e29bb47f342';

@ProviderFor(createBankUseCase)
const createBankUseCaseProvider = CreateBankUseCaseProvider._();

final class CreateBankUseCaseProvider
    extends
        $FunctionalProvider<
          CreateBankUseCase,
          CreateBankUseCase,
          CreateBankUseCase
        >
    with $Provider<CreateBankUseCase> {
  const CreateBankUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createBankUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createBankUseCaseHash();

  @$internal
  @override
  $ProviderElement<CreateBankUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CreateBankUseCase create(Ref ref) {
    return createBankUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateBankUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateBankUseCase>(value),
    );
  }
}

String _$createBankUseCaseHash() => r'87035cbe45eeb9306bfe575abf35bbb7e3c4cafe';

@ProviderFor(updateBankUseCase)
const updateBankUseCaseProvider = UpdateBankUseCaseProvider._();

final class UpdateBankUseCaseProvider
    extends
        $FunctionalProvider<
          UpdateBankUseCase,
          UpdateBankUseCase,
          UpdateBankUseCase
        >
    with $Provider<UpdateBankUseCase> {
  const UpdateBankUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateBankUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateBankUseCaseHash();

  @$internal
  @override
  $ProviderElement<UpdateBankUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UpdateBankUseCase create(Ref ref) {
    return updateBankUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateBankUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateBankUseCase>(value),
    );
  }
}

String _$updateBankUseCaseHash() => r'9a8658a8ea88d0ad11c58c71982af79f17d8c215';

@ProviderFor(deleteBankUseCase)
const deleteBankUseCaseProvider = DeleteBankUseCaseProvider._();

final class DeleteBankUseCaseProvider
    extends
        $FunctionalProvider<
          DeleteBankUseCase,
          DeleteBankUseCase,
          DeleteBankUseCase
        >
    with $Provider<DeleteBankUseCase> {
  const DeleteBankUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteBankUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteBankUseCaseHash();

  @$internal
  @override
  $ProviderElement<DeleteBankUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeleteBankUseCase create(Ref ref) {
    return deleteBankUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteBankUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteBankUseCase>(value),
    );
  }
}

String _$deleteBankUseCaseHash() => r'05e47d78e1d694d9f64e32eaab6660ed5c1baddf';
