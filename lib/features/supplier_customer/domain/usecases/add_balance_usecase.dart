import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../data/models/supplier_customer_payment_request.dart';
import '../repositories/supplier_customer_repository.dart';

/// Use case for adding balance payment to a customer
class AddBalanceUseCase {
  final SupplierCustomerRepository _repository;

  AddBalanceUseCase(this._repository);

  Future<Either<Failure, Unit>> call({
    required SupplierCustomerPaymentRequest request,
    Map<String, String> paymentAttachmentFilePaths = const {},
  }) {
    return _repository.addBalance(
      request: request,
      paymentAttachmentFilePaths: paymentAttachmentFilePaths,
    );
  }
}
