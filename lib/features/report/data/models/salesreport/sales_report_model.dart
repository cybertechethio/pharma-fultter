// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'sales_item_data_model.dart';
import 'sales_summary_model.dart';

part 'sales_report_model.freezed.dart';
part 'sales_report_model.g.dart';

@freezed
sealed class SalesReportModel with _$SalesReportModel {
  const factory SalesReportModel({
    required List<SalesItemDataModel> items,
    required SalesSummaryModel summary,
  }) = _SalesReportModel;

  factory SalesReportModel.fromJson(Map<String, dynamic> json) =>
      _$SalesReportModelFromJson(json);
}

