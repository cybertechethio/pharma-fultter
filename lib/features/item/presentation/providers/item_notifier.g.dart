// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ItemNotifier)
const itemProvider = ItemNotifierProvider._();

final class ItemNotifierProvider
    extends $AsyncNotifierProvider<ItemNotifier, List<Item>> {
  const ItemNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'itemProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$itemNotifierHash();

  @$internal
  @override
  ItemNotifier create() => ItemNotifier();
}

String _$itemNotifierHash() => r'0a93272b076df0539b4be093e6bd1935b1bcf01d';

abstract class _$ItemNotifier extends $AsyncNotifier<List<Item>> {
  FutureOr<List<Item>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Item>>, List<Item>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Item>>, List<Item>>,
              AsyncValue<List<Item>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
