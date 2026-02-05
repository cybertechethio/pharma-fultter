import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../data/models/supplier_customer_payment_request.dart';
import '../repositories/supplier_customer_repository.dart';

/// Use case for creating a refund payment for reversed transactions
class RefundUseCase {
  final SupplierCustomerRepository _repository;

  RefundUseCase(this._repository);

  Future<Either<Failure, Unit>> call({
    required SupplierCustomerPaymentRequest request,
    Map<String, String> paymentAttachmentFilePaths = const {},
  }) {
    return _repository.refund(
      request: request,
      paymentAttachmentFilePaths: paymentAttachmentFilePaths,
    );
  }
}
