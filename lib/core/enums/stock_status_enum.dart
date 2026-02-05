import 'package:flutter/material.dart';

import '../../app/theme/brand_colors.dart';

enum StockStatus {
  inactive,
  critical,
  ignored,
  newStatus, // 'new' is a reserved keyword in Dart, so using newStatus
}

extension StockStatusExtension on StockStatus {
  /// Parse status from string
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
        return StockStatus.newStatus;
    }
  }

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
}

