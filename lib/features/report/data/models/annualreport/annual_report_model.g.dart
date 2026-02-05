// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annual_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnnualReportModel _$AnnualReportModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_AnnualReportModel', json, ($checkedConvert) {
      final val = _AnnualReportModel(
        report: $checkedConvert(
          'report',
          (v) => AnnualReportDetailsModel.fromJson(v as Map<String, dynamic>),
        ),
        charts: $checkedConvert(
          'charts',
          (v) => AnnualChartDataModel.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$AnnualReportModelToJson(_AnnualReportModel instance) =>
    <String, dynamic>{
      'report': instance.report.toJson(),
      'charts': instance.charts.toJson(),
    };
