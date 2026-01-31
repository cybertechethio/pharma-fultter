import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/expense.dart';
import '../repositories/expense_repository.dart';

class DeleteExpenseUseCase {
  final ExpenseRepository _repository;

  DeleteExpenseUseCase(this._repository);

  Future<Either<Failure, Expense>> call({
    required String id,
  }) async {
    return await _repository.deleteExpense(id: id);
  }
}
