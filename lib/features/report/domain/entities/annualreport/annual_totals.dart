import 'package:freezed_annotation/freezed_annotation.dart';

part 'annual_totals.freezed.dart';

@freezed
sealed class AnnualTotals with _$AnnualTotals {
  const factory AnnualTotals({
    required double sales,
    required double cost,
    required double vat,
    required double grossProfit,
  }) = _AnnualTotals;
}

