// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/enums/transaction_type_enum.dart';
import '../../../../core/enums/payment_method_type_enum.dart';
import '../../../../core/utils/json_type_converters.dart';
import 'payment_method_model.dart';

part 'create_trans_request.freezed.dart';
part 'create_trans_request.g.dart';

/// Request model for creating a transaction item
@freezed
sealed class CreateTransItemRequest with _$CreateTransItemRequest {
  const factory CreateTransItemRequest({
    required int itemId,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double quantity,
  }) = _CreateTransItemRequest;

  factory CreateTransItemRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTransItemRequestFromJson(json);
}

/// Request model for creating a transaction
@freezed
sealed class CreateTransRequest with _$CreateTransRequest {
  const factory CreateTransRequest({
   required TransactionType transactionType,
    int? supplierId,
    int? customerId,
    String? notes,
    @Default([]) List<String> attachments,
    required List<CreateTransItemRequest> items,
    List<PaymentMethodModel>? paymentMethods,
  }) = _CreateTransRequest;

  factory CreateTransRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTransRequestFromJson(json);
}

/// Extension methods for CreateTransRequest
extension CreateTransRequestX on CreateTransRequest {
  /// Validate transaction data based on transaction type
  String? validate() {
    // Validate transaction type requirements
    if (transactionType.requiresCustomerOrSupplier()) {
      if (transactionType == TransactionType.sale && customerId == null) {
        return 'Customer is required for sale transactions';
      }
      if (transactionType == TransactionType.purchase && supplierId == null) {
        return 'Supplier is required for purchase transactions';
      }
    }

    if (items.isEmpty) {
      return 'At least one item is required';
    }

    // Validate items
    for (var item in items) {
      if (item.quantity <= 0) {
        return 'Item quantity must be greater than 0';
      }
    }

    // Validate payment methods if required
    if (transactionType.requiresPaymentMethods()) {
      if (paymentMethods == null || paymentMethods!.isEmpty) {
        return 'At least one payment method is required';
      }

      for (var paymentMethod in paymentMethods!) {
        final error = _validatePaymentMethod(paymentMethod);
        if (error != null) {
          return error;
        }
      }
    }

    return null;
  }

  /// Validate individual payment method
  String? _validatePaymentMethod(PaymentMethodModel payment) {
    final method = PaymentMethodTypeExtension.fromString(payment.method);
    if (method.requiresBank() && payment.bankId == null) {
      return 'Bank selection is required for bank transfer';
    }
    if (payment.amount <= 0) {
      return 'Amount must be greater than 0';
    }
    return null;
  }
}
