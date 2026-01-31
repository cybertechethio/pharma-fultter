// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BatchNotifier)
const batchProvider = BatchNotifierProvider._();

final class BatchNotifierProvider
    extends $AsyncNotifierProvider<BatchNotifier, List<BatchEntity>> {
  const BatchNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'batchProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$batchNotifierHash();

  @$internal
  @override
  BatchNotifier create() => BatchNotifier();
}

String _$batchNotifierHash() => r'bd0fecf4a0e58049bd5b7099242322b49e84b283';

abstract class _$BatchNotifier extends $AsyncNotifier<List<BatchEntity>> {
  FutureOr<List<BatchEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<BatchEntity>>, List<BatchEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<BatchEntity>>, List<BatchEntity>>,
              AsyncValue<List<BatchEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
