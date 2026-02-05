import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../transaction/domain/entities/transaction.dart';
import '../repositories/supplier_customer_repository.dart';

/// Use case for getting transactions for a supplier/customer
class GetSupplierCustomerTransactionsUseCase {
  final SupplierCustomerRepository _repository;

  GetSupplierCustomerTransactionsUseCase(this._repository);

  Future<Either<Failure, List<Transaction>>> call({
    required String supplierCustomerId,
  }) {
    return _repository.getTransactions(supplierCustomerId: supplierCustomerId);
  }
}
