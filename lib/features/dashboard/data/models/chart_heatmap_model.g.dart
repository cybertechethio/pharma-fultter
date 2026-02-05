// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_heatmap_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChartHeatmapModel _$ChartHeatmapModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ChartHeatmapModel', json, ($checkedConvert) {
      final val = _ChartHeatmapModel(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => HeatmapDataModel.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ChartHeatmapModelToJson(_ChartHeatmapModel instance) =>
    <String, dynamic>{'data': instance.data.map((e) => e.toJson()).toList()};
