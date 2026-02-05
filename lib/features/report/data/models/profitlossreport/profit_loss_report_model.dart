// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'profit_loss_report_details_model.dart';
import 'profit_loss_graph_model.dart';

part 'profit_loss_report_model.freezed.dart';
part 'profit_loss_report_model.g.dart';

@freezed
sealed class ProfitLossReportModel with _$ProfitLossReportModel {
  const factory ProfitLossReportModel({
    required ProfitLossReportDetailsModel report,
    required ProfitLossGraphModel graph,
    required ProfitLossGraphModel graph10Days,
    ProfitLossGraphModel? graphDateRange,
  }) = _ProfitLossReportModel;

  factory ProfitLossReportModel.fromJson(Map<String, dynamic> json) =>
      _$ProfitLossReportModelFromJson(json);
}

