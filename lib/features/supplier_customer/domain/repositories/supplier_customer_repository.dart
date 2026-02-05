import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../transaction/domain/entities/transaction.dart';
import '../../data/models/supplier_customer_payment_request.dart';
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

  /// Get supplier/customer by ID
  Future<Either<Failure, SupplierCustomer>> getSupplierCustomerById({
    required String id,
  });

  /// Add balance payment for a customer
  Future<Either<Failure, Unit>> addBalance({
    required SupplierCustomerPaymentRequest request,
    required Map<String, String> paymentAttachmentFilePaths,
  });

  /// Create refund payment for a reversed transaction
  Future<Either<Failure, Unit>> refund({
    required SupplierCustomerPaymentRequest request,
    required Map<String, String> paymentAttachmentFilePaths,
  });

  /// Get transactions for a supplier/customer
  Future<Either<Failure, List<Transaction>>> getTransactions({
    required String supplierCustomerId,
  });
}
