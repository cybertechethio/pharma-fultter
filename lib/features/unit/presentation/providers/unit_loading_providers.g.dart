// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_loading_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UnitCreateLoading)
const unitCreateLoadingProvider = UnitCreateLoadingProvider._();

final class UnitCreateLoadingProvider
    extends $NotifierProvider<UnitCreateLoading, bool> {
  const UnitCreateLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'unitCreateLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$unitCreateLoadingHash();

  @$internal
  @override
  UnitCreateLoading create() => UnitCreateLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$unitCreateLoadingHash() => r'bad5eec67a188ae50aedfbae1996d8acf2defaea';

abstract class _$UnitCreateLoading extends $Notifier<bool> {
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

@ProviderFor(UnitUpdateLoading)
const unitUpdateLoadingProvider = UnitUpdateLoadingProvider._();

final class UnitUpdateLoadingProvider
    extends $NotifierProvider<UnitUpdateLoading, Set<String>> {
  const UnitUpdateLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'unitUpdateLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$unitUpdateLoadingHash();

  @$internal
  @override
  UnitUpdateLoading create() => UnitUpdateLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$unitUpdateLoadingHash() => r'b5838d984373f09232edca2e2cbb2f6c093945b5';

abstract class _$UnitUpdateLoading extends $Notifier<Set<String>> {
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

@ProviderFor(UnitDeleteLoading)
const unitDeleteLoadingProvider = UnitDeleteLoadingProvider._();

final class UnitDeleteLoadingProvider
    extends $NotifierProvider<UnitDeleteLoading, Set<String>> {
  const UnitDeleteLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'unitDeleteLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$unitDeleteLoadingHash();

  @$internal
  @override
  UnitDeleteLoading create() => UnitDeleteLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$unitDeleteLoadingHash() => r'04c4586e35c3ec4bc7ad2c5b059ef8491f3ba30a';

abstract class _$UnitDeleteLoading extends $Notifier<Set<String>> {
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
