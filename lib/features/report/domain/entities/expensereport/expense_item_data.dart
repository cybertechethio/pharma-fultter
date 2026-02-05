import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_item_data.freezed.dart';

@freezed
sealed class ExpenseItemData with _$ExpenseItemData {
  const factory ExpenseItemData({
    required int id,
    required String expenseName,
    String? category,
    String? description,
    required DateTime date,
    required double amount,
    String? paymentMethod,
  }) = _ExpenseItemData;
}

