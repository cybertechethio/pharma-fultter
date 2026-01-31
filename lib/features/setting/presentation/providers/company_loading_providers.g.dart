// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_loading_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CompanyUpdateLoading)
const companyUpdateLoadingProvider = CompanyUpdateLoadingProvider._();

final class CompanyUpdateLoadingProvider
    extends $NotifierProvider<CompanyUpdateLoading, bool> {
  const CompanyUpdateLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'companyUpdateLoadingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$companyUpdateLoadingHash();

  @$internal
  @override
  CompanyUpdateLoading create() => CompanyUpdateLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$companyUpdateLoadingHash() =>
    r'79822f44e9aadc44dd15c9ae6c24d4fd647c4266';

abstract class _$CompanyUpdateLoading extends $Notifier<bool> {
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
