// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'customer_item_data_model.dart';
import 'customer_summary_model.dart';

part 'customer_report_model.freezed.dart';
part 'customer_report_model.g.dart';

@freezed
sealed class CustomerReportModel with _$CustomerReportModel {
  const factory CustomerReportModel({
    required List<CustomerItemDataModel> items,
    required CustomerSummaryModel summary,
  }) = _CustomerReportModel;

  factory CustomerReportModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerReportModelFromJson(json);
}

