import 'package:freezed_annotation/freezed_annotation.dart';
import 'profit_loss_item_data.dart';
import 'profit_loss_totals.dart';

part 'profit_loss_report_details.freezed.dart';

@freezed
sealed class ProfitLossReportDetails with _$ProfitLossReportDetails {
  const factory ProfitLossReportDetails({
    required DateTime date,
    required List<ProfitLossItemData> items,
    required ProfitLossTotals totals,
  }) = _ProfitLossReportDetails;
}

