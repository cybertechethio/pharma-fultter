import 'package:flutter/material.dart';
import '../../app/theme/brand_colors.dart';

enum TransactionType {
  purchase,
  imported,
  sale,
  adjustment,
  waste,
  damage,
}

extension TransactionTypeExtension on TransactionType {

  
  /// Get TransactionType from string value
  static TransactionType fromString(String value) {
    switch (value.toLowerCase()) {
      case 'purchase':
        return TransactionType.purchase;
      case 'imported':
        return TransactionType.imported;
      case 'sale':
        return TransactionType.sale;
      case 'adjustment':
        return TransactionType.adjustment;
      case 'waste':
        return TransactionType.waste;
      case 'damage':
        return TransactionType.damage;
      default:
        return TransactionType.sale; // Default fallback
    }
  }

 

  /// Check if transaction type requires customer/supplier
  bool requiresCustomerOrSupplier() {
    return this == TransactionType.purchase ||
           this == TransactionType.imported ||
           this == TransactionType.sale;
  }

  /// Check if transaction type requires payment methods
  bool requiresPaymentMethods() {
    return this == TransactionType.purchase ||
           this == TransactionType.imported ||
           this == TransactionType.sale;
  }

  /// Check if transaction type requires receipts
  bool requiresReceipts() {
    return this == TransactionType.purchase ||
           this == TransactionType.imported ||
           this == TransactionType.sale;
  }



  /// Get display label for transaction type
  String getDisplayLabel() {
    switch (this) {
      case TransactionType.purchase:
        return 'Purchase';
      case TransactionType.imported:
        return 'Imported';
      case TransactionType.sale:
        return 'Sale';
      case TransactionType.adjustment:
        return 'Adjustment';
      case TransactionType.waste:
        return 'Waste';
      case TransactionType.damage:
        return 'Damage';
    }
  }

  /// Get color for transaction type badge
  /// Returns Material color for UI display
  Color getColor() {
    switch (this) {
      case TransactionType.purchase:
        return BrandColors.info;
      case TransactionType.imported:
        return BrandColors.transfer;
      case TransactionType.sale:
        return BrandColors.success;
      case TransactionType.adjustment:
        return BrandColors.textMuted;
      case TransactionType.waste:
        return BrandColors.error;
      case TransactionType.damage:
        return BrandColors.error;
    }
  }

  /// Get icon for transaction type
  IconData getIcon() {
    switch (this) {
      case TransactionType.purchase:
        return Icons.shopping_cart_rounded;
      case TransactionType.imported:
        return Icons.inventory_2_rounded;
      case TransactionType.sale:
        return Icons.point_of_sale_rounded;
      case TransactionType.adjustment:
        return Icons.tune_rounded;
      case TransactionType.waste:
        return Icons.delete_rounded;
      case TransactionType.damage:
        return Icons.error_outline_rounded;
    }
  }
}

