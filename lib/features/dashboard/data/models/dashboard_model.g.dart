// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardModel _$DashboardModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_DashboardModel', json, ($checkedConvert) {
      final val = _DashboardModel(
        summary: $checkedConvert(
          'summary',
          (v) => SummaryModel.fromJson(v as Map<String, dynamic>),
        ),
        charts: $checkedConvert(
          'charts',
          (v) => ChartModel.fromJson(v as Map<String, dynamic>),
        ),
        lists: $checkedConvert(
          'lists',
          (v) => DashListModel.fromJson(v as Map<String, dynamic>),
        ),
        alerts: $checkedConvert(
          'alerts',
          (v) =>
              v == null ? null : AlertModel.fromJson(v as Map<String, dynamic>),
        ),
        overallInfo: $checkedConvert(
          'overallInfo',
          (v) => OverallInfoModel.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$DashboardModelToJson(_DashboardModel instance) =>
    <String, dynamic>{
      'summary': instance.summary.toJson(),
      'charts': instance.charts.toJson(),
      'lists': instance.lists.toJson(),
      'alerts': ?instance.alerts?.toJson(),
      'overallInfo': instance.overallInfo.toJson(),
    };
