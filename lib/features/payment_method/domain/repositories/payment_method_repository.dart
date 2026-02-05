import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../transaction/domain/entities/payment_method.dart';
import '../../data/models/payment_method_request.dart';

abstract class PaymentMethodRepository {
  /// Create payment method(s) for a payment
  /// Returns list of created payment methods
  Future<Either<Failure, List<PaymentMethod>>> createPaymentMethod({
    required int paymentId,
    required PaymentMethodRequest request,
    String? attachmentFilePath,
  });

  /// Update payment method for a payment
  Future<Either<Failure, PaymentMethod>> updatePaymentMethod({
    required int paymentId,
    required int methodId,
    required PaymentMethodRequest request,
    String? attachmentFilePath,
  });

  /// Delete payment method for a payment
  Future<Either<Failure, void>> deletePaymentMethod({
    required int paymentId,
    required int methodId,
  });
}

