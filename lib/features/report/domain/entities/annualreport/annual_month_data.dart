import 'package:freezed_annotation/freezed_annotation.dart';

part 'annual_month_data.freezed.dart';

@freezed
sealed class AnnualMonthData with _$AnnualMonthData {
  const factory AnnualMonthData({
    required String month,
    required double sales,
    required double profit,
  }) = _AnnualMonthData;
}

