import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../repositories/payment_method_repository.dart';

class DeletePaymentMethodUseCase {
  final PaymentMethodRepository _repository;

  DeletePaymentMethodUseCase(this._repository);

  Future<Either<Failure, void>> call({
    required int paymentId,
    required int methodId,
  }) async {
    return await _repository.deletePaymentMethod(
      paymentId: paymentId,
      methodId: methodId,
    );
  }
}

