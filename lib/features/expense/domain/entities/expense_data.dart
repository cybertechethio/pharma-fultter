import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../shared/models/pagination_model.dart';
import 'expense.dart';

part 'expense_data.freezed.dart';

@freezed
sealed class ExpenseData with _$ExpenseData {
  const factory ExpenseData({
    required List<Expense> data,
    required PaginationModel pagination,
  }) = _ExpenseData;
}
