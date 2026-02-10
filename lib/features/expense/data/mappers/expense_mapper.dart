import '../../domain/entities/expense.dart';
import '../models/expense_model.dart';

extension ExpenseMapper on ExpenseModel {
  Expense toDomain() {
    return Expense(
      id: id,
      amount: amount,
      expenseDate: expenseDate,
      name: name,
      createdAt: createdAt,
      createdBy: createdBy,
      attachments: attachments,
    );
  }
}
