// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'heatmap_data_model.dart';

part 'chart_heatmap_model.freezed.dart';
part 'chart_heatmap_model.g.dart';

@freezed
sealed class ChartHeatmapModel with _$ChartHeatmapModel {
  const factory ChartHeatmapModel({
    required List<HeatmapDataModel> data,
  }) = _ChartHeatmapModel;

  factory ChartHeatmapModel.fromJson(Map<String, dynamic> json) =>
      _$ChartHeatmapModelFromJson(json);
}

