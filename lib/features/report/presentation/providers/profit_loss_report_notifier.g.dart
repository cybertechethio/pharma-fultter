// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profit_loss_report_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProfitLossReportNotifier)
const profitLossReportProvider = ProfitLossReportNotifierFamily._();

final class ProfitLossReportNotifierProvider
    extends $AsyncNotifierProvider<ProfitLossReportNotifier, ProfitLossReport> {
  const ProfitLossReportNotifierProvider._({
    required ProfitLossReportNotifierFamily super.from,
    required ({DateTime startDate, DateTime endDate}) super.argument,
  }) : super(
         retry: null,
         name: r'profitLossReportProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$profitLossReportNotifierHash();

  @override
  String toString() {
    return r'profitLossReportProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  ProfitLossReportNotifier create() => ProfitLossReportNotifier();

  @override
  bool operator ==(Object other) {
    return other is ProfitLossReportNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$profitLossReportNotifierHash() =>
    r'95f08c4b78549ba7942527d12a695e62d8728965';

final class ProfitLossReportNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          ProfitLossReportNotifier,
          AsyncValue<ProfitLossReport>,
          ProfitLossReport,
          FutureOr<ProfitLossReport>,
          ({DateTime startDate, DateTime endDate})
        > {
  const ProfitLossReportNotifierFamily._()
    : super(
        retry: null,
        name: r'profitLossReportProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProfitLossReportNotifierProvider call({
    required DateTime startDate,
    required DateTime endDate,
  }) => ProfitLossReportNotifierProvider._(
    argument: (startDate: startDate, endDate: endDate),
    from: this,
  );

  @override
  String toString() => r'profitLossReportProvider';
}

abstract class _$ProfitLossReportNotifier
    extends $AsyncNotifier<ProfitLossReport> {
  late final _$args = ref.$arg as ({DateTime startDate, DateTime endDate});
  DateTime get startDate => _$args.startDate;
  DateTime get endDate => _$args.endDate;

  FutureOr<ProfitLossReport> build({
    required DateTime startDate,
    required DateTime endDate,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(startDate: _$args.startDate, endDate: _$args.endDate);
    final ref =
        this.ref as $Ref<AsyncValue<ProfitLossReport>, ProfitLossReport>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ProfitLossReport>, ProfitLossReport>,
              AsyncValue<ProfitLossReport>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
