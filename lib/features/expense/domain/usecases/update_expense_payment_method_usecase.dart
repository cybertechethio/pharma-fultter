import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../repositories/expense_repository.dart';

class UpdateExpensePaymentMethodUseCase {
  final ExpenseRepository _repository;

  UpdateExpensePaymentMethodUseCase(this._repository);

  Future<Either<Failure, Unit>> call({
    required String expenseId,
    required String paymentMethodId,
    String? method,
    String? amount,
    String? referenceNumber,
    int? bankId,
    String? attachment,
  }) async {
    return await _repository.updateExpensePaymentMethod(
      expenseId: expenseId,
      paymentMethodId: paymentMethodId,
      method: method,
      amount: amount,
      referenceNumber: referenceNumber,
      bankId: bankId,
      attachment: attachment,
    );
  }
}
