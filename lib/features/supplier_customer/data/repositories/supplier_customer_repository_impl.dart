import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/supplier_customer.dart';
import '../../domain/repositories/supplier_customer_repository.dart';
import '../datasources/supplier_customer_remote_data_source.dart';
import '../mappers/supplier_customer_mapper.dart';

class SupplierCustomerRepositoryImpl implements SupplierCustomerRepository {
  final SupplierCustomerRemoteDataSource _remote;

  SupplierCustomerRepositoryImpl(this._remote);

  @override
  Future<Either<Failure, List<SupplierCustomer>>> getSupplierCustomers({
    String? search,
    SupplierCustomerType? type,
  }) async {
    final typeString = type != null ? _mapTypeToQueryParam(type) : null;
    final response = await _remote.getAll(search: search, type: typeString);
    return response.fold(
      (failure) => Left(failure),
      (models) => Right(models.map((m) => m.toDomain()).toList()),
    );
  }

  @override
  Future<Either<Failure, SupplierCustomer>> createSupplierCustomer({
    required String name,
    required String phone,
    required String accountCode,
    required String tinNumber,
    required SupplierCustomerType type,
  }) async {
    final response = await _remote.create(
      name: name,
      phone: phone,
      accountCode: accountCode,
      tinNumber: tinNumber,
      type: _mapTypeToApi(type),
    );

    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, SupplierCustomer>> updateSupplierCustomer({
    required String id,
    required String name,
    required String phone,
    required String accountCode,
    required String tinNumber,
    required SupplierCustomerType type,
  }) async {
    final response = await _remote.update(
      id: id,
      name: name,
      phone: phone,
      accountCode: accountCode,
      tinNumber: tinNumber,
      type: _mapTypeToApi(type),
    );

    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, SupplierCustomer>> deleteSupplierCustomer({
    required String id,
  }) async {
    final response = await _remote.delete(id: id);
    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  String _mapTypeToApi(SupplierCustomerType type) {
    switch (type) {
      case SupplierCustomerType.customer:
        return 'CUSTOMER';
      case SupplierCustomerType.supplier:
        return 'SUPPLIER';
    }
  }

  String _mapTypeToQueryParam(SupplierCustomerType type) {
    switch (type) {
      case SupplierCustomerType.customer:
        return 'customer';
      case SupplierCustomerType.supplier:
        return 'supplier';
    }
  }
}


