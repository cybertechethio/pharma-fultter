// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_events.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TransactionUiEvents)
const transactionUiEventsProvider = TransactionUiEventsProvider._();

final class TransactionUiEventsProvider
    extends $NotifierProvider<TransactionUiEvents, TransactionUiEvent?> {
  const TransactionUiEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transactionUiEventsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transactionUiEventsHash();

  @$internal
  @override
  TransactionUiEvents create() => TransactionUiEvents();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TransactionUiEvent? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TransactionUiEvent?>(value),
    );
  }
}

String _$transactionUiEventsHash() =>
    r'962d6c56302a8aac2b8eac04fafc7f6e3eb4edeb';

abstract class _$TransactionUiEvents extends $Notifier<TransactionUiEvent?> {
  TransactionUiEvent? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<TransactionUiEvent?, TransactionUiEvent?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TransactionUiEvent?, TransactionUiEvent?>,
              TransactionUiEvent?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
