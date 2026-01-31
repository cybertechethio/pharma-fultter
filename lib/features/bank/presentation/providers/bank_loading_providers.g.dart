// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_loading_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BankCreateLoading)
const bankCreateLoadingProvider = BankCreateLoadingProvider._();

final class BankCreateLoadingProvider
    extends $NotifierProvider<BankCreateLoading, bool> {
  const BankCreateLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bankCreateLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bankCreateLoadingHash();

  @$internal
  @override
  BankCreateLoading create() => BankCreateLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$bankCreateLoadingHash() => r'c2c36cbd9dabdd5b016bc7fe1b21c8087faeaaba';

abstract class _$BankCreateLoading extends $Notifier<bool> {
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

@ProviderFor(BankUpdateLoading)
const bankUpdateLoadingProvider = BankUpdateLoadingProvider._();

final class BankUpdateLoadingProvider
    extends $NotifierProvider<BankUpdateLoading, Set<int>> {
  const BankUpdateLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bankUpdateLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bankUpdateLoadingHash();

  @$internal
  @override
  BankUpdateLoading create() => BankUpdateLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<int>>(value),
    );
  }
}

String _$bankUpdateLoadingHash() => r'e61b461b2e93a62b989060e15fd1da7d99c59a26';

abstract class _$BankUpdateLoading extends $Notifier<Set<int>> {
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

@ProviderFor(BankDeleteLoading)
const bankDeleteLoadingProvider = BankDeleteLoadingProvider._();

final class BankDeleteLoadingProvider
    extends $NotifierProvider<BankDeleteLoading, Set<int>> {
  const BankDeleteLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bankDeleteLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bankDeleteLoadingHash();

  @$internal
  @override
  BankDeleteLoading create() => BankDeleteLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<int>>(value),
    );
  }
}

String _$bankDeleteLoadingHash() => r'023f019e3a2418d11598ba8838c7b0bc45e1fcde';

abstract class _$BankDeleteLoading extends $Notifier<Set<int>> {
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
