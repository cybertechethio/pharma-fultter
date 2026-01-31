// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(expenseApiService)
const expenseApiServiceProvider = ExpenseApiServiceProvider._();

final class ExpenseApiServiceProvider
    extends
        $FunctionalProvider<
          ExpenseApiService,
          ExpenseApiService,
          ExpenseApiService
        >
    with $Provider<ExpenseApiService> {
  const ExpenseApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'expenseApiServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$expenseApiServiceHash();

  @$internal
  @override
  $ProviderElement<ExpenseApiService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ExpenseApiService create(Ref ref) {
    return expenseApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ExpenseApiService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ExpenseApiService>(value),
    );
  }
}

String _$expenseApiServiceHash() => r'1780daaa5ba2042ef3fcef5adb97a36be0664680';

@ProviderFor(expenseRemoteDataSource)
const expenseRemoteDataSourceProvider = ExpenseRemoteDataSourceProvider._();

final class ExpenseRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          ExpenseRemoteDataSource,
          ExpenseRemoteDataSource,
          ExpenseRemoteDataSource
        >
    with $Provider<ExpenseRemoteDataSource> {
  const ExpenseRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'expenseRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$expenseRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<ExpenseRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ExpenseRemoteDataSource create(Ref ref) {
    return expenseRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ExpenseRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ExpenseRemoteDataSource>(value),
    );
  }
}

String _$expenseRemoteDataSourceHash() =>
    r'7c08d656a2d91fe438a1381d1574ef9398715db5';

@ProviderFor(expenseRepository)
const expenseRepositoryProvider = ExpenseRepositoryProvider._();

final class ExpenseRepositoryProvider
    extends
        $FunctionalProvider<
          ExpenseRepository,
          ExpenseRepository,
          ExpenseRepository
        >
    with $Provider<ExpenseRepository> {
  const ExpenseRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'expenseRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$expenseRepositoryHash();

  @$internal
  @override
  $ProviderElement<ExpenseRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ExpenseRepository create(Ref ref) {
    return expenseRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ExpenseRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ExpenseRepository>(value),
    );
  }
}

String _$expenseRepositoryHash() => r'37fba5e35fc50bb56440c6f46b373183ad32f486';

@ProviderFor(createExpenseUseCase)
const createExpenseUseCaseProvider = CreateExpenseUseCaseProvider._();

final class CreateExpenseUseCaseProvider
    extends
        $FunctionalProvider<
          CreateExpenseUseCase,
          CreateExpenseUseCase,
          CreateExpenseUseCase
        >
    with $Provider<CreateExpenseUseCase> {
  const CreateExpenseUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createExpenseUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createExpenseUseCaseHash();

  @$internal
  @override
  $ProviderElement<CreateExpenseUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CreateExpenseUseCase create(Ref ref) {
    return createExpenseUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateExpenseUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateExpenseUseCase>(value),
    );
  }
}

String _$createExpenseUseCaseHash() =>
    r'4223d15e0d0c50d4e217f578a8a28a73dcbd986b';

@ProviderFor(getExpensesUseCase)
const getExpensesUseCaseProvider = GetExpensesUseCaseProvider._();

final class GetExpensesUseCaseProvider
    extends
        $FunctionalProvider<
          GetExpensesUseCase,
          GetExpensesUseCase,
          GetExpensesUseCase
        >
    with $Provider<GetExpensesUseCase> {
  const GetExpensesUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getExpensesUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getExpensesUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetExpensesUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetExpensesUseCase create(Ref ref) {
    return getExpensesUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetExpensesUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetExpensesUseCase>(value),
    );
  }
}

String _$getExpensesUseCaseHash() =>
    r'a2430ac8becb1ff82143713bf8564ebd46fec558';

@ProviderFor(getExpenseByIdUseCase)
const getExpenseByIdUseCaseProvider = GetExpenseByIdUseCaseProvider._();

final class GetExpenseByIdUseCaseProvider
    extends
        $FunctionalProvider<
          GetExpenseByIdUseCase,
          GetExpenseByIdUseCase,
          GetExpenseByIdUseCase
        >
    with $Provider<GetExpenseByIdUseCase> {
  const GetExpenseByIdUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getExpenseByIdUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getExpenseByIdUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetExpenseByIdUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetExpenseByIdUseCase create(Ref ref) {
    return getExpenseByIdUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetExpenseByIdUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetExpenseByIdUseCase>(value),
    );
  }
}

String _$getExpenseByIdUseCaseHash() =>
    r'79d70c6a8b6f7e3c2c1b1690c18124d70ad83ce8';

@ProviderFor(updateExpenseUseCase)
const updateExpenseUseCaseProvider = UpdateExpenseUseCaseProvider._();

