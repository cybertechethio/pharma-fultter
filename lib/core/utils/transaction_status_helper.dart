import 'package:flutter/material.dart';
import '../../app/theme/brand_colors.dart';

/// Extension for transaction status string helpers
extension TransactionStatusHelper on String {
  /// Get color for transaction status badge
  /// Returns Material color for UI display
  Color getTransactionStatusColor() {
    switch (toLowerCase()) {
      case 'completed':
        return BrandColors.success;
      case 'pending':
        return BrandColors.warning;
      case 'reversed':
        return BrandColors.error;
      case 'cancelled':
        return BrandColors.error;
      case 'processing':
        return BrandColors.info;
      default:
        return BrandColors.textMuted;
    }
  }

  /// Get icon for transaction status
  /// Returns Material outlined icon for UI display (simple, unfilled)
  IconData getTransactionStatusIcon() {
    switch (toLowerCase()) {
      case 'completed':
        return Icons.check_circle_outline;
      case 'pending':
        return Icons.pending_outlined;
      case 'reversed':
        return Icons.undo_outlined;
      case 'cancelled':
        return Icons.cancel_outlined;
      case 'processing':
        return Icons.sync_outlined;
      default:
        return Icons.help_outline;
    }
  }
}

