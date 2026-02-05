import 'package:freezed_annotation/freezed_annotation.dart';
import 'profit_loss_day_data.dart';
import 'profit_loss_week_data.dart';
import 'profit_loss_month_data.dart';

part 'profit_loss_graph.freezed.dart';

@freezed
sealed class ProfitLossGraph with _$ProfitLossGraph {
  const factory ProfitLossGraph({
    required String granularity,
    List<ProfitLossDayData>? days,
    List<ProfitLossWeekData>? weeks,
    List<ProfitLossMonthData>? months,
  }) = _ProfitLossGraph;
}

