// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stocks_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(StockNotifier)
const stockProvider = StockNotifierProvider._();

final class StockNotifierProvider
    extends $AsyncNotifierProvider<StockNotifier, List<Stock>> {
  const StockNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stockProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stockNotifierHash();

  @$internal
  @override
  StockNotifier create() => StockNotifier();
}

String _$stockNotifierHash() => r'a3d2ba68c73d510e21433fce8bd4042d31cf2981';

abstract class _$StockNotifier extends $AsyncNotifier<List<Stock>> {
  FutureOr<List<Stock>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Stock>>, List<Stock>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Stock>>, List<Stock>>,
              AsyncValue<List<Stock>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
