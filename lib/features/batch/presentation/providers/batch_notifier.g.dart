// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BatchNotifier)
const batchProvider = BatchNotifierFamily._();

final class BatchNotifierProvider
    extends $AsyncNotifierProvider<BatchNotifier, List<BatchEntity>> {
  const BatchNotifierProvider._({
    required BatchNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'batchProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$batchNotifierHash();

  @override
  String toString() {
    return r'batchProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  BatchNotifier create() => BatchNotifier();

  @override
  bool operator ==(Object other) {
    return other is BatchNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$batchNotifierHash() => r'9b6b1f502df8835f5c63f7ba83e47de1dad0f45e';

final class BatchNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          BatchNotifier,
          AsyncValue<List<BatchEntity>>,
          List<BatchEntity>,
          FutureOr<List<BatchEntity>>,
          int
        > {
  const BatchNotifierFamily._()
    : super(
        retry: null,
        name: r'batchProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BatchNotifierProvider call(int itemId) =>
      BatchNotifierProvider._(argument: itemId, from: this);

  @override
  String toString() => r'batchProvider';
}

abstract class _$BatchNotifier extends $AsyncNotifier<List<BatchEntity>> {
  late final _$args = ref.$arg as int;
  int get itemId => _$args;

  FutureOr<List<BatchEntity>> build(int itemId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
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
