import 'package:freezed_annotation/freezed_annotation.dart';
import 'profit_loss_report_details.dart';
import 'profit_loss_graph.dart';

part 'profit_loss_report.freezed.dart';

@freezed
sealed class ProfitLossReport with _$ProfitLossReport {
  const factory ProfitLossReport({
    required ProfitLossReportDetails report,
    required ProfitLossGraph graph,
    required ProfitLossGraph graph10Days,
    ProfitLossGraph? graphDateRange,
  }) = _ProfitLossReport;
}

