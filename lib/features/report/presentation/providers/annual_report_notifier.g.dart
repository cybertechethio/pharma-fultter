// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annual_report_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AnnualReportNotifier)
const annualReportProvider = AnnualReportNotifierFamily._();

final class AnnualReportNotifierProvider
    extends $AsyncNotifierProvider<AnnualReportNotifier, AnnualReport> {
  const AnnualReportNotifierProvider._({
    required AnnualReportNotifierFamily super.from,
    required DateTime super.argument,
  }) : super(
         retry: null,
         name: r'annualReportProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$annualReportNotifierHash();

  @override
  String toString() {
    return r'annualReportProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  AnnualReportNotifier create() => AnnualReportNotifier();

  @override
  bool operator ==(Object other) {
    return other is AnnualReportNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$annualReportNotifierHash() =>
    r'a95d49ab7699eca1b80de579c84a2dafcac599b1';

final class AnnualReportNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          AnnualReportNotifier,
          AsyncValue<AnnualReport>,
          AnnualReport,
          FutureOr<AnnualReport>,
          DateTime
        > {
  const AnnualReportNotifierFamily._()
    : super(
        retry: null,
        name: r'annualReportProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AnnualReportNotifierProvider call({required DateTime startDate}) =>
      AnnualReportNotifierProvider._(argument: startDate, from: this);

  @override
  String toString() => r'annualReportProvider';
}

abstract class _$AnnualReportNotifier extends $AsyncNotifier<AnnualReport> {
  late final _$args = ref.$arg as DateTime;
  DateTime get startDate => _$args;

  FutureOr<AnnualReport> build({required DateTime startDate});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(startDate: _$args);
    final ref = this.ref as $Ref<AsyncValue<AnnualReport>, AnnualReport>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AnnualReport>, AnnualReport>,
              AsyncValue<AnnualReport>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
