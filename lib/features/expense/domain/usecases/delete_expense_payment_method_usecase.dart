import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../repositories/expense_repository.dart';

class DeleteExpensePaymentMethodUseCase {
  final ExpenseRepository _repository;

  DeleteExpensePaymentMethodUseCase(this._repository);

  Future<Either<Failure, Unit>> call({
    required String expenseId,
    required String paymentMethodId,
  }) async {
    return await _repository.deleteExpensePaymentMethod(
      expenseId: expenseId,
      paymentMethodId: paymentMethodId,
    );
  }
}
