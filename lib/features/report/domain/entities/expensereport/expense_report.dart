import 'package:freezed_annotation/freezed_annotation.dart';
import 'expense_item_data.dart';
import 'expense_summary.dart';

part 'expense_report.freezed.dart';

@freezed
sealed class ExpenseReport with _$ExpenseReport {
  const factory ExpenseReport({
    required List<ExpenseItemData> items,
    required ExpenseSummary summary,
  }) = _ExpenseReport;
}

