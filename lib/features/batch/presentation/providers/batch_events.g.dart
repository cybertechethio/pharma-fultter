// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_events.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BatchUiEvents)
const batchUiEventsProvider = BatchUiEventsProvider._();

final class BatchUiEventsProvider
    extends $NotifierProvider<BatchUiEvents, BatchUiEvent?> {
  const BatchUiEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'batchUiEventsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$batchUiEventsHash();

  @$internal
  @override
  BatchUiEvents create() => BatchUiEvents();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BatchUiEvent? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BatchUiEvent?>(value),
    );
  }
}

String _$batchUiEventsHash() => r'7f89eb8ef7a9d3030f2a7634ee667e16eb24acd5';

abstract class _$BatchUiEvents extends $Notifier<BatchUiEvent?> {
  BatchUiEvent? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<BatchUiEvent?, BatchUiEvent?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BatchUiEvent?, BatchUiEvent?>,
              BatchUiEvent?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
