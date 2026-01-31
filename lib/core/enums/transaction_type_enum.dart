import 'package:flutter/material.dart';
import '../../app/theme/brand_colors.dart';

enum TransactionType {
  purchase,
  sale,
  adjustment,
  purchaseReverse,
  saleReverse,
}

extension TransactionTypeExtension on TransactionType {
  /// Get TransactionType from string value
  static TransactionType fromString(String value) {
    switch (value.toLowerCase()) {
      case 'purchase':
        return TransactionType.purchase;
      case 'sale':
        return TransactionType.sale;
      case 'adjustment':
        return TransactionType.adjustment;
      case 'purchase_reverse':
        return TransactionType.purchaseReverse;
      case 'sale_reverse':
        return TransactionType.saleReverse;
      default:
        return TransactionType.purchase; // Default fallback
    }
  }

  /// Convert TransactionType to string value for API
  String toApiString() {
    switch (this) {
      case TransactionType.purchase:
        return 'purchase';
      case TransactionType.sale:
        return 'sale';
      case TransactionType.adjustment:
        return 'adjustment';
      case TransactionType.purchaseReverse:
        return 'purchase_reverse';
      case TransactionType.saleReverse:
        return 'sale_reverse';
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

  /// Check if transaction type allows batch creation
  bool allowsBatchCreation() {
    return this == TransactionType.purchase;
  }

  /// Check if this transaction type is a reversal type
  bool isReversalType() {
    return this == TransactionType.purchaseReverse ||
        this == TransactionType.saleReverse;
  }

  /// Check if this transaction type can be reversed
  bool canBeReversed() {
    return this == TransactionType.purchase || this == TransactionType.sale;
  }

  /// Get the reversal type for this transaction type
  TransactionType? getReversalType() {
    switch (this) {
      case TransactionType.purchase:
        return TransactionType.purchaseReverse;
      case TransactionType.sale:
        return TransactionType.saleReverse;
      default:
        return null;
    }
  }

  /// Get display label for transaction type
  String getDisplayLabel() {
    switch (this) {
      case TransactionType.purchase:
        return 'Purchase';
      case TransactionType.sale:
        return 'Sale';
      case TransactionType.adjustment:
        return 'Adjustment';
      case TransactionType.purchaseReverse:
        return 'Purchase Reverse';
      case TransactionType.saleReverse:
        return 'Sale Reverse';
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
      case TransactionType.adjustment:
        return BrandColors.textMuted;
      case TransactionType.purchaseReverse:
        return BrandColors.error;
      case TransactionType.saleReverse:
        return BrandColors.error;
    }
  }
}

