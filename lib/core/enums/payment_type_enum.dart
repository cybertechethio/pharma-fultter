/// Payment type enum for transaction payments
enum PaymentType {
  payment,
  refund,
}

extension PaymentTypeExtension on PaymentType {
  /// Get PaymentType from string value
  static PaymentType fromString(String value) {
    switch (value.toLowerCase()) {
      case 'payment':
        return PaymentType.payment;
      case 'refund':
        return PaymentType.refund;
      default:
        return PaymentType.payment; // Default fallback
    }
  }

  /// Convert PaymentType to string value for API
  String toApiString() {
    switch (this) {
      case PaymentType.payment:
        return 'payment';
      case PaymentType.refund:
        return 'refund';
    }
  }

  /// Get display label for payment type
  String getDisplayLabel() {
    switch (this) {
      case PaymentType.payment:
        return 'Payment';
      case PaymentType.refund:
        return 'Refund';
    }
  }
}

