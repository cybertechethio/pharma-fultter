import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../transaction/data/models/transaction_model.dart';
import '../models/supplier_customer_model.dart';
import '../models/supplier_customer_payment_request.dart';

abstract class SupplierCustomerRemoteDataSource {
  Future<Either<Failure, List<SupplierCustomerModel>>> getAll({
    String? search,
    String? type,
  });

  Future<Either<Failure, SupplierCustomerModel>> create({
    required String name,
    required String phone,
    required String accountCode,
    required String tinNumber,
    required String type,
  });

  Future<Either<Failure, SupplierCustomerModel>> update({
    required String id,
    required String name,
    required String phone,
    required String accountCode,
    required String tinNumber,
    required String type,
  });

  Future<Either<Failure, SupplierCustomerModel>> delete({
    required String id,
  });

  /// Get supplier/customer by ID
  Future<Either<Failure, SupplierCustomerModel>> getById({
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
  Future<Either<Failure, List<TransactionModel>>> getTransactions({
    required String supplierCustomerId,
  });
}


