import 'package:flutter/material.dart';
import '../../app/theme/brand_colors.dart';

enum TransferType {
  transferOut,
  transferIn,
  transferInReturn,
  transferOutReturn,
}

extension TransferTypeExtension on TransferType {
  /// Get TransferType from string value
  static TransferType fromString(String value) {
    switch (value.toLowerCase()) {
      case 'transfer_out':
        return TransferType.transferOut;
      case 'transfer_in':
        return TransferType.transferIn;
      case 'transfer_in_return':
        return TransferType.transferInReturn;
      case 'transfer_out_return':
        return TransferType.transferOutReturn;
      default:
        return TransferType.transferOut; // Default fallback
    }
  }

  /// Convert TransferType to string value for API
  String toApiString() {
    switch (this) {
      case TransferType.transferOut:
        return 'transfer_out';
      case TransferType.transferIn:
        return 'transfer_in';
      case TransferType.transferInReturn:
        return 'transfer_in_return';
      case TransferType.transferOutReturn:
        return 'transfer_out_return';
    }
  }

  /// Get display label for transfer type
  String getDisplayLabel() {
    switch (this) {
      case TransferType.transferOut:
        return 'OUT';
      case TransferType.transferIn:
        return 'IN';
      case TransferType.transferInReturn:
        return 'IN RETURN';
      case TransferType.transferOutReturn:
        return 'OUT RETURN';
    }
  }

  /// Get color for transfer type badge
  /// Returns Material color for UI display
  Color getColor() {
    switch (this) {
      case TransferType.transferOut:
        return BrandColors.info;
      case TransferType.transferIn:
        return BrandColors.success;
      case TransferType.transferInReturn:
        return BrandColors.warning;
      case TransferType.transferOutReturn:
        return BrandColors.error;
    }
  }
}

/// Extension for String to convert to TransferType
extension StringToTransferTypeExtension on String {
  /// Get TransferType from string value
  TransferType toTransferType() {
    return TransferTypeExtension.fromString(this);
  }
}

/// Extension for transfer status string helpers
extension TransferStatusHelper on String {
  /// Get color for transfer status badge
  /// Returns Material color for UI display
  Color getTransferStatusColor() {
    switch (toLowerCase()) {
      case 'completed':
        return BrandColors.success;
      case 'pending':
        return BrandColors.warning;
      case 'cancelled':
        return BrandColors.error;
      default:
        return BrandColors.textMuted;
    }
  }
}

