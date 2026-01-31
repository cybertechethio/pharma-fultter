import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/expense_category.dart';
import '../repositories/expense_category_repository.dart';

class DeleteExpenseCategoryUseCase {
  final ExpenseCategoryRepository _repository;

  DeleteExpenseCategoryUseCase(this._repository);

  Future<Either<Failure, ExpenseCategory>> call({
    required String id,
  }) async {
    return await _repository.deleteExpenseCategory(id: id);
  }
}
