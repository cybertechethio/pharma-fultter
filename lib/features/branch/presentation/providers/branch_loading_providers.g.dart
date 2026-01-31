// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_loading_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BranchCreateLoading)
const branchCreateLoadingProvider = BranchCreateLoadingProvider._();

final class BranchCreateLoadingProvider
    extends $NotifierProvider<BranchCreateLoading, bool> {
  const BranchCreateLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'branchCreateLoadingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$branchCreateLoadingHash();

  @$internal
  @override
  BranchCreateLoading create() => BranchCreateLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$branchCreateLoadingHash() =>
    r'22e5ae0a9d0bce7fc1f56e5a0599b83f1390fd63';

abstract class _$BranchCreateLoading extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(BranchUpdateLoading)
const branchUpdateLoadingProvider = BranchUpdateLoadingProvider._();

final class BranchUpdateLoadingProvider
    extends $NotifierProvider<BranchUpdateLoading, Set<String>> {
  const BranchUpdateLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'branchUpdateLoadingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$branchUpdateLoadingHash();

  @$internal
  @override
  BranchUpdateLoading create() => BranchUpdateLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$branchUpdateLoadingHash() =>
    r'466a1895d92b06cbc6665d70d80fd63b6db95715';

abstract class _$BranchUpdateLoading extends $Notifier<Set<String>> {
  Set<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Set<String>, Set<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<String>, Set<String>>,
              Set<String>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(BranchDeleteLoading)
const branchDeleteLoadingProvider = BranchDeleteLoadingProvider._();

final class BranchDeleteLoadingProvider
    extends $NotifierProvider<BranchDeleteLoading, Set<String>> {
  const BranchDeleteLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'branchDeleteLoadingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$branchDeleteLoadingHash();

  @$internal
  @override
  BranchDeleteLoading create() => BranchDeleteLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$branchDeleteLoadingHash() =>
    r'486daae855d99e2da03be31b142ce38264025709';

abstract class _$BranchDeleteLoading extends $Notifier<Set<String>> {
  Set<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Set<String>, Set<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<String>, Set<String>>,
              Set<String>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
