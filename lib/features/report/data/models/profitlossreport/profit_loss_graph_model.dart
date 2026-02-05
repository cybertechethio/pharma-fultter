// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'profit_loss_day_data_model.dart';
import 'profit_loss_week_data_model.dart';
import 'profit_loss_month_data_model.dart';

part 'profit_loss_graph_model.freezed.dart';
part 'profit_loss_graph_model.g.dart';

@freezed
sealed class ProfitLossGraphModel with _$ProfitLossGraphModel {
  const factory ProfitLossGraphModel({
    required String granularity,
    List<ProfitLossDayDataModel>? days,
    List<ProfitLossWeekDataModel>? weeks,
    List<ProfitLossMonthDataModel>? months,
  }) = _ProfitLossGraphModel;

  factory ProfitLossGraphModel.fromJson(Map<String, dynamic> json) =>
      _$ProfitLossGraphModelFromJson(json);
}

