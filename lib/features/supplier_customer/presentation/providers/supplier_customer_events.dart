import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../supplier_customer/domain/entities/supplier_customer.dart';
import '../../../../core/errors/failure.dart';

part 'supplier_customer_events.g.dart';

sealed class SupplierCustomerUiEvent {}

class SupplierCustomerCreated extends SupplierCustomerUiEvent {
  final SupplierCustomer entity;
  final String message;
  SupplierCustomerCreated(this.entity, this.message);
}

class SupplierCustomerUpdated extends SupplierCustomerUiEvent {
  final SupplierCustomer entity;
  final String message;
  SupplierCustomerUpdated(this.entity, this.message);
}

class SupplierCustomerDeleted extends SupplierCustomerUiEvent {
  final String id;
  final String message;
  SupplierCustomerDeleted(this.id, this.message);
}

class SupplierCustomerFailure extends SupplierCustomerUiEvent {
  final Failure failure;
  SupplierCustomerFailure(this.failure);
}

class AddBalanceSuccess extends SupplierCustomerUiEvent {
  final String? customerId;
  final String? supplierId;
  final String message;
  AddBalanceSuccess({this.customerId, this.supplierId, required this.message});
}

class RefundSuccess extends SupplierCustomerUiEvent {
  final String? customerId;
  final String? supplierId;
  final String message;
  RefundSuccess({this.customerId, this.supplierId, required this.message});
}

@riverpod
class SupplierCustomerUiEvents extends _$SupplierCustomerUiEvents {
  @override
  SupplierCustomerUiEvent? build(SupplierCustomerType type) {
    return null;
  }

  void emit(SupplierCustomerUiEvent event) {
    state = event;
  }

  void clear() {
    state = null;
  }
}


