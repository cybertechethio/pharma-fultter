// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'purchase_item_data_model.dart';
import 'purchase_summary_model.dart';

part 'purchase_report_model.freezed.dart';
part 'purchase_report_model.g.dart';

@freezed
sealed class PurchaseReportModel with _$PurchaseReportModel {
  const factory PurchaseReportModel({
    required List<PurchaseItemDataModel> items,
    required PurchaseSummaryModel summary,
  }) = _PurchaseReportModel;

  factory PurchaseReportModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseReportModelFromJson(json);
}

