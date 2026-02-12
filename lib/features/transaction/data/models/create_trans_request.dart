// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/enums/transaction_type_enum.dart';
import '../../../../core/enums/payment_method_type_enum.dart';
import '../../../../core/utils/json_type_converters.dart';
import 'payment_method_model.dart';

part 'create_trans_request.freezed.dart';
part 'create_trans_request.g.dart';

/// Request model for a batch within a transaction item (API: items[].batches[])
@freezed
sealed class CreateTransactionBatchRequest with _$CreateTransactionBatchRequest {
  const factory CreateTransactionBatchRequest({
    required String batchNumber,
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
    required int quantity,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)
    double? costPrice,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)
    double? unitPrice,
  }) = _CreateTransactionBatchRequest;

  factory CreateTransactionBatchRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTransactionBatchRequestFromJson(json);
}

/// Request model for creating a transaction item (API: items[])
@freezed
sealed class CreateTransItemRequest with _$CreateTransItemRequest {
  const factory CreateTransItemRequest({
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
    required int itemId,
    required List<CreateTransactionBatchRequest> batches,
  }) = _CreateTransItemRequest;

  factory CreateTransItemRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTransItemRequestFromJson(json);
}

/// Request model for creating a transaction
@freezed
sealed class CreateTransRequest with _$CreateTransRequest {
  const factory CreateTransRequest({
   required TransactionType transactionType,
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamicNullable)
    int? supplierId,
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamicNullable)
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
      if ((transactionType == TransactionType.purchase || transactionType == TransactionType.imported) && supplierId == null) {
        return 'Supplier is required for ${transactionType.name} transactions';
      }
    }

    if (items.isEmpty) {
      return 'At least one item is required';
    }

    // Validate items and batches
    for (var item in items) {
      if (item.batches.isEmpty) {
        return 'Each item must have at least one batch';
      }
      for (var batch in item.batches) {
        if (batch.batchNumber.isEmpty) {
          return 'Batch number is required';
        }
        if (batch.quantity <= 0) {
          return 'Batch quantity must be greater than 0';
        }
        if (batch.costPrice != null && batch.costPrice! < 0) {
          return 'Batch cost price cannot be negative';
        }
        if (batch.unitPrice != null && batch.unitPrice! < 0) {
          return 'Batch unit price cannot be negative';
        }
        if (batch.costPrice != null && batch.unitPrice != null && batch.unitPrice! < batch.costPrice!) {
          return 'Batch unit price must be greater than or equal to cost price';
        }
        // Sale requires unit price per batch; purchase/import require cost price
        if (transactionType == TransactionType.sale && (batch.unitPrice == null || batch.unitPrice! <= 0)) {
          return 'Unit price is required for sale batches';
        }
        if ((transactionType == TransactionType.purchase || transactionType == TransactionType.imported) &&
            (batch.costPrice == null || batch.costPrice! < 0)) {
          return 'Cost price is required for purchase/import batches';
        }
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
