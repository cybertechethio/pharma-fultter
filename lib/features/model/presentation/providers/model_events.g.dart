// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_events.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ModelUiEvents)
const modelUiEventsProvider = ModelUiEventsProvider._();

final class ModelUiEventsProvider
    extends $NotifierProvider<ModelUiEvents, ModelUiEvent?> {
  const ModelUiEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'modelUiEventsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$modelUiEventsHash();

  @$internal
  @override
  ModelUiEvents create() => ModelUiEvents();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ModelUiEvent? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ModelUiEvent?>(value),
    );
  }
}

String _$modelUiEventsHash() => r'41318a57a461ac8b1f3cb2759f43cfe172ba88c9';

abstract class _$ModelUiEvents extends $Notifier<ModelUiEvent?> {
  ModelUiEvent? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ModelUiEvent?, ModelUiEvent?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ModelUiEvent?, ModelUiEvent?>,
              ModelUiEvent?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
