import 'package:flutter/material.dart';

import '../../app/theme/brand_colors.dart';

enum TransactionStatus {
  completed,
  reversed,
}

extension TransactionStatusExtension on TransactionStatus {
  /// Parse status from string
  static TransactionStatus fromString(String value) {
    switch (value.toLowerCase()) {
      case 'reversed':
        return TransactionStatus.reversed;
      case 'completed':
      default:
        return TransactionStatus.completed;
    }
  }

  Color getColor() {
    switch (this) {
      case TransactionStatus.completed:
        return BrandColors.success;
      case TransactionStatus.reversed:
        return BrandColors.warning;
    }
  }

  IconData getIcon() {
    switch (this) {
      case TransactionStatus.completed:
        return Icons.check_circle_outline;
      case TransactionStatus.reversed:
        return Icons.undo_outlined;
    }
  }

  String getDisplayText() {
    switch (this) {
      case TransactionStatus.completed:
        return 'Completed';
      case TransactionStatus.reversed:
        return 'Reversed';
    }
  }

   
}