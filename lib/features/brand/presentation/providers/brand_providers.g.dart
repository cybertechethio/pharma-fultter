// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(brandApiService)
const brandApiServiceProvider = BrandApiServiceProvider._();

final class BrandApiServiceProvider
    extends
        $FunctionalProvider<BrandApiService, BrandApiService, BrandApiService>
    with $Provider<BrandApiService> {
  const BrandApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'brandApiServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$brandApiServiceHash();

  @$internal
  @override
  $ProviderElement<BrandApiService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BrandApiService create(Ref ref) {
    return brandApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BrandApiService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BrandApiService>(value),
    );
  }
}

String _$brandApiServiceHash() => r'b27de151b7b6ca131fb4d1a99b08bddb7640d502';

@ProviderFor(brandRemoteDataSource)
const brandRemoteDataSourceProvider = BrandRemoteDataSourceProvider._();

final class BrandRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          BrandRemoteDataSource,
          BrandRemoteDataSource,
          BrandRemoteDataSource
        >
    with $Provider<BrandRemoteDataSource> {
  const BrandRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'brandRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$brandRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<BrandRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BrandRemoteDataSource create(Ref ref) {
    return brandRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BrandRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BrandRemoteDataSource>(value),
    );
  }
}

String _$brandRemoteDataSourceHash() =>
    r'0fa42c36111c087935b69627628ab6139101f5af';

@ProviderFor(brandRepository)
const brandRepositoryProvider = BrandRepositoryProvider._();

final class BrandRepositoryProvider
    extends
        $FunctionalProvider<BrandRepository, BrandRepository, BrandRepository>
    with $Provider<BrandRepository> {
  const BrandRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'brandRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$brandRepositoryHash();

  @$internal
  @override
  $ProviderElement<BrandRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BrandRepository create(Ref ref) {
    return brandRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BrandRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BrandRepository>(value),
    );
  }
}

String _$brandRepositoryHash() => r'a0c7006a213f4e6860f388314db0fef0a0f7e65a';

@ProviderFor(getBrandsUseCase)
const getBrandsUseCaseProvider = GetBrandsUseCaseProvider._();

final class GetBrandsUseCaseProvider
    extends
        $FunctionalProvider<
          GetBrandsUseCase,
          GetBrandsUseCase,
          GetBrandsUseCase
        >
    with $Provider<GetBrandsUseCase> {
  const GetBrandsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getBrandsUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getBrandsUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetBrandsUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetBrandsUseCase create(Ref ref) {
    return getBrandsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetBrandsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetBrandsUseCase>(value),
    );
  }
}

String _$getBrandsUseCaseHash() => r'e83e48da72e16da2731b8a8b4b26c0c94abfe8ed';

@ProviderFor(createBrandUseCase)
const createBrandUseCaseProvider = CreateBrandUseCaseProvider._();

final class CreateBrandUseCaseProvider
    extends
        $FunctionalProvider<
          CreateBrandUseCase,
          CreateBrandUseCase,
          CreateBrandUseCase
        >
    with $Provider<CreateBrandUseCase> {
  const CreateBrandUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createBrandUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createBrandUseCaseHash();

  @$internal
  @override
  $ProviderElement<CreateBrandUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CreateBrandUseCase create(Ref ref) {
    return createBrandUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateBrandUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateBrandUseCase>(value),
    );
  }
}

String _$createBrandUseCaseHash() =>
    r'6b3cfc1f33e6aebdbaee465dffc1f32c03ccfd40';

@ProviderFor(updateBrandUseCase)
const updateBrandUseCaseProvider = UpdateBrandUseCaseProvider._();

final class UpdateBrandUseCaseProvider
    extends
        $FunctionalProvider<
          UpdateBrandUseCase,
          UpdateBrandUseCase,
          UpdateBrandUseCase
        >
    with $Provider<UpdateBrandUseCase> {
  const UpdateBrandUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateBrandUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateBrandUseCaseHash();

  @$internal
  @override
  $ProviderElement<UpdateBrandUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UpdateBrandUseCase create(Ref ref) {
    return updateBrandUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateBrandUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateBrandUseCase>(value),
    );
  }
}

String _$updateBrandUseCaseHash() =>
    r'a383b35ff8f5459cca95c73557f9d9bcca7781db';

@ProviderFor(deleteBrandUseCase)
const deleteBrandUseCaseProvider = DeleteBrandUseCaseProvider._();

final class DeleteBrandUseCaseProvider
    extends
        $FunctionalProvider<
          DeleteBrandUseCase,
          DeleteBrandUseCase,
          DeleteBrandUseCase
        >
    with $Provider<DeleteBrandUseCase> {
  const DeleteBrandUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteBrandUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteBrandUseCaseHash();

  @$internal
  @override
  $ProviderElement<DeleteBrandUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeleteBrandUseCase create(Ref ref) {
    return deleteBrandUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteBrandUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteBrandUseCase>(value),
    );
  }
}

String _$deleteBrandUseCaseHash() =>
    r'1f3e353e27ddaab0e174862be3165ad4b647b206';
