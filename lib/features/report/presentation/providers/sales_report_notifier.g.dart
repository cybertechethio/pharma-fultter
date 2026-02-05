// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_report_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SalesReportNotifier)
const salesReportProvider = SalesReportNotifierFamily._();

final class SalesReportNotifierProvider
    extends $AsyncNotifierProvider<SalesReportNotifier, List<SalesItemData>> {
  const SalesReportNotifierProvider._({
    required SalesReportNotifierFamily super.from,
    required ({DateTime startDate, DateTime endDate}) super.argument,
  }) : super(
         retry: null,
         name: r'salesReportProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$salesReportNotifierHash();

  @override
  String toString() {
    return r'salesReportProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  SalesReportNotifier create() => SalesReportNotifier();

  @override
  bool operator ==(Object other) {
    return other is SalesReportNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$salesReportNotifierHash() =>
    r'd4f8f8d3c46a00c9ac852fa7e343def3a2b49c07';

final class SalesReportNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          SalesReportNotifier,
          AsyncValue<List<SalesItemData>>,
          List<SalesItemData>,
          FutureOr<List<SalesItemData>>,
          ({DateTime startDate, DateTime endDate})
        > {
  const SalesReportNotifierFamily._()
    : super(
        retry: null,
        name: r'salesReportProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SalesReportNotifierProvider call({
    required DateTime startDate,
    required DateTime endDate,
  }) => SalesReportNotifierProvider._(
    argument: (startDate: startDate, endDate: endDate),
    from: this,
  );

  @override
  String toString() => r'salesReportProvider';
}

abstract class _$SalesReportNotifier
    extends $AsyncNotifier<List<SalesItemData>> {
  late final _$args = ref.$arg as ({DateTime startDate, DateTime endDate});
  DateTime get startDate => _$args.startDate;
  DateTime get endDate => _$args.endDate;

  FutureOr<List<SalesItemData>> build({
    required DateTime startDate,
    required DateTime endDate,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(startDate: _$args.startDate, endDate: _$args.endDate);
    final ref =
        this.ref as $Ref<AsyncValue<List<SalesItemData>>, List<SalesItemData>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<SalesItemData>>, List<SalesItemData>>,
              AsyncValue<List<SalesItemData>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
