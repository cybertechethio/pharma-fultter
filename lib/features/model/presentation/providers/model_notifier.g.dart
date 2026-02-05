// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ModelNotifier)
const modelProvider = ModelNotifierProvider._();

final class ModelNotifierProvider
    extends $AsyncNotifierProvider<ModelNotifier, List<ModelEntity>> {
  const ModelNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'modelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$modelNotifierHash();

  @$internal
  @override
  ModelNotifier create() => ModelNotifier();
}

String _$modelNotifierHash() => r'6128775e364cb0acf2ec4d5af6a3915075858a5b';

abstract class _$ModelNotifier extends $AsyncNotifier<List<ModelEntity>> {
  FutureOr<List<ModelEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<ModelEntity>>, List<ModelEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<ModelEntity>>, List<ModelEntity>>,
              AsyncValue<List<ModelEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
