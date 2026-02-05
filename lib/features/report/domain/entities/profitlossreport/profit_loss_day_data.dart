import 'package:freezed_annotation/freezed_annotation.dart';

part 'profit_loss_day_data.freezed.dart';

@freezed
sealed class ProfitLossDayData with _$ProfitLossDayData {
  const factory ProfitLossDayData({
    required DateTime date,
    required double sales,
    required double profit,
  }) = _ProfitLossDayData;
}

