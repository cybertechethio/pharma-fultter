// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_loading_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CategoryCreateLoading)
const categoryCreateLoadingProvider = CategoryCreateLoadingProvider._();

final class CategoryCreateLoadingProvider
    extends $NotifierProvider<CategoryCreateLoading, bool> {
  const CategoryCreateLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoryCreateLoadingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoryCreateLoadingHash();

  @$internal
  @override
  CategoryCreateLoading create() => CategoryCreateLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$categoryCreateLoadingHash() =>
    r'c4d7b7a8b3c856ac0923f388711af87b7f14fdff';

abstract class _$CategoryCreateLoading extends $Notifier<bool> {
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

@ProviderFor(CategoryUpdateLoading)
const categoryUpdateLoadingProvider = CategoryUpdateLoadingProvider._();

final class CategoryUpdateLoadingProvider
    extends $NotifierProvider<CategoryUpdateLoading, Set<String>> {
  const CategoryUpdateLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoryUpdateLoadingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoryUpdateLoadingHash();

  @$internal
  @override
  CategoryUpdateLoading create() => CategoryUpdateLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$categoryUpdateLoadingHash() =>
    r'4e49dade9f5597db712de0fc36a18edd20b7eda5';

abstract class _$CategoryUpdateLoading extends $Notifier<Set<String>> {
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

@ProviderFor(CategoryDeleteLoading)
const categoryDeleteLoadingProvider = CategoryDeleteLoadingProvider._();

final class CategoryDeleteLoadingProvider
    extends $NotifierProvider<CategoryDeleteLoading, Set<String>> {
  const CategoryDeleteLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoryDeleteLoadingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoryDeleteLoadingHash();

  @$internal
  @override
  CategoryDeleteLoading create() => CategoryDeleteLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$categoryDeleteLoadingHash() =>
    r'c1b3c5864c105d2d7ceb19504e8aa90492870a61';

abstract class _$CategoryDeleteLoading extends $Notifier<Set<String>> {
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
