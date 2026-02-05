import 'package:freezed_annotation/freezed_annotation.dart';

part 'chartData.freezed.dart';

@freezed
sealed class ChartData with _$ChartData {
  const factory ChartData({
    required DateTime date,
    required double sales,
    required double purchase,
  }) = _ChartData;
}

