import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense.freezed.dart';

@freezed
sealed class Expense with _$Expense {
  const factory Expense({
    required String id,
    required String amount,
    required DateTime expenseDate,
    required String name,
    required DateTime createdAt,
    int? createdBy,
  }) = _Expense;
}
