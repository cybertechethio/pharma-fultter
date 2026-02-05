import 'package:freezed_annotation/freezed_annotation.dart';

part 'profit_loss_totals.freezed.dart';

@freezed
sealed class ProfitLossTotals with _$ProfitLossTotals {
  const factory ProfitLossTotals({
    required double sales,
    required double cost,
    required double vat,
    required double grossProfit,
  }) = _ProfitLossTotals;
}

