import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/enums/transaction_type_enum.dart';
import '../../../../core/enums/payment_method_type_enum.dart';
import 'transaction_item.dart';
import 'transaction_payment.dart';

part 'transaction_data.freezed.dart';

@freezed
sealed class TransactionData with _$TransactionData {
  const factory TransactionData({
    required TransactionType transactionType,
    int? supplierId,
    int? customerId,
    String? notes,
    required List<TransactionItem> items,
    List<TransactionPayment>? paymentMethods,
  }) = _TransactionData;
}

/// Extension methods for TransactionData
extension TransactionDataX on TransactionData {
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
      if (item.batches.isEmpty) {
        return 'Each item must have at least one batch';
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
  String? _validatePaymentMethod(TransactionPayment payment) {
    if (payment.method.requiresBank() && payment.bankId == null) {
      return 'Bank selection is required for bank transfer';
    }
    // Reference number is optional - no validation needed
    if (payment.amount <= 0) {
      return 'Amount must be greater than 0';
    }
    return null;
  }
}

