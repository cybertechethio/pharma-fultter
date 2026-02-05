// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_events.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(StockUiEvents)
const stockUiEventsProvider = StockUiEventsProvider._();

final class StockUiEventsProvider
    extends $NotifierProvider<StockUiEvents, StockUiEvent?> {
  const StockUiEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stockUiEventsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stockUiEventsHash();

  @$internal
  @override
  StockUiEvents create() => StockUiEvents();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StockUiEvent? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StockUiEvent?>(value),
    );
  }
}

String _$stockUiEventsHash() => r'6d91bf89f4fdbca6d57f8b85eae555bfd63b9b15';

abstract class _$StockUiEvents extends $Notifier<StockUiEvent?> {
  StockUiEvent? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<StockUiEvent?, StockUiEvent?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<StockUiEvent?, StockUiEvent?>,
              StockUiEvent?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
