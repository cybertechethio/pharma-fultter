import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/supplier_customer.dart';
import '../repositories/supplier_customer_repository.dart';

class DeleteSupplierCustomerUseCase {
  final SupplierCustomerRepository _repository;

  DeleteSupplierCustomerUseCase(this._repository);

  Future<Either<Failure, SupplierCustomer>> call({
    required String id,
  }) async {
    return await _repository.deleteSupplierCustomer(id: id);
  }
}


