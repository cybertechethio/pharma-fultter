// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_loading_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BatchCreateLoading)
const batchCreateLoadingProvider = BatchCreateLoadingProvider._();

final class BatchCreateLoadingProvider
    extends $NotifierProvider<BatchCreateLoading, bool> {
  const BatchCreateLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'batchCreateLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$batchCreateLoadingHash();

  @$internal
  @override
  BatchCreateLoading create() => BatchCreateLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$batchCreateLoadingHash() =>
    r'ae60914414771da07e8f4539a36d50e2ea219f89';

abstract class _$BatchCreateLoading extends $Notifier<bool> {
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

@ProviderFor(BatchUpdateLoading)
const batchUpdateLoadingProvider = BatchUpdateLoadingProvider._();

final class BatchUpdateLoadingProvider
    extends $NotifierProvider<BatchUpdateLoading, Set<int>> {
  const BatchUpdateLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'batchUpdateLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$batchUpdateLoadingHash();

  @$internal
  @override
  BatchUpdateLoading create() => BatchUpdateLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<int>>(value),
    );
  }
}

String _$batchUpdateLoadingHash() =>
    r'14ac391ad6469b36e739bdbd36ed0d30345c360f';

abstract class _$BatchUpdateLoading extends $Notifier<Set<int>> {
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
