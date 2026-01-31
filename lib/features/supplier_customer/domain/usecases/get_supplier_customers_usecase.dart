import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/supplier_customer.dart';
import '../repositories/supplier_customer_repository.dart';

class GetSupplierCustomersUseCase {
  final SupplierCustomerRepository _repository;

  GetSupplierCustomersUseCase(this._repository);

  Future<Either<Failure, List<SupplierCustomer>>> call({
    String? search,
    SupplierCustomerType? type,
  }) async {
    return await _repository.getSupplierCustomers(search: search, type: type);
  }
}


