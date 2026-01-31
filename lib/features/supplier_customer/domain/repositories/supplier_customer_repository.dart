import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/supplier_customer.dart';

abstract class SupplierCustomerRepository {
  Future<Either<Failure, List<SupplierCustomer>>> getSupplierCustomers({
    String? search,
    SupplierCustomerType? type,
  });

  Future<Either<Failure, SupplierCustomer>> createSupplierCustomer({
    required String name,
    required String phone,
    required String accountCode,
    required String tinNumber,
    required SupplierCustomerType type,
  });

  Future<Either<Failure, SupplierCustomer>> updateSupplierCustomer({
    required String id,
    required String name,
    required String phone,
    required String accountCode,
    required String tinNumber,
    required SupplierCustomerType type,
  });

  Future<Either<Failure, SupplierCustomer>> deleteSupplierCustomer({
    required String id,
  });
}


