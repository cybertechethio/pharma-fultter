import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/supplier_customer.dart';
import '../repositories/supplier_customer_repository.dart';

class CreateSupplierCustomerUseCase {
  final SupplierCustomerRepository _repository;

  CreateSupplierCustomerUseCase(this._repository);

  Future<Either<Failure, SupplierCustomer>> call({
    required String name,
    required String phone,
    required String accountCode,
    required String tinNumber,
    required SupplierCustomerType type,
  }) async {
    return await _repository.createSupplierCustomer(
      name: name,
      phone: phone,
      accountCode: accountCode,
      tinNumber: tinNumber,
      type: type,
    );
  }
}


