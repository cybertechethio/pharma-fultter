import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/expense_category_model.dart';

abstract class ExpenseCategoryRemoteDataSource {
  Future<Either<Failure, List<ExpenseCategoryModel>>> getAll();

  Future<Either<Failure, ExpenseCategoryModel>> create({
    required String name,
    required String description,
  });

  Future<Either<Failure, ExpenseCategoryModel>> update({
    required String id,
    required String name,
    required String description,
  });

  Future<Either<Failure, ExpenseCategoryModel>> delete({
    required String id,
  });
}
