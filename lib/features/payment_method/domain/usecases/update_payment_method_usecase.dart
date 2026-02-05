import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../transaction/domain/entities/payment_method.dart';
import '../../data/models/payment_method_request.dart';
import '../repositories/payment_method_repository.dart';

class UpdatePaymentMethodUseCase {
  final PaymentMethodRepository _repository;

  UpdatePaymentMethodUseCase(this._repository);

  Future<Either<Failure, PaymentMethod>> call({
    required int paymentId,
    required int methodId,
    required PaymentMethodRequest request,
    String? attachmentFilePath,
  }) async {
    return await _repository.updatePaymentMethod(
      paymentId: paymentId,
      methodId: methodId,
      request: request,
      attachmentFilePath: attachmentFilePath,
    );
  }
}

