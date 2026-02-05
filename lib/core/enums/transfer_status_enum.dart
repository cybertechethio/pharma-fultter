import 'package:flutter/material.dart';
import '../../app/theme/brand_colors.dart';

/// Transfer Status enum
/// Represents the lifecycle states of a transfer
enum TransferStatus {
  pending,
  inTransit,
  completed,
  cancelled,
  rejected,
}

extension TransferStatusExtension on TransferStatus {
  /// Get TransferStatus from string value
  static TransferStatus fromString(String value) {
    switch (value.toLowerCase()) {
      case 'pending':
        return TransferStatus.pending;
      case 'in_transit':
        return TransferStatus.inTransit;
      case 'completed':
        return TransferStatus.completed;
      case 'cancelled':
        return TransferStatus.cancelled;
      case 'rejected':
        return TransferStatus.rejected;
      default:
        return TransferStatus.pending; // Default fallback
    }
  }

  /// Convert TransferStatus to string value for API
  String toApiString() {
    switch (this) {
      case TransferStatus.pending:
        return 'pending';
      case TransferStatus.inTransit:
        return 'in_transit';
      case TransferStatus.completed:
        return 'completed';
      case TransferStatus.cancelled:
        return 'cancelled';
      case TransferStatus.rejected:
        return 'rejected';
    }
  }

  /// Get display label for UI
  String getDisplayLabel() {
    switch (this) {
      case TransferStatus.pending:
        return 'Pending';
      case TransferStatus.inTransit:
        return 'In Transit';
      case TransferStatus.completed:
        return 'Completed';
      case TransferStatus.cancelled:
        return 'Cancelled';
      case TransferStatus.rejected:
        return 'Rejected';
    }
  }

  /// Get icon for status
  IconData getIcon() {
    switch (this) {
      case TransferStatus.pending:
        return Icons.hourglass_empty;
      case TransferStatus.inTransit:
        return Icons.local_shipping;
      case TransferStatus.completed:
        return Icons.check_circle_outline;
      case TransferStatus.cancelled:
        return Icons.cancel_outlined;
      case TransferStatus.rejected:
        return Icons.block_outlined;
    }
  }

  /// Get color for status
  Color getColor() {
    switch (this) {
      case TransferStatus.pending:
        return BrandColors.warning;
      case TransferStatus.inTransit:
        return BrandColors.info;
      case TransferStatus.completed:
        return BrandColors.success;
      case TransferStatus.cancelled:
        return BrandColors.error;
      case TransferStatus.rejected:
        return BrandColors.error;
    }
  }

  /// Check if status is terminal (no further actions)
  bool isTerminal() {
    return this == TransferStatus.completed || 
           this == TransferStatus.cancelled || 
           this == TransferStatus.rejected;
  }
}