final class UpdateExpenseUseCaseProvider
    extends
        $FunctionalProvider<
          UpdateExpenseUseCase,
          UpdateExpenseUseCase,
          UpdateExpenseUseCase
        >
    with $Provider<UpdateExpenseUseCase> {
  const UpdateExpenseUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateExpenseUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateExpenseUseCaseHash();

  @$internal
  @override
  $ProviderElement<UpdateExpenseUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UpdateExpenseUseCase create(Ref ref) {
    return updateExpenseUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateExpenseUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateExpenseUseCase>(value),
    );
  }
}

String _$updateExpenseUseCaseHash() =>
    r'd48252713b7e458b3d18fccfbbfd8278bb368a20';

@ProviderFor(deleteExpenseUseCase)
const deleteExpenseUseCaseProvider = DeleteExpenseUseCaseProvider._();

final class DeleteExpenseUseCaseProvider
    extends
        $FunctionalProvider<
          DeleteExpenseUseCase,
          DeleteExpenseUseCase,
          DeleteExpenseUseCase
        >
    with $Provider<DeleteExpenseUseCase> {
  const DeleteExpenseUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteExpenseUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteExpenseUseCaseHash();

  @$internal
  @override
  $ProviderElement<DeleteExpenseUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeleteExpenseUseCase create(Ref ref) {
    return deleteExpenseUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteExpenseUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteExpenseUseCase>(value),
    );
  }
}

String _$deleteExpenseUseCaseHash() =>
    r'f0c55c7a4c505672fc59dae239e25a6d1bb7b65f';

@ProviderFor(createExpensePaymentMethodUseCase)
const createExpensePaymentMethodUseCaseProvider =
    CreateExpensePaymentMethodUseCaseProvider._();

final class CreateExpensePaymentMethodUseCaseProvider
    extends
        $FunctionalProvider<
          CreateExpensePaymentMethodUseCase,
          CreateExpensePaymentMethodUseCase,
          CreateExpensePaymentMethodUseCase
        >
    with $Provider<CreateExpensePaymentMethodUseCase> {
  const CreateExpensePaymentMethodUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createExpensePaymentMethodUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$createExpensePaymentMethodUseCaseHash();

  @$internal
  @override
  $ProviderElement<CreateExpensePaymentMethodUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CreateExpensePaymentMethodUseCase create(Ref ref) {
    return createExpensePaymentMethodUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateExpensePaymentMethodUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateExpensePaymentMethodUseCase>(
        value,
      ),
    );
  }
}

String _$createExpensePaymentMethodUseCaseHash() =>
    r'de365dfbb07234454c82d9dcbbe42922c83545d2';

@ProviderFor(updateExpensePaymentMethodUseCase)
const updateExpensePaymentMethodUseCaseProvider =
    UpdateExpensePaymentMethodUseCaseProvider._();

final class UpdateExpensePaymentMethodUseCaseProvider
    extends
        $FunctionalProvider<
          UpdateExpensePaymentMethodUseCase,
          UpdateExpensePaymentMethodUseCase,
          UpdateExpensePaymentMethodUseCase
        >
    with $Provider<UpdateExpensePaymentMethodUseCase> {
  const UpdateExpensePaymentMethodUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateExpensePaymentMethodUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$updateExpensePaymentMethodUseCaseHash();

  @$internal
  @override
  $ProviderElement<UpdateExpensePaymentMethodUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UpdateExpensePaymentMethodUseCase create(Ref ref) {
    return updateExpensePaymentMethodUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateExpensePaymentMethodUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateExpensePaymentMethodUseCase>(
        value,
      ),
    );
  }
}

String _$updateExpensePaymentMethodUseCaseHash() =>
    r'7464089c8492b7d6851606b91129b54cf285812c';

@ProviderFor(deleteExpensePaymentMethodUseCase)
const deleteExpensePaymentMethodUseCaseProvider =
    DeleteExpensePaymentMethodUseCaseProvider._();

final class DeleteExpensePaymentMethodUseCaseProvider
    extends
        $FunctionalProvider<
          DeleteExpensePaymentMethodUseCase,
          DeleteExpensePaymentMethodUseCase,
          DeleteExpensePaymentMethodUseCase
        >
    with $Provider<DeleteExpensePaymentMethodUseCase> {
  const DeleteExpensePaymentMethodUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteExpensePaymentMethodUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$deleteExpensePaymentMethodUseCaseHash();

  @$internal
  @override
  $ProviderElement<DeleteExpensePaymentMethodUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeleteExpensePaymentMethodUseCase create(Ref ref) {
    return deleteExpensePaymentMethodUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteExpensePaymentMethodUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteExpensePaymentMethodUseCase>(
        value,
      ),
    );
  }
}

String _$deleteExpensePaymentMethodUseCaseHash() =>
    r'233c948737abfea943dad9ec7660246032fcc7e1';
