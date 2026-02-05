import 'package:freezed_annotation/freezed_annotation.dart';

part 'heatmap_data.freezed.dart';

@freezed
sealed class HeatmapData with _$HeatmapData {
  const factory HeatmapData({
    required DateTime date,
    required int value,
  }) = _HeatmapData;
}

