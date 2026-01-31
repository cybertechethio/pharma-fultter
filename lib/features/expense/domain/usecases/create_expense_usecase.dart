import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/expense.dart';
import '../repositories/expense_repository.dart';

class CreateExpenseUseCase {
  final ExpenseRepository _repository;

  CreateExpenseUseCase(this._repository);

  Future<Either<Failure, Expense>> call({
    required String? categoryId,
    required DateTime expenseDate,
    required String name,
    required String? notes,
    required List<String>? attachmentFilePaths,
    required List<Map<String, dynamic>> paymentMethods,
  }) async {
    return await _repository.createExpense(
      categoryId: categoryId,
      expenseDate: expenseDate,
      name: name,
      notes: notes,
      attachmentFilePaths: attachmentFilePaths,
      paymentMethods: paymentMethods,
    );
  }
}
