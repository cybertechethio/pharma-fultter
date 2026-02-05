import 'package:freezed_annotation/freezed_annotation.dart';

part 'supplier_customer.freezed.dart';

enum SupplierCustomerType { customer, supplier }

@freezed
sealed class SupplierCustomer with _$SupplierCustomer {
  const factory SupplierCustomer({
    required String id,
    required String name,
    required String phone,
    required String accountCode,
    required String tinNumber,
    required SupplierCustomerType type,
    required String balance,
    required bool isActive,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _SupplierCustomer;
}


