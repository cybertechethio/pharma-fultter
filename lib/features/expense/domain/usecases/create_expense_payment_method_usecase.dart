import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../repositories/expense_repository.dart';

class CreateExpensePaymentMethodUseCase {
  final ExpenseRepository _repository;

  CreateExpensePaymentMethodUseCase(this._repository);

  Future<Either<Failure, Unit>> call({
    required String expenseId,
    required String method,
    required String amount,
    String? referenceNumber,
    int? bankId,
  }) async {
    return await _repository.createExpensePaymentMethod(
      expenseId: expenseId,
      method: method,
      amount: amount,
      referenceNumber: referenceNumber,
      bankId: bankId,
    );
  }
}
