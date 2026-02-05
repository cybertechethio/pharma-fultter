import 'package:freezed_annotation/freezed_annotation.dart';
import 'annual_report_details.dart';
import 'annual_chart_data.dart';

part 'annual_report.freezed.dart';

@freezed
sealed class AnnualReport with _$AnnualReport {
  const factory AnnualReport({
    required AnnualReportDetails report,
    required AnnualChartData charts,
  }) = _AnnualReport;
}

