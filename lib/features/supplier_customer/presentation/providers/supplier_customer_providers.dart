import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/datasources/supplier_customer_api_service.dart';
import '../../data/datasources/supplier_customer_remote_data_source.dart';
import '../../data/datasources/supplier_customer_remote_data_source_impl.dart';
import '../../data/repositories/supplier_customer_repository_impl.dart';
import '../../domain/repositories/supplier_customer_repository.dart';
import '../../domain/usecases/get_supplier_customers_usecase.dart';
import '../../domain/usecases/create_supplier_customer_usecase.dart';
import '../../domain/usecases/update_supplier_customer_usecase.dart';
import '../../domain/usecases/delete_supplier_customer_usecase.dart';
import '../../domain/usecases/get_supplier_customer_transactions_usecase.dart';
import '../../domain/usecases/add_balance_usecase.dart';
import '../../domain/usecases/refund_usecase.dart';
import '../../domain/usecases/get_supplier_customer_by_id_usecase.dart';

part 'supplier_customer_providers.g.dart';

@riverpod
SupplierCustomerApiService supplierCustomerApiService(Ref ref) {
  return  SupplierCustomerApiService.create();
}

@riverpod
SupplierCustomerRemoteDataSource supplierCustomerRemoteDataSource(Ref ref) {
  return SupplierCustomerRemoteDataSourceImpl(
    ref.watch(supplierCustomerApiServiceProvider),
  );
}

@riverpod
SupplierCustomerRepository supplierCustomerRepository(Ref ref) {
  return SupplierCustomerRepositoryImpl(
    ref.watch(supplierCustomerRemoteDataSourceProvider),
  );
}

@riverpod
GetSupplierCustomersUseCase getSupplierCustomersUseCase(Ref ref) {
  return GetSupplierCustomersUseCase(
    ref.watch(supplierCustomerRepositoryProvider),
  );
}

@riverpod
CreateSupplierCustomerUseCase createSupplierCustomerUseCase(Ref ref) {
  return CreateSupplierCustomerUseCase(
    ref.watch(supplierCustomerRepositoryProvider),
  );
}

@riverpod
UpdateSupplierCustomerUseCase updateSupplierCustomerUseCase(Ref ref) {
  return UpdateSupplierCustomerUseCase(
    ref.watch(supplierCustomerRepositoryProvider),
  );
}

@riverpod
DeleteSupplierCustomerUseCase deleteSupplierCustomerUseCase(Ref ref) {
  return DeleteSupplierCustomerUseCase(
    ref.watch(supplierCustomerRepositoryProvider),
  );
}

@riverpod
GetSupplierCustomerTransactionsUseCase getSupplierCustomerTransactionsUseCase(Ref ref) {
  return GetSupplierCustomerTransactionsUseCase(
    ref.watch(supplierCustomerRepositoryProvider),
  );
}

@riverpod
AddBalanceUseCase addBalanceUseCase(Ref ref) {
  return AddBalanceUseCase(
    ref.watch(supplierCustomerRepositoryProvider),
  );
}

@riverpod
RefundUseCase refundUseCase(Ref ref) {
  return RefundUseCase(
    ref.watch(supplierCustomerRepositoryProvider),
  );
}

@riverpod
GetSupplierCustomerByIdUseCase getSupplierCustomerByIdUseCase(Ref ref) {
  return GetSupplierCustomerByIdUseCase(
    ref.watch(supplierCustomerRepositoryProvider),
  );
}

