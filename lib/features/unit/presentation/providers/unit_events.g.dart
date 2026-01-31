// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_events.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UnitUiEvents)
const unitUiEventsProvider = UnitUiEventsProvider._();

final class UnitUiEventsProvider
    extends $NotifierProvider<UnitUiEvents, UnitUiEvent?> {
  const UnitUiEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'unitUiEventsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$unitUiEventsHash();

  @$internal
  @override
  UnitUiEvents create() => UnitUiEvents();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UnitUiEvent? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UnitUiEvent?>(value),
    );
  }
}

String _$unitUiEventsHash() => r'7d8f0feade7ff3e52f376198979e136da402f21e';

abstract class _$UnitUiEvents extends $Notifier<UnitUiEvent?> {
  UnitUiEvent? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<UnitUiEvent?, UnitUiEvent?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UnitUiEvent?, UnitUiEvent?>,
              UnitUiEvent?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
