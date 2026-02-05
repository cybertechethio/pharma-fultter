import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/supplier_customer.dart';
import 'supplier_customer_providers.dart';

part 'supplier_customer_detail_provider.g.dart';

/// FutureProvider to fetch a single supplier/customer by ID
@riverpod
Future<SupplierCustomer> supplierCustomerDetail(
  Ref ref,
  String id,
) async {
  final result = await ref.watch(getSupplierCustomerByIdUseCaseProvider).call(id: id);
  return result.fold(
    (failure) => throw failure,
    (supplierCustomer) => supplierCustomer,
  );
}

