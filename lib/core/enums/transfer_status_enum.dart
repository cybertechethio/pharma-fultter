import 'package:flutter/material.dart';
import '../../app/theme/brand_colors.dart';

/// Transfer Status enum
/// Represents the lifecycle states of a transfer
enum TransferStatus {
  pending,
  rejected,
  returned,
  completed,
}

extension TransferStatusExtension on TransferStatus {
  /// Get TransferStatus from string value
  static TransferStatus fromString(String value) {
    switch (value.toLowerCase()) {
      case 'pending':
        return TransferStatus.pending;
      case 'rejected':
        return TransferStatus.rejected;
      case 'returned':
        return TransferStatus.returned;
      case 'completed':
        return TransferStatus.completed;
      default:
        return TransferStatus.pending; // Default fallback
    }
  }

  /// Convert TransferStatus to string value for API
  String toApiString() {
    switch (this) {
      case TransferStatus.pending:
        return 'pending';
      case TransferStatus.rejected:
        return 'rejected';
      case TransferStatus.returned:
        return 'returned';
      case TransferStatus.completed:
        return 'completed';
    }
  }

  /// Get display label for UI
  String getDisplayLabel() {
    switch (this) {
      case TransferStatus.pending:
        return 'Pending';
      case TransferStatus.rejected:
        return 'Rejected';
      case TransferStatus.returned:
        return 'Returned';
      case TransferStatus.completed:
        return 'Completed';
    }
  }

  /// Get icon for status
  IconData getIcon() {
    switch (this) {
      case TransferStatus.pending:
        return Icons.hourglass_empty;
      case TransferStatus.rejected:
        return Icons.block_outlined;
      case TransferStatus.returned:
        return Icons.keyboard_return;
      case TransferStatus.completed:
        return Icons.check_circle_outline;
    }
  }

  /// Get color for status
  Color getColor() {
    switch (this) {
      case TransferStatus.pending:
        return BrandColors.warning;
      case TransferStatus.rejected:
        return BrandColors.error;
      case TransferStatus.returned:
        return BrandColors.info;
      case TransferStatus.completed:
        return BrandColors.success;
    }
  }

  /// Check if status is terminal (no further actions)
  bool isTerminal() {
    return this == TransferStatus.completed ||
        this == TransferStatus.rejected ||
        this == TransferStatus.returned;
  }
}

