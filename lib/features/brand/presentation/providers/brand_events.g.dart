// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_events.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BrandUiEvents)
const brandUiEventsProvider = BrandUiEventsProvider._();

final class BrandUiEventsProvider
    extends $NotifierProvider<BrandUiEvents, BrandUiEvent?> {
  const BrandUiEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'brandUiEventsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$brandUiEventsHash();

  @$internal
  @override
  BrandUiEvents create() => BrandUiEvents();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BrandUiEvent? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BrandUiEvent?>(value),
    );
  }
}

String _$brandUiEventsHash() => r'b18899b848e1b1f324160913b9d8b3d78b715100';

abstract class _$BrandUiEvents extends $Notifier<BrandUiEvent?> {
  BrandUiEvent? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<BrandUiEvent?, BrandUiEvent?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BrandUiEvent?, BrandUiEvent?>,
              BrandUiEvent?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
