// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category_loading_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SubCategoryCreateLoading)
const subCategoryCreateLoadingProvider = SubCategoryCreateLoadingProvider._();

final class SubCategoryCreateLoadingProvider
    extends $NotifierProvider<SubCategoryCreateLoading, bool> {
  const SubCategoryCreateLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subCategoryCreateLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$subCategoryCreateLoadingHash();

  @$internal
  @override
  SubCategoryCreateLoading create() => SubCategoryCreateLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$subCategoryCreateLoadingHash() =>
    r'80a14d5df7d8dcb7b1cd25b0840f36cfd76c9b68';

abstract class _$SubCategoryCreateLoading extends $Notifier<bool> {
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

@ProviderFor(SubCategoryUpdateLoading)
const subCategoryUpdateLoadingProvider = SubCategoryUpdateLoadingProvider._();

final class SubCategoryUpdateLoadingProvider
    extends $NotifierProvider<SubCategoryUpdateLoading, Set<String>> {
  const SubCategoryUpdateLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subCategoryUpdateLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$subCategoryUpdateLoadingHash();

  @$internal
  @override
  SubCategoryUpdateLoading create() => SubCategoryUpdateLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$subCategoryUpdateLoadingHash() =>
    r'1013007aa12a6a49dcf43dd182c7e3e7302d5721';

abstract class _$SubCategoryUpdateLoading extends $Notifier<Set<String>> {
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

@ProviderFor(SubCategoryDeleteLoading)
const subCategoryDeleteLoadingProvider = SubCategoryDeleteLoadingProvider._();

final class SubCategoryDeleteLoadingProvider
    extends $NotifierProvider<SubCategoryDeleteLoading, Set<String>> {
  const SubCategoryDeleteLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subCategoryDeleteLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$subCategoryDeleteLoadingHash();

  @$internal
  @override
  SubCategoryDeleteLoading create() => SubCategoryDeleteLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$subCategoryDeleteLoadingHash() =>
    r'c9766547cb9e467dbd9a15f84f3106d6b35fb7a9';

abstract class _$SubCategoryDeleteLoading extends $Notifier<Set<String>> {
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
