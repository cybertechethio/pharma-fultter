enum PaymentMethodType {
  cash,
  telebirr,
  mPesa,
  bankTransfer,
  check,
  other,
}

extension PaymentMethodTypeExtension on PaymentMethodType {
  /// Get PaymentMethodType from string value
  static PaymentMethodType fromString(String value) {
    switch (value.toLowerCase()) {
      case 'cash':
        return PaymentMethodType.cash;
      case 'telebirr':
        return PaymentMethodType.telebirr;
      case 'm_pesa':
      case 'mpesa':
        return PaymentMethodType.mPesa;
      case 'bank_transfer':
      case 'banktransfer':
        return PaymentMethodType.bankTransfer;
      case 'check':
        return PaymentMethodType.check;
      case 'other':
        return PaymentMethodType.other;
      default:
        return PaymentMethodType.cash; // Default fallback
    }
  }

  /// Convert PaymentMethodType to string value for API
  String toApiString() {
    switch (this) {
      case PaymentMethodType.cash:
        return 'cash';
      case PaymentMethodType.telebirr:
        return 'telebirr';
      case PaymentMethodType.mPesa:
        return 'm_pesa';
      case PaymentMethodType.bankTransfer:
        return 'bank_transfer';
      case PaymentMethodType.check:
        return 'check';
      case PaymentMethodType.other:
        return 'other';
    }
  }

  /// Check if payment method requires bank selection
  bool requiresBank() {
    return this == PaymentMethodType.bankTransfer;
  }

  /// Check if payment method requires reference number
  bool requiresReferenceNumber() {
    return this == PaymentMethodType.telebirr ||
        this == PaymentMethodType.mPesa ||
        this == PaymentMethodType.bankTransfer ||
        this == PaymentMethodType.check;
  }

  /// Get display label for UI
  String getDisplayLabel() {
    switch (this) {
      case PaymentMethodType.cash:
        return 'Cash';
      case PaymentMethodType.telebirr:
        return 'Telebirr';
      case PaymentMethodType.mPesa:
        return 'M-Pesa';
      case PaymentMethodType.bankTransfer:
        return 'Bank Transfer';
      case PaymentMethodType.check:
        return 'Check';
      case PaymentMethodType.other:
        return 'Other';
    }
  }
}

