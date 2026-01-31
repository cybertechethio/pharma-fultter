// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_loading_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BrandCreateLoading)
const brandCreateLoadingProvider = BrandCreateLoadingProvider._();

final class BrandCreateLoadingProvider
    extends $NotifierProvider<BrandCreateLoading, bool> {
  const BrandCreateLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'brandCreateLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$brandCreateLoadingHash();

  @$internal
  @override
  BrandCreateLoading create() => BrandCreateLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$brandCreateLoadingHash() =>
    r'fd54b5685035f3190691c053cdfbbf31bdb9f3d7';

abstract class _$BrandCreateLoading extends $Notifier<bool> {
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

@ProviderFor(BrandUpdateLoading)
const brandUpdateLoadingProvider = BrandUpdateLoadingProvider._();

final class BrandUpdateLoadingProvider
    extends $NotifierProvider<BrandUpdateLoading, Set<String>> {
  const BrandUpdateLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'brandUpdateLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$brandUpdateLoadingHash();

  @$internal
  @override
  BrandUpdateLoading create() => BrandUpdateLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$brandUpdateLoadingHash() =>
    r'6722a9dc7e570bdd08e83709e4781fdb19c4c81d';

abstract class _$BrandUpdateLoading extends $Notifier<Set<String>> {
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

@ProviderFor(BrandDeleteLoading)
const brandDeleteLoadingProvider = BrandDeleteLoadingProvider._();

final class BrandDeleteLoadingProvider
    extends $NotifierProvider<BrandDeleteLoading, Set<String>> {
  const BrandDeleteLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'brandDeleteLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$brandDeleteLoadingHash();

  @$internal
  @override
  BrandDeleteLoading create() => BrandDeleteLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$brandDeleteLoadingHash() =>
    r'fe0bc3218f4d10ecad0941826fc77da8d0ad5a1f';

abstract class _$BrandDeleteLoading extends $Notifier<Set<String>> {
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
