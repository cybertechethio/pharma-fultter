import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_summary.freezed.dart';

@freezed
sealed class ExpenseSummary with _$ExpenseSummary {
  const factory ExpenseSummary({
    required int totalExpenses,
    required double totalAmount,
    required double averageExpense,
    required double largestExpense,
  }) = _ExpenseSummary;
}

