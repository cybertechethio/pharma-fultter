// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_events.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserUiEvents)
const userUiEventsProvider = UserUiEventsProvider._();

final class UserUiEventsProvider
    extends $NotifierProvider<UserUiEvents, UserUiEvent?> {
  const UserUiEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userUiEventsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userUiEventsHash();

  @$internal
  @override
  UserUiEvents create() => UserUiEvents();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserUiEvent? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserUiEvent?>(value),
    );
  }
}

String _$userUiEventsHash() => r'105c02b650718d770006d9e03ebbb8b8bb66754d';

abstract class _$UserUiEvents extends $Notifier<UserUiEvent?> {
  UserUiEvent? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<UserUiEvent?, UserUiEvent?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UserUiEvent?, UserUiEvent?>,
              UserUiEvent?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
