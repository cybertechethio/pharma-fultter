// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'profit_loss_item_data_model.dart';
import 'profit_loss_totals_model.dart';

part 'profit_loss_report_details_model.freezed.dart';
part 'profit_loss_report_details_model.g.dart';

@freezed
sealed class ProfitLossReportDetailsModel with _$ProfitLossReportDetailsModel {
  const factory ProfitLossReportDetailsModel({
    required DateTime date,
    required List<ProfitLossItemDataModel> items,
    required ProfitLossTotalsModel totals,
  }) = _ProfitLossReportDetailsModel;

  factory ProfitLossReportDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProfitLossReportDetailsModelFromJson(json);
}

