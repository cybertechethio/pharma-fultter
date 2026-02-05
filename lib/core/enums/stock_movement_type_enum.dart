import 'package:flutter/material.dart';
import '../../app/theme/brand_colors.dart';

enum StockMovementType {
  purchase,
  sale,
  transferIn,
  transferInReturn,
  transferOut,
  transferOutReturn,
  using,
  adjustment,
  waste,
  damage,
  purchaseReverse,
  saleReverse,
  producing,
}

extension StockMovementTypeExtension on StockMovementType {
  /// Get StockMovementType from string value
  static StockMovementType fromString(String value) {
    switch (value.toLowerCase().replaceAll('_', '')) {
      case 'purchase':
        return StockMovementType.purchase;
      case 'sale':
        return StockMovementType.sale;
      case 'transferin':
        return StockMovementType.transferIn;
      case 'transferinreturn':
        return StockMovementType.transferInReturn;
      case 'transferout':
        return StockMovementType.transferOut;
      case 'transferoutreturn':
        return StockMovementType.transferOutReturn;
      case 'using':
        return StockMovementType.using;
      case 'adjustment':
        return StockMovementType.adjustment;
      case 'waste':
        return StockMovementType.waste;
      case 'damage':
        return StockMovementType.damage;
      case 'purchasereverse':
        return StockMovementType.purchaseReverse;
      case 'salereverse':
        return StockMovementType.saleReverse;
      case 'producing':
        return StockMovementType.producing;
      default:
        return StockMovementType.adjustment; // Default fallback
    }
  }

  /// Get display label for stock movement type
  String getDisplayLabel() {
    switch (this) {
      case StockMovementType.purchase:
        return 'Purchase';
      case StockMovementType.sale:
        return 'Sale';
      case StockMovementType.transferIn:
        return 'Transfer In';
      case StockMovementType.transferInReturn:
        return 'Transfer In Return';
      case StockMovementType.transferOut:
        return 'Transfer Out';
      case StockMovementType.transferOutReturn:
        return 'Transfer Out Return';
      case StockMovementType.using:
        return 'Using';
      case StockMovementType.adjustment:
        return 'Adjustment';
      case StockMovementType.waste:
        return 'Waste';
      case StockMovementType.damage:
        return 'Damage';
      case StockMovementType.purchaseReverse:
        return 'Purchase Reverse';
      case StockMovementType.saleReverse:
        return 'Sale Reverse';
      case StockMovementType.producing:
        return 'Producing';
    }
  }

  /// Get color for stock movement type badge
  Color getColor() {
    switch (this) {
      case StockMovementType.purchase:
        return BrandColors.info;
      case StockMovementType.sale:
        return BrandColors.success;
      case StockMovementType.transferIn:
        return BrandColors.transfer;
      case StockMovementType.transferInReturn:
        return BrandColors.warning;
      case StockMovementType.transferOut:
        return BrandColors.transfer;
      case StockMovementType.transferOutReturn:
        return BrandColors.warning;
      case StockMovementType.using:
        return BrandColors.secondary;
      case StockMovementType.adjustment:
        return BrandColors.adjustment;
      case StockMovementType.waste:
        return BrandColors.error;
      case StockMovementType.damage:
        return BrandColors.error;
      case StockMovementType.purchaseReverse:
        return BrandColors.warning;
      case StockMovementType.saleReverse:
        return BrandColors.warning;
      case StockMovementType.producing:
        return BrandColors.returnColor;
    }
  }

  /// Get icon for stock movement type
  IconData getIcon() {
    switch (this) {
      case StockMovementType.purchase:
        return Icons.shopping_cart_rounded;
      case StockMovementType.sale:
        return Icons.point_of_sale_rounded;
      case StockMovementType.transferIn:
        return Icons.move_to_inbox_rounded;
      case StockMovementType.transferInReturn:
        return Icons.keyboard_return_rounded;
      case StockMovementType.transferOut:
        return Icons.outbox_rounded;
      case StockMovementType.transferOutReturn:
        return Icons.keyboard_return_rounded;
      case StockMovementType.using:
        return Icons.inventory_2_rounded;
      case StockMovementType.adjustment:
        return Icons.tune_rounded;
      case StockMovementType.waste:
        return Icons.delete_rounded;
      case StockMovementType.damage:
        return Icons.error_outline_rounded;
      case StockMovementType.purchaseReverse:
        return Icons.undo_rounded;
      case StockMovementType.saleReverse:
        return Icons.undo_rounded;
      case StockMovementType.producing:
        return Icons.factory_rounded;
    }
  }

  /// Check if this is an inbound movement (increases stock)
  bool isInbound() {
    return this == StockMovementType.purchase ||
        this == StockMovementType.transferIn ||
        this == StockMovementType.transferOutReturn ||
        this == StockMovementType.saleReverse ||
        this == StockMovementType.producing;
  }

  /// Check if this is an outbound movement (decreases stock)
  bool isOutbound() {
    return this == StockMovementType.sale ||
        this == StockMovementType.transferOut ||
        this == StockMovementType.transferInReturn ||
        this == StockMovementType.purchaseReverse ||
        this == StockMovementType.using ||
        this == StockMovementType.waste ||
        this == StockMovementType.damage;
  }

  /// Check if this is a transfer type
  bool isTransfer() {
    return this == StockMovementType.transferIn ||
        this == StockMovementType.transferInReturn ||
        this == StockMovementType.transferOut ||
        this == StockMovementType.transferOutReturn;
  }

  /// Check if this is a reverse type
  bool isReverse() {
    return this == StockMovementType.purchaseReverse ||
        this == StockMovementType.saleReverse;
  }
}

