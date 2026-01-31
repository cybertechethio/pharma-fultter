// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_loading_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserCreateLoading)
const userCreateLoadingProvider = UserCreateLoadingProvider._();

final class UserCreateLoadingProvider
    extends $NotifierProvider<UserCreateLoading, bool> {
  const UserCreateLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userCreateLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userCreateLoadingHash();

  @$internal
  @override
  UserCreateLoading create() => UserCreateLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$userCreateLoadingHash() => r'9d57e5cd29020501a6c7fd0f1e24ffb78f61c7ad';

abstract class _$UserCreateLoading extends $Notifier<bool> {
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

@ProviderFor(UserUpdateLoading)
const userUpdateLoadingProvider = UserUpdateLoadingProvider._();

final class UserUpdateLoadingProvider
    extends $NotifierProvider<UserUpdateLoading, Set<int>> {
  const UserUpdateLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userUpdateLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userUpdateLoadingHash();

  @$internal
  @override
  UserUpdateLoading create() => UserUpdateLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<int>>(value),
    );
  }
}

String _$userUpdateLoadingHash() => r'd26121d4e1ba90b47ba161a2f2f518feb138104b';

abstract class _$UserUpdateLoading extends $Notifier<Set<int>> {
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

@ProviderFor(UserDeleteLoading)
const userDeleteLoadingProvider = UserDeleteLoadingProvider._();

final class UserDeleteLoadingProvider
    extends $NotifierProvider<UserDeleteLoading, Set<int>> {
  const UserDeleteLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userDeleteLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userDeleteLoadingHash();

  @$internal
  @override
  UserDeleteLoading create() => UserDeleteLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<int>>(value),
    );
  }
}

String _$userDeleteLoadingHash() => r'd114ada32dc9f82abf20affe72238900bcf8f3b9';

abstract class _$UserDeleteLoading extends $Notifier<Set<int>> {
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
