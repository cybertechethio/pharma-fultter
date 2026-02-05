import 'package:flutter/material.dart';
import '../../app/theme/brand_colors.dart';

enum StockMovementStatus {
  completed,
  reversed,
}

extension StockMovementStatusExtension on StockMovementStatus {
  /// Parse status from string
  static StockMovementStatus fromString(String value) {
    switch (value.toLowerCase()) {
      case 'reversed':
        return StockMovementStatus.reversed;
      case 'completed':
      default:
        return StockMovementStatus.completed;
    }
  }

  /// Get color for stock movement status
  Color getColor() {
    switch (this) {
      case StockMovementStatus.completed:
        return BrandColors.success;
      case StockMovementStatus.reversed:
        return BrandColors.warning;
    }
  }

  /// Get icon for stock movement status
  IconData getIcon() {
    switch (this) {
      case StockMovementStatus.completed:
        return Icons.check_circle_outline;
      case StockMovementStatus.reversed:
        return Icons.undo_outlined;
    }
  }

  /// Get display text for stock movement status
  String getDisplayText() {
    switch (this) {
      case StockMovementStatus.completed:
        return 'Completed';
      case StockMovementStatus.reversed:
        return 'Reversed';
    }
  }
}

