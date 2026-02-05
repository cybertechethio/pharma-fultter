// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'best_seller_report_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BestSellerReportNotifier)
const bestSellerReportProvider = BestSellerReportNotifierFamily._();

final class BestSellerReportNotifierProvider
    extends $AsyncNotifierProvider<BestSellerReportNotifier, List<BestSeller>> {
  const BestSellerReportNotifierProvider._({
    required BestSellerReportNotifierFamily super.from,
    required ({DateTime startDate, DateTime endDate}) super.argument,
  }) : super(
         retry: null,
         name: r'bestSellerReportProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$bestSellerReportNotifierHash();

  @override
  String toString() {
    return r'bestSellerReportProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  BestSellerReportNotifier create() => BestSellerReportNotifier();

  @override
  bool operator ==(Object other) {
    return other is BestSellerReportNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bestSellerReportNotifierHash() =>
    r'0866c332fc68d800908eb400dde61eb3e1b73078';

final class BestSellerReportNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          BestSellerReportNotifier,
          AsyncValue<List<BestSeller>>,
          List<BestSeller>,
          FutureOr<List<BestSeller>>,
          ({DateTime startDate, DateTime endDate})
        > {
  const BestSellerReportNotifierFamily._()
    : super(
        retry: null,
        name: r'bestSellerReportProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BestSellerReportNotifierProvider call({
    required DateTime startDate,
    required DateTime endDate,
  }) => BestSellerReportNotifierProvider._(
    argument: (startDate: startDate, endDate: endDate),
    from: this,
  );

  @override
  String toString() => r'bestSellerReportProvider';
}

abstract class _$BestSellerReportNotifier
    extends $AsyncNotifier<List<BestSeller>> {
  late final _$args = ref.$arg as ({DateTime startDate, DateTime endDate});
  DateTime get startDate => _$args.startDate;
  DateTime get endDate => _$args.endDate;

  FutureOr<List<BestSeller>> build({
    required DateTime startDate,
    required DateTime endDate,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(startDate: _$args.startDate, endDate: _$args.endDate);
    final ref =
        this.ref as $Ref<AsyncValue<List<BestSeller>>, List<BestSeller>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<BestSeller>>, List<BestSeller>>,
              AsyncValue<List<BestSeller>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
