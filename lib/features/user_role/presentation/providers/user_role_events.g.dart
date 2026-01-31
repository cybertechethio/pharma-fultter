// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_role_events.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserRoleUiEvents)
const userRoleUiEventsProvider = UserRoleUiEventsProvider._();

final class UserRoleUiEventsProvider
    extends $NotifierProvider<UserRoleUiEvents, UserRoleUiEvent?> {
  const UserRoleUiEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userRoleUiEventsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userRoleUiEventsHash();

  @$internal
  @override
  UserRoleUiEvents create() => UserRoleUiEvents();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserRoleUiEvent? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserRoleUiEvent?>(value),
    );
  }
}

String _$userRoleUiEventsHash() => r'ece0293c82052c7b591a2f62256f929d9b1d1858';

abstract class _$UserRoleUiEvents extends $Notifier<UserRoleUiEvent?> {
  UserRoleUiEvent? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<UserRoleUiEvent?, UserRoleUiEvent?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UserRoleUiEvent?, UserRoleUiEvent?>,
              UserRoleUiEvent?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
