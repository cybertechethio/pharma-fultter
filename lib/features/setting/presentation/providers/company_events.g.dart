// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_events.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CompanyUiEvents)
const companyUiEventsProvider = CompanyUiEventsProvider._();

final class CompanyUiEventsProvider
    extends $NotifierProvider<CompanyUiEvents, CompanyUiEvent?> {
  const CompanyUiEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'companyUiEventsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$companyUiEventsHash();

  @$internal
  @override
  CompanyUiEvents create() => CompanyUiEvents();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CompanyUiEvent? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CompanyUiEvent?>(value),
    );
  }
}

String _$companyUiEventsHash() => r'ff214fd3391ee264e43c0dec143243c2360cd469';

abstract class _$CompanyUiEvents extends $Notifier<CompanyUiEvent?> {
  CompanyUiEvent? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<CompanyUiEvent?, CompanyUiEvent?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CompanyUiEvent?, CompanyUiEvent?>,
              CompanyUiEvent?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
