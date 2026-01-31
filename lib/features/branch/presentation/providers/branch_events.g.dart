// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_events.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BranchUiEvents)
const branchUiEventsProvider = BranchUiEventsProvider._();

final class BranchUiEventsProvider
    extends $NotifierProvider<BranchUiEvents, BranchUiEvent?> {
  const BranchUiEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'branchUiEventsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$branchUiEventsHash();

  @$internal
  @override
  BranchUiEvents create() => BranchUiEvents();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BranchUiEvent? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BranchUiEvent?>(value),
    );
  }
}

String _$branchUiEventsHash() => r'67bb46ded51f818c0ac950d0c09233ef23acfbed';

abstract class _$BranchUiEvents extends $Notifier<BranchUiEvent?> {
  BranchUiEvent? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<BranchUiEvent?, BranchUiEvent?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BranchUiEvent?, BranchUiEvent?>,
              BranchUiEvent?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
