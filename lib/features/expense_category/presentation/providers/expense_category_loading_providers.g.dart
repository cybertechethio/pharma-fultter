// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_category_loading_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ExpenseCategoryCreateLoading)
const expenseCategoryCreateLoadingProvider =
    ExpenseCategoryCreateLoadingProvider._();

final class ExpenseCategoryCreateLoadingProvider
    extends $NotifierProvider<ExpenseCategoryCreateLoading, bool> {
  const ExpenseCategoryCreateLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'expenseCategoryCreateLoadingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$expenseCategoryCreateLoadingHash();

  @$internal
  @override
  ExpenseCategoryCreateLoading create() => ExpenseCategoryCreateLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$expenseCategoryCreateLoadingHash() =>
    r'81c3cffdf6f3db9c91621bb205fc7facef1a42ed';

abstract class _$ExpenseCategoryCreateLoading extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(ExpenseCategoryUpdateLoading)
const expenseCategoryUpdateLoadingProvider =
    ExpenseCategoryUpdateLoadingProvider._();

final class ExpenseCategoryUpdateLoadingProvider
    extends $NotifierProvider<ExpenseCategoryUpdateLoading, Set<String>> {
  const ExpenseCategoryUpdateLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'expenseCategoryUpdateLoadingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$expenseCategoryUpdateLoadingHash();

  @$internal
  @override
  ExpenseCategoryUpdateLoading create() => ExpenseCategoryUpdateLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$expenseCategoryUpdateLoadingHash() =>
    r'f24535ce8c41eb4112e5e2e3312c342e32bc05fc';

abstract class _$ExpenseCategoryUpdateLoading extends $Notifier<Set<String>> {
  Set<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Set<String>, Set<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<String>, Set<String>>,
              Set<String>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(ExpenseCategoryDeleteLoading)
const expenseCategoryDeleteLoadingProvider =
    ExpenseCategoryDeleteLoadingProvider._();

final class ExpenseCategoryDeleteLoadingProvider
    extends $NotifierProvider<ExpenseCategoryDeleteLoading, Set<String>> {
  const ExpenseCategoryDeleteLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'expenseCategoryDeleteLoadingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$expenseCategoryDeleteLoadingHash();

  @$internal
  @override
  ExpenseCategoryDeleteLoading create() => ExpenseCategoryDeleteLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$expenseCategoryDeleteLoadingHash() =>
    r'4206a63704546136003280693c4a3c44783727de';

abstract class _$ExpenseCategoryDeleteLoading extends $Notifier<Set<String>> {
  Set<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Set<String>, Set<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<String>, Set<String>>,
              Set<String>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
