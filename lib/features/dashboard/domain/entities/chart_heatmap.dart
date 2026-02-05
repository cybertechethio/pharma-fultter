import 'package:freezed_annotation/freezed_annotation.dart';
import 'heatmap_data.dart';

part 'chart_heatmap.freezed.dart';

@freezed
sealed class ChartHeatmap with _$ChartHeatmap {
  const factory ChartHeatmap({
    required List<HeatmapData> data,
  }) = _ChartHeatmap;
}

