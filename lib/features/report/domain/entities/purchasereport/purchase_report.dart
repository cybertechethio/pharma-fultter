import 'package:freezed_annotation/freezed_annotation.dart';
import 'purchase_item_data.dart';
import 'purchase_summary.dart';

part 'purchase_report.freezed.dart';

@freezed
sealed class PurchaseReport with _$PurchaseReport {
  const factory PurchaseReport({
    required List<PurchaseItemData> items,
    required PurchaseSummary summary,
  }) = _PurchaseReport;
}

