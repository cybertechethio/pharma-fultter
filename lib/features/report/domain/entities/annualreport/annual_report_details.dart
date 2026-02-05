import 'package:freezed_annotation/freezed_annotation.dart';
import 'annual_item_data.dart';
import 'annual_totals.dart';

part 'annual_report_details.freezed.dart';

@freezed
sealed class AnnualReportDetails with _$AnnualReportDetails {
  const factory AnnualReportDetails({
    required DateTime startDate,
    required DateTime endDate,
    required List<AnnualItemData> items,
    required AnnualTotals totals,
    required double expenses,
    required double netProfit,
  }) = _AnnualReportDetails;
}

