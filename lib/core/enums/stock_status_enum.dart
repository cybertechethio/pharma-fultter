import 'package:flutter/material.dart';
import '../../app/theme/brand_colors.dart';

enum StockStatus {
  inactive,
  critical,
  ignored,
  newStatus, // 'new' is a reserved keyword in Dart, so using newStatus
}

extension StockStatusExtension on StockStatus {
  /// Get StockStatus from string value
  static StockStatus fromString(String value) {
    switch (value.toLowerCase()) {
      case 'inactive':
        return StockStatus.inactive;
      case 'critical':
        return StockStatus.critical;
      case 'ignored':
        return StockStatus.ignored;
      case 'new':
        return StockStatus.newStatus;
      default:
        return StockStatus.newStatus; // Default fallback
    }
  }

  /// Convert StockStatus to string value for API
  String toApiString() {
    switch (this) {
      case StockStatus.inactive:
        return 'inactive';
      case StockStatus.critical:
        return 'critical';
      case StockStatus.ignored:
        return 'ignored';
      case StockStatus.newStatus:
        return 'new';
    }
  }

  /// Get color for stock status
  Color getColor() {
    switch (this) {
      case StockStatus.critical:
        return BrandColors.error;
      case StockStatus.inactive:
        return BrandColors.textMuted;
      case StockStatus.ignored:
        return BrandColors.warning;
      case StockStatus.newStatus:
        return BrandColors.success;
    }
  }

  /// Get display text for stock status
  String getDisplayText() {
    switch (this) {
      case StockStatus.critical:
        return 'Critical';
      case StockStatus.inactive:
        return 'Inactive';
      case StockStatus.ignored:
        return 'Ignored';
      case StockStatus.newStatus:
        return 'New';
    }
  }

  /// Get icon for stock status
  IconData getIcon() {
    switch (this) {
      case StockStatus.critical:
        return Icons.error_outline;
      case StockStatus.inactive:
        return Icons.cancel;
      case StockStatus.ignored:
        return Icons.warning_amber_rounded;
      case StockStatus.newStatus:
        return Icons.check_circle;
    }
  }
}

