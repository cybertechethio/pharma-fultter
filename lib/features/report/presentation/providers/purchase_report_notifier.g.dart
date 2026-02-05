// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_report_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PurchaseReportNotifier)
const purchaseReportProvider = PurchaseReportNotifierFamily._();

final class PurchaseReportNotifierProvider
    extends
        $AsyncNotifierProvider<PurchaseReportNotifier, List<PurchaseItemData>> {
  const PurchaseReportNotifierProvider._({
    required PurchaseReportNotifierFamily super.from,
    required ({DateTime startDate, DateTime endDate}) super.argument,
  }) : super(
         retry: null,
         name: r'purchaseReportProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$purchaseReportNotifierHash();

  @override
  String toString() {
    return r'purchaseReportProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  PurchaseReportNotifier create() => PurchaseReportNotifier();

  @override
  bool operator ==(Object other) {
    return other is PurchaseReportNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$purchaseReportNotifierHash() =>
    r'3844eae63a43c81822cca8a8869bf6077f5c2ca3';

final class PurchaseReportNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          PurchaseReportNotifier,
          AsyncValue<List<PurchaseItemData>>,
          List<PurchaseItemData>,
          FutureOr<List<PurchaseItemData>>,
          ({DateTime startDate, DateTime endDate})
        > {
  const PurchaseReportNotifierFamily._()
    : super(
        retry: null,
        name: r'purchaseReportProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PurchaseReportNotifierProvider call({
    required DateTime startDate,
    required DateTime endDate,
  }) => PurchaseReportNotifierProvider._(
    argument: (startDate: startDate, endDate: endDate),
    from: this,
  );

  @override
  String toString() => r'purchaseReportProvider';
}

abstract class _$PurchaseReportNotifier
    extends $AsyncNotifier<List<PurchaseItemData>> {
  late final _$args = ref.$arg as ({DateTime startDate, DateTime endDate});
  DateTime get startDate => _$args.startDate;
  DateTime get endDate => _$args.endDate;

  FutureOr<List<PurchaseItemData>> build({
    required DateTime startDate,
    required DateTime endDate,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(startDate: _$args.startDate, endDate: _$args.endDate);
    final ref =
        this.ref
            as $Ref<AsyncValue<List<PurchaseItemData>>, List<PurchaseItemData>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<PurchaseItemData>>,
                List<PurchaseItemData>
              >,
              AsyncValue<List<PurchaseItemData>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
