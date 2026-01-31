import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/supplier_customer_model.dart';

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
}


