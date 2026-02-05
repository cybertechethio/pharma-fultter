import 'package:freezed_annotation/freezed_annotation.dart';

part 'profit_loss_month_data.freezed.dart';

@freezed
sealed class ProfitLossMonthData with _$ProfitLossMonthData {
  const factory ProfitLossMonthData({
    required String month,
    required double sales,
    required double profit,
  }) = _ProfitLossMonthData;
}

