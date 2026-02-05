// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'supplier_customer_payment_request.freezed.dart';
part 'supplier_customer_payment_request.g.dart';

/// Request model for payment method
@freezed
sealed class PaymentMethodRequest with _$PaymentMethodRequest {
  const factory PaymentMethodRequest({
    required String method,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double amount,
    int? bankId,
    String? referenceNumber,
    String? attachment,
  }) = _PaymentMethodRequest;

  factory PaymentMethodRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodRequestFromJson(json);
}

/// Unified request model for add-balance and refund payments
/// - For add-balance (customer): customerId required
/// - For add-balance (supplier): supplierId required
/// - For refund: customerId/supplierId required
@freezed
sealed class SupplierCustomerPaymentRequest with _$SupplierCustomerPaymentRequest {
  const factory SupplierCustomerPaymentRequest({
    /// Required for add-balance (customer), optional for refund
    int? customerId,
    /// Required for add-balance (supplier), optional for refund
    int? supplierId,
    String? notes,
    required List<PaymentMethodRequest> paymentMethods,
  }) = _SupplierCustomerPaymentRequest;

  factory SupplierCustomerPaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$SupplierCustomerPaymentRequestFromJson(json);
}

