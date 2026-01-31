// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_loading_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RoleCreateLoading)
const roleCreateLoadingProvider = RoleCreateLoadingProvider._();

final class RoleCreateLoadingProvider
    extends $NotifierProvider<RoleCreateLoading, bool> {
  const RoleCreateLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'roleCreateLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$roleCreateLoadingHash();

  @$internal
  @override
  RoleCreateLoading create() => RoleCreateLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$roleCreateLoadingHash() => r'd2c51cd6bd54708f89d47d0a4829c14c0c98fca9';

abstract class _$RoleCreateLoading extends $Notifier<bool> {
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

@ProviderFor(RoleUpdateLoading)
const roleUpdateLoadingProvider = RoleUpdateLoadingProvider._();

final class RoleUpdateLoadingProvider
    extends $NotifierProvider<RoleUpdateLoading, Set<int>> {
  const RoleUpdateLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'roleUpdateLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$roleUpdateLoadingHash();

  @$internal
  @override
  RoleUpdateLoading create() => RoleUpdateLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<int>>(value),
    );
  }
}

String _$roleUpdateLoadingHash() => r'a8ba6b30ee739a1b522b28fd2af0af5f22e0273d';

abstract class _$RoleUpdateLoading extends $Notifier<Set<int>> {
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

@ProviderFor(RoleDeleteLoading)
const roleDeleteLoadingProvider = RoleDeleteLoadingProvider._();

final class RoleDeleteLoadingProvider
    extends $NotifierProvider<RoleDeleteLoading, Set<int>> {
  const RoleDeleteLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'roleDeleteLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$roleDeleteLoadingHash();

  @$internal
  @override
  RoleDeleteLoading create() => RoleDeleteLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<int>>(value),
    );
  }
}

String _$roleDeleteLoadingHash() => r'dd6167f32bc690bfdcface9fb9fdb2300ef68a5d';

abstract class _$RoleDeleteLoading extends $Notifier<Set<int>> {
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
