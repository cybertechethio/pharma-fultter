// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(subCategoryApiService)
const subCategoryApiServiceProvider = SubCategoryApiServiceProvider._();

final class SubCategoryApiServiceProvider
    extends
        $FunctionalProvider<
          SubCategoryApiService,
          SubCategoryApiService,
          SubCategoryApiService
        >
    with $Provider<SubCategoryApiService> {
  const SubCategoryApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subCategoryApiServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$subCategoryApiServiceHash();

  @$internal
  @override
  $ProviderElement<SubCategoryApiService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SubCategoryApiService create(Ref ref) {
    return subCategoryApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SubCategoryApiService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SubCategoryApiService>(value),
    );
  }
}

String _$subCategoryApiServiceHash() =>
    r'97591fed5a4af5f706aa19ab73a4d68adff227a4';

@ProviderFor(subCategoryRemoteDataSource)
const subCategoryRemoteDataSourceProvider =
    SubCategoryRemoteDataSourceProvider._();

final class SubCategoryRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          SubCategoryRemoteDataSource,
          SubCategoryRemoteDataSource,
          SubCategoryRemoteDataSource
        >
    with $Provider<SubCategoryRemoteDataSource> {
  const SubCategoryRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subCategoryRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$subCategoryRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<SubCategoryRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SubCategoryRemoteDataSource create(Ref ref) {
    return subCategoryRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SubCategoryRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SubCategoryRemoteDataSource>(value),
    );
  }
}

String _$subCategoryRemoteDataSourceHash() =>
    r'4fdcd685fe7964146ed413f76ee6c2d3106d9921';

@ProviderFor(subCategoryRepository)
const subCategoryRepositoryProvider = SubCategoryRepositoryProvider._();

final class SubCategoryRepositoryProvider
    extends
        $FunctionalProvider<
          SubCategoryRepository,
          SubCategoryRepository,
          SubCategoryRepository
        >
    with $Provider<SubCategoryRepository> {
  const SubCategoryRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subCategoryRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$subCategoryRepositoryHash();

  @$internal
  @override
  $ProviderElement<SubCategoryRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SubCategoryRepository create(Ref ref) {
    return subCategoryRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SubCategoryRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SubCategoryRepository>(value),
    );
  }
}

String _$subCategoryRepositoryHash() =>
    r'854e6ef500d2c663421fdfb4f134e27901e3939f';

@ProviderFor(getSubCategoriesUseCase)
const getSubCategoriesUseCaseProvider = GetSubCategoriesUseCaseProvider._();

final class GetSubCategoriesUseCaseProvider
    extends
        $FunctionalProvider<
          GetSubCategoriesUseCase,
          GetSubCategoriesUseCase,
          GetSubCategoriesUseCase
        >
    with $Provider<GetSubCategoriesUseCase> {
  const GetSubCategoriesUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getSubCategoriesUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getSubCategoriesUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetSubCategoriesUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetSubCategoriesUseCase create(Ref ref) {
    return getSubCategoriesUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetSubCategoriesUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetSubCategoriesUseCase>(value),
    );
  }
}

String _$getSubCategoriesUseCaseHash() =>
    r'ae380e4fade1e5ce8932a3e7c4772463e2ad11df';

@ProviderFor(getSubCategoriesByCategoryUseCase)
const getSubCategoriesByCategoryUseCaseProvider =
    GetSubCategoriesByCategoryUseCaseProvider._();

final class GetSubCategoriesByCategoryUseCaseProvider
    extends
        $FunctionalProvider<
          GetSubCategoriesByCategoryUseCase,
          GetSubCategoriesByCategoryUseCase,
          GetSubCategoriesByCategoryUseCase
        >
    with $Provider<GetSubCategoriesByCategoryUseCase> {
  const GetSubCategoriesByCategoryUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getSubCategoriesByCategoryUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$getSubCategoriesByCategoryUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetSubCategoriesByCategoryUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetSubCategoriesByCategoryUseCase create(Ref ref) {
    return getSubCategoriesByCategoryUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetSubCategoriesByCategoryUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetSubCategoriesByCategoryUseCase>(
        value,
      ),
    );
  }
}

String _$getSubCategoriesByCategoryUseCaseHash() =>
    r'7b546e8b1889fbdc7b71a871287468719d90901c';

@ProviderFor(createSubCategoryUseCase)
const createSubCategoryUseCaseProvider = CreateSubCategoryUseCaseProvider._();

final class CreateSubCategoryUseCaseProvider
    extends
        $FunctionalProvider<
          CreateSubCategoryUseCase,
          CreateSubCategoryUseCase,
          CreateSubCategoryUseCase
        >
    with $Provider<CreateSubCategoryUseCase> {
  const CreateSubCategoryUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createSubCategoryUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createSubCategoryUseCaseHash();

  @$internal
  @override
  $ProviderElement<CreateSubCategoryUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CreateSubCategoryUseCase create(Ref ref) {
    return createSubCategoryUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateSubCategoryUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateSubCategoryUseCase>(value),
    );
  }
}

String _$createSubCategoryUseCaseHash() =>
    r'904cdc5384e37aec649b3e571fdbda851985fd2b';

@ProviderFor(updateSubCategoryUseCase)
const updateSubCategoryUseCaseProvider = UpdateSubCategoryUseCaseProvider._();

final class UpdateSubCategoryUseCaseProvider
    extends
        $FunctionalProvider<
          UpdateSubCategoryUseCase,
          UpdateSubCategoryUseCase,
          UpdateSubCategoryUseCase
        >
    with $Provider<UpdateSubCategoryUseCase> {
  const UpdateSubCategoryUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateSubCategoryUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateSubCategoryUseCaseHash();

  @$internal
  @override
  $ProviderElement<UpdateSubCategoryUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UpdateSubCategoryUseCase create(Ref ref) {
    return updateSubCategoryUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateSubCategoryUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateSubCategoryUseCase>(value),
    );
  }
}

String _$updateSubCategoryUseCaseHash() =>
    r'69a7948725e8027317d6bfe0ca0e6801e682a404';

@ProviderFor(deleteSubCategoryUseCase)
const deleteSubCategoryUseCaseProvider = DeleteSubCategoryUseCaseProvider._();

final class DeleteSubCategoryUseCaseProvider
    extends
        $FunctionalProvider<
          DeleteSubCategoryUseCase,
          DeleteSubCategoryUseCase,
          DeleteSubCategoryUseCase
        >
    with $Provider<DeleteSubCategoryUseCase> {
  const DeleteSubCategoryUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteSubCategoryUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteSubCategoryUseCaseHash();

  @$internal
  @override
  $ProviderElement<DeleteSubCategoryUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeleteSubCategoryUseCase create(Ref ref) {
    return deleteSubCategoryUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteSubCategoryUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteSubCategoryUseCase>(value),
    );
  }
}

String _$deleteSubCategoryUseCaseHash() =>
    r'f05d0ce93ce28d028ed4b3d5a61120d5014622c4';
