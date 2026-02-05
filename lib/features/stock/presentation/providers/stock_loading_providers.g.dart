// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_loading_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(StockUpdateLoading)
const stockUpdateLoadingProvider = StockUpdateLoadingProvider._();

final class StockUpdateLoadingProvider
    extends $NotifierProvider<StockUpdateLoading, Set<int>> {
  const StockUpdateLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stockUpdateLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stockUpdateLoadingHash();

  @$internal
  @override
  StockUpdateLoading create() => StockUpdateLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<int>>(value),
    );
  }
}

String _$stockUpdateLoadingHash() =>
    r'3bd8a36d1e8c12dddf5e177a4b4078fe0fb6404f';

abstract class _$StockUpdateLoading extends $Notifier<Set<int>> {
  Set<int> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Set<int>, Set<int>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<int>, Set<int>>,
              Set<int>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
