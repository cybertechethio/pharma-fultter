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
    extends $NotifierProvider<ItemUpdateLoading, Set<int>> {
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
  Override overrideWithValue(Set<int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<int>>(value),
    );
  }
}

String _$itemUpdateLoadingHash() => r'fdcba70b4e4d806055a001fe76a85c848194a882';

abstract class _$ItemUpdateLoading extends $Notifier<Set<int>> {
  Set<int> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Set<int>, Set<int>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<int>, Set<int>>,
              Set<int>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(ItemDeleteLoading)
const itemDeleteLoadingProvider = ItemDeleteLoadingProvider._();

final class ItemDeleteLoadingProvider
    extends $NotifierProvider<ItemDeleteLoading, Set<int>> {
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
  Override overrideWithValue(Set<int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<int>>(value),
    );
  }
}

String _$itemDeleteLoadingHash() => r'fb14e3b8401c5dac2aac7902541fee3c3d2dfb75';

abstract class _$ItemDeleteLoading extends $Notifier<Set<int>> {
  Set<int> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Set<int>, Set<int>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<int>, Set<int>>,
              Set<int>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
