// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UnitNotifier)
const unitProvider = UnitNotifierProvider._();

final class UnitNotifierProvider
    extends $AsyncNotifierProvider<UnitNotifier, List<UnitEntity>> {
  const UnitNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'unitProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$unitNotifierHash();

  @$internal
  @override
  UnitNotifier create() => UnitNotifier();
}

String _$unitNotifierHash() => r'12f65fe1fa0cf4f43a43222f90bb4c2cabc106c1';

abstract class _$UnitNotifier extends $AsyncNotifier<List<UnitEntity>> {
  FutureOr<List<UnitEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<UnitEntity>>, List<UnitEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<UnitEntity>>, List<UnitEntity>>,
              AsyncValue<List<UnitEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
