import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/expense.dart';
import '../repositories/expense_repository.dart';

class UpdateExpenseUseCase {
  final ExpenseRepository _repository;

  UpdateExpenseUseCase(this._repository);

  Future<Either<Failure, Expense>> call({
    required String id,
    required String? categoryId,
    required DateTime expenseDate,
    required String name,
    required String? notes,
    required List<String>? attachmentFilePaths,
  }) async {
    return await _repository.updateExpense(
      id: id,
      categoryId: categoryId,
      expenseDate: expenseDate,
      name: name,
      notes: notes,
      attachmentFilePaths: attachmentFilePaths,
    );
  }
}
