import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/expense_category.dart';
import '../../domain/repositories/expense_category_repository.dart';
import '../datasources/expense_category_remote_data_source.dart';
import '../mappers/expense_category_mapper.dart';

class ExpenseCategoryRepositoryImpl implements ExpenseCategoryRepository {
  final ExpenseCategoryRemoteDataSource _remote;

  ExpenseCategoryRepositoryImpl(this._remote);

  @override
  Future<Either<Failure, List<ExpenseCategory>>> getExpenseCategories() async {
    final result = await _remote.getAll();

    return result.fold(
      (failure) => Left(failure),
      (models) {
        // Convert models to entities
        final entities = models
            .map((model) => model.toDomain())
            .toList();

        return Right(entities);
      },
    );
  }

  @override
  Future<Either<Failure, ExpenseCategory>> createExpenseCategory({
    required String name,
    required String description,
  }) async {
    final response = await _remote.create(
      name: name,
      description: description,
    );

    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, ExpenseCategory>> updateExpenseCategory({
    required String id,
    required String name,
    required String description,
  }) async {
    final response = await _remote.update(
      id: id,
      name: name,
      description: description,
    );

    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, ExpenseCategory>> deleteExpenseCategory({
    required String id,
  }) async {
    final response = await _remote.delete(id: id);
    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }
}
