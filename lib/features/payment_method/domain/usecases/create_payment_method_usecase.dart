import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../transaction/domain/entities/payment_method.dart';
import '../../data/models/payment_method_request.dart';
import '../repositories/payment_method_repository.dart';

class CreatePaymentMethodUseCase {
  final PaymentMethodRepository _repository;

  CreatePaymentMethodUseCase(this._repository);

  Future<Either<Failure, List<PaymentMethod>>> call({
    required int paymentId,
    required PaymentMethodRequest request,
    String? attachmentFilePath,
  }) async {
    return await _repository.createPaymentMethod(
      paymentId: paymentId,
      request: request,
      attachmentFilePath: attachmentFilePath,
    );
  }
}

