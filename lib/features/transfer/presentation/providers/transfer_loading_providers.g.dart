// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_loading_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TransferCreateLoading)
const transferCreateLoadingProvider = TransferCreateLoadingProvider._();

final class TransferCreateLoadingProvider
    extends $NotifierProvider<TransferCreateLoading, bool> {
  const TransferCreateLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transferCreateLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transferCreateLoadingHash();

  @$internal
  @override
  TransferCreateLoading create() => TransferCreateLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$transferCreateLoadingHash() =>
    r'46b092ec6a5aee529945cc64396322e15128ed96';

abstract class _$TransferCreateLoading extends $Notifier<bool> {
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

@ProviderFor(TransferStatusUpdateLoading)
const transferStatusUpdateLoadingProvider =
    TransferStatusUpdateLoadingProvider._();

final class TransferStatusUpdateLoadingProvider
    extends $NotifierProvider<TransferStatusUpdateLoading, Set<int>> {
  const TransferStatusUpdateLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transferStatusUpdateLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transferStatusUpdateLoadingHash();

  @$internal
  @override
  TransferStatusUpdateLoading create() => TransferStatusUpdateLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<int>>(value),
    );
  }
}

String _$transferStatusUpdateLoadingHash() =>
    r'd2f3273bef9e578fadd17ce3b14a2ba19a9954a4';

abstract class _$TransferStatusUpdateLoading extends $Notifier<Set<int>> {
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
