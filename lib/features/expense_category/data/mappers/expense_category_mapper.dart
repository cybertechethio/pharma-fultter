import '../../domain/entities/expense_category.dart';
import '../models/expense_category_model.dart';

extension ExpenseCategoryMapper on ExpenseCategoryModel {
  ExpenseCategory toDomain() {
    return ExpenseCategory(
      id: id,
      companyId: companyId,
      name: name,
      description: description,
      createdAt: createdAt,
      updatedAt: updatedAt,
      createdBy: createdBy,
      updatedBy: updatedBy,
    );
  }
}
