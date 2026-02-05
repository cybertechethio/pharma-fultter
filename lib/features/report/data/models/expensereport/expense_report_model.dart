// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'expense_item_data_model.dart';
import 'expense_summary_model.dart';

part 'expense_report_model.freezed.dart';
part 'expense_report_model.g.dart';

@freezed
sealed class ExpenseReportModel with _$ExpenseReportModel {
  const factory ExpenseReportModel({
    required List<ExpenseItemDataModel> items,
    required ExpenseSummaryModel summary,
  }) = _ExpenseReportModel;

  factory ExpenseReportModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseReportModelFromJson(json);
}

