// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_with_batches_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ItemWithBatchesNotifier)
const itemWithBatchesProvider = ItemWithBatchesNotifierProvider._();

final class ItemWithBatchesNotifierProvider
    extends
        $AsyncNotifierProvider<ItemWithBatchesNotifier, List<ItemWithBatches>> {
  const ItemWithBatchesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'itemWithBatchesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$itemWithBatchesNotifierHash();

  @$internal
  @override
  ItemWithBatchesNotifier create() => ItemWithBatchesNotifier();
}

String _$itemWithBatchesNotifierHash() =>
    r'5b826f140129c4a01e499061522cfe5659a8a084';

abstract class _$ItemWithBatchesNotifier
    extends $AsyncNotifier<List<ItemWithBatches>> {
  FutureOr<List<ItemWithBatches>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<List<ItemWithBatches>>, List<ItemWithBatches>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<ItemWithBatches>>,
                List<ItemWithBatches>
              >,
              AsyncValue<List<ItemWithBatches>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
