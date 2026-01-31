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
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$modelNotifierHash();

  @$internal
  @override
  ModelNotifier create() => ModelNotifier();
}

String _$modelNotifierHash() => r'1c5348a31e660287bcbb58e13588f7783abc56bb';

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
