// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'payment_method_request.freezed.dart';
part 'payment_method_request.g.dart';

/// Request model for creating or updating a payment method
@freezed
sealed class PaymentMethodRequest with _$PaymentMethodRequest {
  const factory PaymentMethodRequest({
    required String method, // (M) for create, (O) for update
    double? amount, // (M) for create, (O) for update
    int? bankId, // (O)
    String? referenceNumber, // (O)
    String? attachment, // (O) - URL after upload
  }) = _PaymentMethodRequest;

  factory PaymentMethodRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodRequestFromJson(json);
}

/// Extension methods for PaymentMethodRequest
extension PaymentMethodRequestX on PaymentMethodRequest {
  /// Validate payment method request
  String? validate({bool isUpdate = false}) {
    if (!isUpdate) {
      // Create validation
      if (method.isEmpty) {
        return 'Payment method type is required';
      }
      if (amount == null || amount! <= 0) {
        return 'Amount must be greater than 0';
      }
    } else {
      // Update validation - at least one field should be provided
      if (method.isEmpty && amount == null && bankId == null && 
          referenceNumber == null && attachment == null) {
        return 'At least one field must be provided for update';
      }
      if (amount != null && amount! <= 0) {
        return 'Amount must be greater than 0';
      }
    }
    return null;
  }

}

