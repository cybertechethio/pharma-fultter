import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/expense_detail.dart';
import '../repositories/expense_repository.dart';

class GetExpenseByIdUseCase {
  final ExpenseRepository _repository;

  GetExpenseByIdUseCase(this._repository);

  Future<Either<Failure, ExpenseDetail>> call({
    required String id,
  }) async {
    return await _repository.getExpenseById(id: id);
  }
}
