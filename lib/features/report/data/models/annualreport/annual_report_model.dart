// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'annual_report_details_model.dart';
import 'annual_chart_data_model.dart';

part 'annual_report_model.freezed.dart';
part 'annual_report_model.g.dart';

@freezed
sealed class AnnualReportModel with _$AnnualReportModel {
  const factory AnnualReportModel({
    required AnnualReportDetailsModel report,
    required AnnualChartDataModel charts,
  }) = _AnnualReportModel;

  factory AnnualReportModel.fromJson(Map<String, dynamic> json) =>
      _$AnnualReportModelFromJson(json);
}

