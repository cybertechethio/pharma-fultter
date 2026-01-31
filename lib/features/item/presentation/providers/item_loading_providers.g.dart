// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_loading_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ItemCreateLoading)
const itemCreateLoadingProvider = ItemCreateLoadingProvider._();

final class ItemCreateLoadingProvider
    extends $NotifierProvider<ItemCreateLoading, bool> {
  const ItemCreateLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'itemCreateLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$itemCreateLoadingHash();

  @$internal
  @override
  ItemCreateLoading create() => ItemCreateLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$itemCreateLoadingHash() => r'2d93f6e814abefa9ad66d78382d57b5c904b4674';

abstract class _$ItemCreateLoading extends $Notifier<bool> {
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

@ProviderFor(ItemUpdateLoading)
const itemUpdateLoadingProvider = ItemUpdateLoadingProvider._();

final class ItemUpdateLoadingProvider
    extends $NotifierProvider<ItemUpdateLoading, Set<String>> {
  const ItemUpdateLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'itemUpdateLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$itemUpdateLoadingHash();

  @$internal
  @override
  ItemUpdateLoading create() => ItemUpdateLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$itemUpdateLoadingHash() => r'8ad2609d4828d8365560ef9af0c179f4662e7c6a';

abstract class _$ItemUpdateLoading extends $Notifier<Set<String>> {
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

@ProviderFor(ItemDeleteLoading)
const itemDeleteLoadingProvider = ItemDeleteLoadingProvider._();

final class ItemDeleteLoadingProvider
    extends $NotifierProvider<ItemDeleteLoading, Set<String>> {
  const ItemDeleteLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'itemDeleteLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$itemDeleteLoadingHash();

  @$internal
  @override
  ItemDeleteLoading create() => ItemDeleteLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$itemDeleteLoadingHash() => r'1d8b480cddfa1c6a6aff8a374db5dea71a3775ae';

abstract class _$ItemDeleteLoading extends $Notifier<Set<String>> {
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
