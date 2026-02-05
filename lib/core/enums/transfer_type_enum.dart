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

  /// Get icon for transfer type
  IconData getIcon() {
    switch (this) {
      case TransferType.transferOut:
        return Icons.outbox_rounded;
      case TransferType.transferIn:
        return Icons.inbox_rounded;
      case TransferType.transferInReturn:
        return Icons.keyboard_return_rounded;
      case TransferType.transferOutReturn:
        return Icons.undo_rounded;
    }
  }
}

