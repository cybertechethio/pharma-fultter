// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_report_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ExpenseReportNotifier)
const expenseReportProvider = ExpenseReportNotifierFamily._();

final class ExpenseReportNotifierProvider
    extends
        $AsyncNotifierProvider<ExpenseReportNotifier, List<ExpenseItemData>> {
  const ExpenseReportNotifierProvider._({
    required ExpenseReportNotifierFamily super.from,
    required ({DateTime startDate, DateTime endDate}) super.argument,
  }) : super(
         retry: null,
         name: r'expenseReportProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$expenseReportNotifierHash();

  @override
  String toString() {
    return r'expenseReportProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  ExpenseReportNotifier create() => ExpenseReportNotifier();

  @override
  bool operator ==(Object other) {
    return other is ExpenseReportNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$expenseReportNotifierHash() =>
    r'c95c9a4f9fe4f11572ca88d96dd4e5bd893fe393';

final class ExpenseReportNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          ExpenseReportNotifier,
          AsyncValue<List<ExpenseItemData>>,
          List<ExpenseItemData>,
          FutureOr<List<ExpenseItemData>>,
          ({DateTime startDate, DateTime endDate})
        > {
  const ExpenseReportNotifierFamily._()
    : super(
        retry: null,
        name: r'expenseReportProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ExpenseReportNotifierProvider call({
    required DateTime startDate,
    required DateTime endDate,
  }) => ExpenseReportNotifierProvider._(
    argument: (startDate: startDate, endDate: endDate),
    from: this,
  );

  @override
  String toString() => r'expenseReportProvider';
}

abstract class _$ExpenseReportNotifier
    extends $AsyncNotifier<List<ExpenseItemData>> {
  late final _$args = ref.$arg as ({DateTime startDate, DateTime endDate});
  DateTime get startDate => _$args.startDate;
  DateTime get endDate => _$args.endDate;

  FutureOr<List<ExpenseItemData>> build({
    required DateTime startDate,
    required DateTime endDate,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(startDate: _$args.startDate, endDate: _$args.endDate);
    final ref =
        this.ref
            as $Ref<AsyncValue<List<ExpenseItemData>>, List<ExpenseItemData>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<ExpenseItemData>>,
                List<ExpenseItemData>
              >,
              AsyncValue<List<ExpenseItemData>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
