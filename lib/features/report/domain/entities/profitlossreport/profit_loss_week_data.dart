import 'package:freezed_annotation/freezed_annotation.dart';

part 'profit_loss_week_data.freezed.dart';

@freezed
sealed class ProfitLossWeekData with _$ProfitLossWeekData {
  const factory ProfitLossWeekData({
    required String week,
    required double sales,
    required double profit,
  }) = _ProfitLossWeekData;
}

