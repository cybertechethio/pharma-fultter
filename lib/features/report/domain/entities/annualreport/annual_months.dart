import 'package:freezed_annotation/freezed_annotation.dart';
import 'annual_month_data.dart';

part 'annual_months.freezed.dart';

@freezed
sealed class AnnualMonths with _$AnnualMonths {
  const factory AnnualMonths({
    required List<AnnualMonthData> months,
  }) = _AnnualMonths;
}

