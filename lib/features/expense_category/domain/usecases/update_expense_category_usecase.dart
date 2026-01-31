import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/expense_category.dart';
import '../repositories/expense_category_repository.dart';

class UpdateExpenseCategoryUseCase {
  final ExpenseCategoryRepository _repository;

  UpdateExpenseCategoryUseCase(this._repository);

  Future<Either<Failure, ExpenseCategory>> call({
    required String id,
    required String name,
    required String description,
  }) async {
    return await _repository.updateExpenseCategory(
      id: id,
      name: name,
      description: description,
    );
  }
}
