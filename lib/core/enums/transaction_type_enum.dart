import 'package:flutter/material.dart';
import '../../app/theme/brand_colors.dart';

enum TransactionType {
  purchase,
  sale,
  using,
  adjustment,
  waste,
  damage,
  producing,
  reverse,
}

extension TransactionTypeExtension on TransactionType {

  
  /// Get TransactionType from string value
  static TransactionType fromString(String value) {
    switch (value.toLowerCase()) {
      case 'purchase':
        return TransactionType.purchase;
      case 'sale':
        return TransactionType.sale;
      case 'using':
        return TransactionType.using;
      case 'adjustment':
        return TransactionType.adjustment;
      case 'waste':
        return TransactionType.waste;
      case 'damage':
        return TransactionType.damage;
      case 'producing':
        return TransactionType.producing;
      case 'reverse':
        return TransactionType.reverse;
      default:
        return TransactionType.sale; // Default fallback
    }
  }

 

  /// Check if transaction type requires customer/supplier
  bool requiresCustomerOrSupplier() {
    return this == TransactionType.purchase || 
           this == TransactionType.sale;
  }

  /// Check if transaction type requires payment methods
  bool requiresPaymentMethods() {
    return this == TransactionType.purchase || this == TransactionType.sale;
  }

  /// Check if transaction type requires receipts
  bool requiresReceipts() {
    return this == TransactionType.purchase || this == TransactionType.sale;
  }


  /// Check if this transaction type is a reversal type
  bool isReversalType() {
    return this == TransactionType.purchase ||
        this == TransactionType.sale;
  }

  /// Check if this transaction type can be reversed
  bool canBeReversed() {
    return this == TransactionType.purchase || this == TransactionType.sale;
  }


  /// Get display label for transaction type
  String getDisplayLabel() {
    switch (this) {
      case TransactionType.purchase:
        return 'Purchase';
      case TransactionType.sale:
        return 'Sale';
      case TransactionType.using:
        return 'Using';
      case TransactionType.adjustment:
        return 'Adjustment';
      case TransactionType.waste:
        return 'Waste';
      case TransactionType.damage:
        return 'Damage';
      case TransactionType.producing:
        return 'Producing';
      case TransactionType.reverse:
        return 'Reverse';
    }
  }

  /// Get color for transaction type badge
  /// Returns Material color for UI display
  Color getColor() {
    switch (this) {
      case TransactionType.purchase:
        return BrandColors.info;
      case TransactionType.sale:
        return BrandColors.success;
      case TransactionType.using:
        return BrandColors.transfer;
      case TransactionType.adjustment:
        return BrandColors.textMuted;
      case TransactionType.waste:
        return BrandColors.error;
      case TransactionType.damage:
        return BrandColors.error;
      case TransactionType.producing:
        return BrandColors.returnColor;
      case TransactionType.reverse:
        return BrandColors.warning;
    }
  }

  /// Get icon for transaction type
  IconData getIcon() {
    switch (this) {
      case TransactionType.purchase:
        return Icons.shopping_cart_rounded;
      case TransactionType.sale:
        return Icons.point_of_sale_rounded;
      case TransactionType.using:
        return Icons.outbox_rounded;
      case TransactionType.adjustment:
        return Icons.tune_rounded;
      case TransactionType.waste:
        return Icons.delete_rounded;
      case TransactionType.damage:
        return Icons.error_outline_rounded;
      case TransactionType.producing:
        return Icons.factory_rounded;
      case TransactionType.reverse:
        return Icons.undo_rounded;
    }
  }
}

