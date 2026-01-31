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

part 'supplier_customer_providers.g.dart';

@riverpod
SupplierCustomerApiService supplierCustomerApiService(Ref ref) {
  return const SupplierCustomerApiService();
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


