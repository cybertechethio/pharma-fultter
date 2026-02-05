// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'heatmap_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HeatmapDataModel _$HeatmapDataModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_HeatmapDataModel', json, ($checkedConvert) {
      final val = _HeatmapDataModel(
        date: $checkedConvert('date', (v) => DateTime.parse(v as String)),
        value: $checkedConvert(
          'value',
          (v) => JsonTypeConverters.intFromDynamic(v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$HeatmapDataModelToJson(_HeatmapDataModel instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'value': instance.value,
    };
