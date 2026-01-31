// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_loading_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ModelCreateLoading)
const modelCreateLoadingProvider = ModelCreateLoadingProvider._();

final class ModelCreateLoadingProvider
    extends $NotifierProvider<ModelCreateLoading, bool> {
  const ModelCreateLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'modelCreateLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$modelCreateLoadingHash();

  @$internal
  @override
  ModelCreateLoading create() => ModelCreateLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$modelCreateLoadingHash() =>
    r'68e68a23723a372fadc4a87d0c7555d09aebd185';

abstract class _$ModelCreateLoading extends $Notifier<bool> {
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

@ProviderFor(ModelUpdateLoading)
const modelUpdateLoadingProvider = ModelUpdateLoadingProvider._();

final class ModelUpdateLoadingProvider
    extends $NotifierProvider<ModelUpdateLoading, Set<String>> {
  const ModelUpdateLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'modelUpdateLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$modelUpdateLoadingHash();

  @$internal
  @override
  ModelUpdateLoading create() => ModelUpdateLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$modelUpdateLoadingHash() =>
    r'e5c48fe381115fec37f4e3409da13e7fc41e4c2d';

abstract class _$ModelUpdateLoading extends $Notifier<Set<String>> {
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

@ProviderFor(ModelDeleteLoading)
const modelDeleteLoadingProvider = ModelDeleteLoadingProvider._();

final class ModelDeleteLoadingProvider
    extends $NotifierProvider<ModelDeleteLoading, Set<String>> {
  const ModelDeleteLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'modelDeleteLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$modelDeleteLoadingHash();

  @$internal
  @override
  ModelDeleteLoading create() => ModelDeleteLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$modelDeleteLoadingHash() =>
    r'07868377b9aae8a30eeaa58d42c40a5721cd9613';

abstract class _$ModelDeleteLoading extends $Notifier<Set<String>> {
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
