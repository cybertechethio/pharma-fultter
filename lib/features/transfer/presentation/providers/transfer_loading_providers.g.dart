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
