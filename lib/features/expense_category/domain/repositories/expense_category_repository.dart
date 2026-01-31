import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/expense_category.dart';

abstract class ExpenseCategoryRepository {
  Future<Either<Failure, List<ExpenseCategory>>> getExpenseCategories();

  Future<Either<Failure, ExpenseCategory>> createExpenseCategory({
    required String name,
    required String description,
  });

  Future<Either<Failure, ExpenseCategory>> updateExpenseCategory({
    required String id,
    required String name,
    required String description,
  });

  Future<Either<Failure, ExpenseCategory>> deleteExpenseCategory({
    required String id,
  });
}
