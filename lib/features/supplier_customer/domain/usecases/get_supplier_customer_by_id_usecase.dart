import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/supplier_customer.dart';
import '../repositories/supplier_customer_repository.dart';

/// Use case for getting a single supplier/customer by ID
class GetSupplierCustomerByIdUseCase {
  final SupplierCustomerRepository _repository;

  GetSupplierCustomerByIdUseCase(this._repository);

  Future<Either<Failure, SupplierCustomer>> call({
    required String id,
  }) {
    return _repository.getSupplierCustomerById(id: id);
  }
}

