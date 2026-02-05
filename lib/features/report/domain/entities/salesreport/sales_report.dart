import 'package:freezed_annotation/freezed_annotation.dart';
import 'sales_item_data.dart';
import 'sales_summary.dart';

part 'sales_report.freezed.dart';

@freezed
sealed class SalesReport with _$SalesReport {
  const factory SalesReport({
    required List<SalesItemData> items,
    required SalesSummary summary,
  }) = _SalesReport;
}

