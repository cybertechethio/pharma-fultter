// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_events.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RoleUiEvents)
const roleUiEventsProvider = RoleUiEventsProvider._();

final class RoleUiEventsProvider
    extends $NotifierProvider<RoleUiEvents, RoleUiEvent?> {
  const RoleUiEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'roleUiEventsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$roleUiEventsHash();

  @$internal
  @override
  RoleUiEvents create() => RoleUiEvents();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RoleUiEvent? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RoleUiEvent?>(value),
    );
  }
}

String _$roleUiEventsHash() => r'c0733b84e25b5e92c0f014c64865b2421faa6065';

abstract class _$RoleUiEvents extends $Notifier<RoleUiEvent?> {
  RoleUiEvent? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<RoleUiEvent?, RoleUiEvent?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RoleUiEvent?, RoleUiEvent?>,
              RoleUiEvent?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
