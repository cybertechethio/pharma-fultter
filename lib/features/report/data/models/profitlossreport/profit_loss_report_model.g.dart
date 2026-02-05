// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profit_loss_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfitLossReportModel _$ProfitLossReportModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ProfitLossReportModel', json, ($checkedConvert) {
  final val = _ProfitLossReportModel(
    report: $checkedConvert(
      'report',
      (v) => ProfitLossReportDetailsModel.fromJson(v as Map<String, dynamic>),
    ),
    graph: $checkedConvert(
      'graph',
      (v) => ProfitLossGraphModel.fromJson(v as Map<String, dynamic>),
    ),
    graph10Days: $checkedConvert(
      'graph10Days',
      (v) => ProfitLossGraphModel.fromJson(v as Map<String, dynamic>),
    ),
    graphDateRange: $checkedConvert(
      'graphDateRange',
      (v) => v == null
          ? null
          : ProfitLossGraphModel.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$ProfitLossReportModelToJson(
  _ProfitLossReportModel instance,
) => <String, dynamic>{
  'report': instance.report.toJson(),
  'graph': instance.graph.toJson(),
  'graph10Days': instance.graph10Days.toJson(),
  'graphDateRange': ?instance.graphDateRange?.toJson(),
};
