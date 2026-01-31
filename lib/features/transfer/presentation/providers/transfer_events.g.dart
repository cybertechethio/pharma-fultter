// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_events.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TransferUiEvents)
const transferUiEventsProvider = TransferUiEventsProvider._();

final class TransferUiEventsProvider
    extends $NotifierProvider<TransferUiEvents, TransferUiEvent?> {
  const TransferUiEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transferUiEventsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transferUiEventsHash();

  @$internal
  @override
  TransferUiEvents create() => TransferUiEvents();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TransferUiEvent? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TransferUiEvent?>(value),
    );
  }
}

String _$transferUiEventsHash() => r'61ef401ca7c2ee7ffab2427e9a40ed3e2f1e4a87';

abstract class _$TransferUiEvents extends $Notifier<TransferUiEvent?> {
  TransferUiEvent? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<TransferUiEvent?, TransferUiEvent?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TransferUiEvent?, TransferUiEvent?>,
              TransferUiEvent?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
