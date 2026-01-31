import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/supplier_customer.dart';

part 'supplier_customer_loading_providers.g.dart';

@riverpod
class SupplierCustomerCreateLoading extends _$SupplierCustomerCreateLoading {
  @override
  bool build(SupplierCustomerType type) => false;
  void setLoading(bool value) => state = value;
}

@riverpod
class SupplierCustomerUpdateLoading extends _$SupplierCustomerUpdateLoading {
  @override
  Set<String> build(SupplierCustomerType type) => <String>{};
  void start(String id) => state = {...state, id};
  void stop(String id) => state = state.where((e) => e != id).toSet();
  bool isLoading(String id) => state.contains(id);
}

@riverpod
class SupplierCustomerDeleteLoading extends _$SupplierCustomerDeleteLoading {
  @override
  Set<String> build(SupplierCustomerType type) => <String>{};
  void start(String id) => state = {...state, id};
  void stop(String id) => state = state.where((e) => e != id).toSet();
  bool isLoading(String id) => state.contains(id);
}


