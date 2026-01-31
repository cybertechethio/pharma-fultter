import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/expense_category.dart';
import '../repositories/expense_category_repository.dart';

class GetExpenseCategoriesUseCase {
  final ExpenseCategoryRepository _repository;

  GetExpenseCategoriesUseCase(this._repository);

  Future<Either<Failure, List<ExpenseCategory>>> call() async {
    return await _repository.getExpenseCategories();
  }
}
