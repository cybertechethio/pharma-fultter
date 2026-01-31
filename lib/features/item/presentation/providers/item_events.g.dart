// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_events.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ItemUiEvents)
const itemUiEventsProvider = ItemUiEventsProvider._();

final class ItemUiEventsProvider
    extends $NotifierProvider<ItemUiEvents, ItemUiEvent?> {
  const ItemUiEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'itemUiEventsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$itemUiEventsHash();

  @$internal
  @override
  ItemUiEvents create() => ItemUiEvents();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ItemUiEvent? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ItemUiEvent?>(value),
    );
  }
}

String _$itemUiEventsHash() => r'f81f594ed7a70bbaa58bd5a67ca73ef95f8c115e';

abstract class _$ItemUiEvents extends $Notifier<ItemUiEvent?> {
  ItemUiEvent? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ItemUiEvent?, ItemUiEvent?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ItemUiEvent?, ItemUiEvent?>,
              ItemUiEvent?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
