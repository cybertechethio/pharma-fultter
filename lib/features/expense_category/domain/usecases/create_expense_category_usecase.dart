import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/expense_category.dart';
import '../repositories/expense_category_repository.dart';

class CreateExpenseCategoryUseCase {
  final ExpenseCategoryRepository _repository;

  CreateExpenseCategoryUseCase(this._repository);

  Future<Either<Failure, ExpenseCategory>> call({
    required String name,
    required String description,
  }) async {
    return await _repository.createExpenseCategory(
      name: name,
      description: description,
    );
  }
}
