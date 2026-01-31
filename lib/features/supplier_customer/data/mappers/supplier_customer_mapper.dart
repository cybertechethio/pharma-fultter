import '../../domain/entities/supplier_customer.dart';
import '../models/supplier_customer_model.dart';

extension SupplierCustomerMapper on SupplierCustomerModel {
  SupplierCustomer toDomain() {
    return SupplierCustomer(
      id: id,
      name: name,
      phone: phone,
      accountCode: accountCode,
      tinNumber: tinNumber,
      type: _mapTypeToDomain(type),
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  /// Maps API type string to domain enum
  /// Handles both uppercase (CUSTOMER, SUPPLIER) and lowercase (customer, supplier) from backend
  static SupplierCustomerType _mapTypeToDomain(String value) {
    switch (value.toUpperCase()) {
      case 'CUSTOMER':
        return SupplierCustomerType.customer;
      case 'SUPPLIER':
        return SupplierCustomerType.supplier;
      default:
        return SupplierCustomerType.customer;
    }
  }
}


