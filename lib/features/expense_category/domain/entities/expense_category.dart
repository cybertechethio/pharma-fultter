import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_category.freezed.dart';

@freezed
sealed class ExpenseCategory with _$ExpenseCategory {
  const factory ExpenseCategory({
    required String id,
    required int companyId,
    required String name,
    required String description,
    required DateTime createdAt,
    DateTime? updatedAt,
    int? createdBy,
    int? updatedBy,
  }) = _ExpenseCategory;
}
