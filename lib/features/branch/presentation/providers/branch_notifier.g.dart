// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BranchNotifier)
const branchProvider = BranchNotifierProvider._();

final class BranchNotifierProvider
    extends $AsyncNotifierProvider<BranchNotifier, List<Branch>> {
  const BranchNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'branchProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$branchNotifierHash();

  @$internal
  @override
  BranchNotifier create() => BranchNotifier();
}

String _$branchNotifierHash() => r'5037b9f79e8d6a7803546be510da1b696ee95942';

abstract class _$BranchNotifier extends $AsyncNotifier<List<Branch>> {
  FutureOr<List<Branch>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Branch>>, List<Branch>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Branch>>, List<Branch>>,
              AsyncValue<List<Branch>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
