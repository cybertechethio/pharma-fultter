// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BrandNotifier)
const brandProvider = BrandNotifierProvider._();

final class BrandNotifierProvider
    extends $AsyncNotifierProvider<BrandNotifier, List<BrandEntity>> {
  const BrandNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'brandProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$brandNotifierHash();

  @$internal
  @override
  BrandNotifier create() => BrandNotifier();
}

String _$brandNotifierHash() => r'77d49fa8616f978b17c2a2c0e7ebc0c80ec5bfd1';

abstract class _$BrandNotifier extends $AsyncNotifier<List<BrandEntity>> {
  FutureOr<List<BrandEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<BrandEntity>>, List<BrandEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<BrandEntity>>, List<BrandEntity>>,
              AsyncValue<List<BrandEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
