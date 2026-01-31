// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CompanyNotifier)
const companyProvider = CompanyNotifierProvider._();

final class CompanyNotifierProvider
    extends $AsyncNotifierProvider<CompanyNotifier, Company?> {
  const CompanyNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'companyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$companyNotifierHash();

  @$internal
  @override
  CompanyNotifier create() => CompanyNotifier();
}

String _$companyNotifierHash() => r'56c7dfbdd9cf91546db8888984f7ea4f69d9cdc6';

abstract class _$CompanyNotifier extends $AsyncNotifier<Company?> {
  FutureOr<Company?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<Company?>, Company?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Company?>, Company?>,
              AsyncValue<Company?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
