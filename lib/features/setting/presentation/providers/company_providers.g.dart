// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(companyApiService)
const companyApiServiceProvider = CompanyApiServiceProvider._();

final class CompanyApiServiceProvider
    extends
        $FunctionalProvider<
          CompanyApiService,
          CompanyApiService,
          CompanyApiService
        >
    with $Provider<CompanyApiService> {
  const CompanyApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'companyApiServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$companyApiServiceHash();

  @$internal
  @override
  $ProviderElement<CompanyApiService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CompanyApiService create(Ref ref) {
    return companyApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CompanyApiService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CompanyApiService>(value),
    );
  }
}

String _$companyApiServiceHash() => r'0fcd25fdb295a784f9063a672f64a4ec3ee51eaa';

@ProviderFor(companyRemoteDataSource)
const companyRemoteDataSourceProvider = CompanyRemoteDataSourceProvider._();

final class CompanyRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          CompanyRemoteDataSource,
          CompanyRemoteDataSource,
          CompanyRemoteDataSource
        >
    with $Provider<CompanyRemoteDataSource> {
  const CompanyRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'companyRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$companyRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<CompanyRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CompanyRemoteDataSource create(Ref ref) {
    return companyRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CompanyRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CompanyRemoteDataSource>(value),
    );
  }
}

String _$companyRemoteDataSourceHash() =>
    r'a3ddecf4a80d6f14092298b16e0b952437870416';

@ProviderFor(companyRepository)
const companyRepositoryProvider = CompanyRepositoryProvider._();

final class CompanyRepositoryProvider
    extends
        $FunctionalProvider<
          CompanyRepository,
          CompanyRepository,
          CompanyRepository
        >
    with $Provider<CompanyRepository> {
  const CompanyRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'companyRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$companyRepositoryHash();

  @$internal
  @override
  $ProviderElement<CompanyRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CompanyRepository create(Ref ref) {
    return companyRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CompanyRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CompanyRepository>(value),
    );
  }
}

String _$companyRepositoryHash() => r'e39232820bd8a8dd0a2a467c5fdc4503cd366903';

@ProviderFor(getCompanyUseCase)
const getCompanyUseCaseProvider = GetCompanyUseCaseProvider._();

final class GetCompanyUseCaseProvider
    extends
        $FunctionalProvider<
          GetCompanyUseCase,
          GetCompanyUseCase,
          GetCompanyUseCase
        >
    with $Provider<GetCompanyUseCase> {
  const GetCompanyUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCompanyUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCompanyUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetCompanyUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetCompanyUseCase create(Ref ref) {
    return getCompanyUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetCompanyUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetCompanyUseCase>(value),
    );
  }
}

String _$getCompanyUseCaseHash() => r'c33d6dfde630ce92d7a99ed4091549f58b038ecd';

@ProviderFor(updateCompanyUseCase)
const updateCompanyUseCaseProvider = UpdateCompanyUseCaseProvider._();

final class UpdateCompanyUseCaseProvider
    extends
        $FunctionalProvider<
          UpdateCompanyUseCase,
          UpdateCompanyUseCase,
          UpdateCompanyUseCase
        >
    with $Provider<UpdateCompanyUseCase> {
  const UpdateCompanyUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateCompanyUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateCompanyUseCaseHash();

  @$internal
  @override
  $ProviderElement<UpdateCompanyUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UpdateCompanyUseCase create(Ref ref) {
    return updateCompanyUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateCompanyUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateCompanyUseCase>(value),
    );
  }
}

String _$updateCompanyUseCaseHash() =>
    r'24ee507fc6108f13fcc3ead3d99daf00b432075f';
