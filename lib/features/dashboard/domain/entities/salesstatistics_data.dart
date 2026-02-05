import 'package:freezed_annotation/freezed_annotation.dart';

part 'salesstatistics_data.freezed.dart';

@freezed
sealed class SalesStatisticsData with _$SalesStatisticsData {
  const factory SalesStatisticsData({
    required String date,
    required double revenue,
    required double expense,
  }) = _SalesStatisticsData;
}

