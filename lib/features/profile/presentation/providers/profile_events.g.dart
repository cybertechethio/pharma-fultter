// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_events.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for managing profile UI events

@ProviderFor(ProfileUiEvents)
const profileUiEventsProvider = ProfileUiEventsProvider._();

/// Provider for managing profile UI events
final class ProfileUiEventsProvider
    extends $NotifierProvider<ProfileUiEvents, ProfileUiEvent?> {
  /// Provider for managing profile UI events
  const ProfileUiEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileUiEventsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileUiEventsHash();

  @$internal
  @override
  ProfileUiEvents create() => ProfileUiEvents();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileUiEvent? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileUiEvent?>(value),
    );
  }
}

String _$profileUiEventsHash() => r'0f4032230d2fee9af31821a46cf3c9a3f18e3a2e';

/// Provider for managing profile UI events

abstract class _$ProfileUiEvents extends $Notifier<ProfileUiEvent?> {
  ProfileUiEvent? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ProfileUiEvent?, ProfileUiEvent?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProfileUiEvent?, ProfileUiEvent?>,
              ProfileUiEvent?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
