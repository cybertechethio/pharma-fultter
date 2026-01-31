// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(categoryApiService)
const categoryApiServiceProvider = CategoryApiServiceProvider._();

final class CategoryApiServiceProvider
    extends
        $FunctionalProvider<
          CategoryApiService,
          CategoryApiService,
          CategoryApiService
        >
    with $Provider<CategoryApiService> {
  const CategoryApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoryApiServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoryApiServiceHash();

  @$internal
  @override
  $ProviderElement<CategoryApiService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CategoryApiService create(Ref ref) {
    return categoryApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CategoryApiService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CategoryApiService>(value),
    );
  }
}

String _$categoryApiServiceHash() =>
    r'8581ee749a4f976db3c0051973af80b0e1ac1532';

@ProviderFor(categoryRemoteDataSource)
const categoryRemoteDataSourceProvider = CategoryRemoteDataSourceProvider._();

final class CategoryRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          CategoryRemoteDataSource,
          CategoryRemoteDataSource,
          CategoryRemoteDataSource
        >
    with $Provider<CategoryRemoteDataSource> {
  const CategoryRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoryRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoryRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<CategoryRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CategoryRemoteDataSource create(Ref ref) {
    return categoryRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CategoryRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CategoryRemoteDataSource>(value),
    );
  }
}

String _$categoryRemoteDataSourceHash() =>
    r'd9f41cb5f8dfa00834d6330b3f71f6b87df2af4e';

@ProviderFor(categoryRepository)
const categoryRepositoryProvider = CategoryRepositoryProvider._();

final class CategoryRepositoryProvider
    extends
        $FunctionalProvider<
          CategoryRepository,
          CategoryRepository,
          CategoryRepository
        >
    with $Provider<CategoryRepository> {
  const CategoryRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoryRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoryRepositoryHash();

  @$internal
  @override
  $ProviderElement<CategoryRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CategoryRepository create(Ref ref) {
    return categoryRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CategoryRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CategoryRepository>(value),
    );
  }
}

String _$categoryRepositoryHash() =>
    r'865ef0071abdaac0ba14edbfe06ee3c6853cbe37';

@ProviderFor(getCategoriesUseCase)
const getCategoriesUseCaseProvider = GetCategoriesUseCaseProvider._();

final class GetCategoriesUseCaseProvider
    extends
        $FunctionalProvider<
          GetCategoriesUseCase,
          GetCategoriesUseCase,
          GetCategoriesUseCase
        >
    with $Provider<GetCategoriesUseCase> {
  const GetCategoriesUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCategoriesUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCategoriesUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetCategoriesUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetCategoriesUseCase create(Ref ref) {
    return getCategoriesUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetCategoriesUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetCategoriesUseCase>(value),
    );
  }
}

String _$getCategoriesUseCaseHash() =>
    r'cd1d7e6785c639fc609149e3ec9ca7b81eafa163';

@ProviderFor(createCategoryUseCase)
const createCategoryUseCaseProvider = CreateCategoryUseCaseProvider._();

final class CreateCategoryUseCaseProvider
    extends
        $FunctionalProvider<
          CreateCategoryUseCase,
          CreateCategoryUseCase,
          CreateCategoryUseCase
        >
    with $Provider<CreateCategoryUseCase> {
  const CreateCategoryUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createCategoryUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createCategoryUseCaseHash();

  @$internal
  @override
  $ProviderElement<CreateCategoryUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CreateCategoryUseCase create(Ref ref) {
    return createCategoryUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateCategoryUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateCategoryUseCase>(value),
    );
  }
}

String _$createCategoryUseCaseHash() =>
    r'f644196aa63fbabc6b63aa4ac72304a574c50bf0';

@ProviderFor(updateCategoryUseCase)
const updateCategoryUseCaseProvider = UpdateCategoryUseCaseProvider._();

final class UpdateCategoryUseCaseProvider
    extends
        $FunctionalProvider<
          UpdateCategoryUseCase,
          UpdateCategoryUseCase,
          UpdateCategoryUseCase
        >
    with $Provider<UpdateCategoryUseCase> {
  const UpdateCategoryUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateCategoryUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateCategoryUseCaseHash();

  @$internal
  @override
  $ProviderElement<UpdateCategoryUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UpdateCategoryUseCase create(Ref ref) {
    return updateCategoryUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateCategoryUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateCategoryUseCase>(value),
    );
  }
}

String _$updateCategoryUseCaseHash() =>
    r'fc8a08c8491180404a72c5ba99aadc412ef01ccb';

@ProviderFor(deleteCategoryUseCase)
const deleteCategoryUseCaseProvider = DeleteCategoryUseCaseProvider._();

final class DeleteCategoryUseCaseProvider
    extends
        $FunctionalProvider<
          DeleteCategoryUseCase,
          DeleteCategoryUseCase,
          DeleteCategoryUseCase
        >
    with $Provider<DeleteCategoryUseCase> {
  const DeleteCategoryUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteCategoryUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteCategoryUseCaseHash();

  @$internal
  @override
  $ProviderElement<DeleteCategoryUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeleteCategoryUseCase create(Ref ref) {
    return deleteCategoryUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteCategoryUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteCategoryUseCase>(value),
    );
  }
}

String _$deleteCategoryUseCaseHash() =>
    r'cf9a49780121eb983933f87ed814f7de21d73e17';
