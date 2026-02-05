import 'package:flutter/material.dart';
import '../../app/theme/brand_colors.dart';

enum UserType {
  admin,
  manager,
  cashier,
  storekeeper,
  supervisor,
  standard,
}

extension UserTypeExtension on UserType {
  /// Get UserType from string value
  static UserType fromString(String value) {
    switch (value.toUpperCase()) {
      case 'ADMIN':
        return UserType.admin;
      case 'MANAGER':
        return UserType.manager;
      case 'CASHIER':
        return UserType.cashier;
      case 'STOREKEEPER':
        return UserType.storekeeper;
      case 'SUPERVISOR':
        return UserType.supervisor;
      case 'STANDARD':
        return UserType.standard;
      default:
        return UserType.standard; // Default fallback
    }
  }

  /// Convert UserType to string value (for API)
  String toApiString() {
    switch (this) {
      case UserType.admin:
        return 'ADMIN';
      case UserType.manager:
        return 'MANAGER';
      case UserType.cashier:
        return 'CASHIER';
      case UserType.storekeeper:
        return 'STOREKEEPER';
      case UserType.supervisor:
        return 'SUPERVISOR';
      case UserType.standard:
        return 'STANDARD';
    }
  }

  /// Get display label for user type
  String getDisplayLabel() {
    switch (this) {
      case UserType.admin:
        return 'Admin';
      case UserType.manager:
        return 'Manager';
      case UserType.cashier:
        return 'Cashier';
      case UserType.storekeeper:
        return 'Storekeeper';
      case UserType.supervisor:
        return 'Supervisor';
      case UserType.standard:
        return 'Standard';
    }
  }

  /// Get color for user type badge
  /// Returns Material color for UI display
  Color getColor() {
    switch (this) {
      case UserType.admin:
        return BrandColors.error;
      case UserType.manager:
        return BrandColors.warning;
      case UserType.cashier:
        return BrandColors.success;
      case UserType.storekeeper:
        return BrandColors.info;
      case UserType.supervisor:
        return BrandColors.secondary;
      case UserType.standard:
        return BrandColors.textMuted;
    }
  }

  /// Get icon for user type
  IconData getIcon() {
    switch (this) {
      case UserType.admin:
        return Icons.admin_panel_settings_rounded;
      case UserType.manager:
        return Icons.manage_accounts_rounded;
      case UserType.cashier:
        return Icons.point_of_sale_rounded;
      case UserType.storekeeper:
        return Icons.inventory_2_rounded;
      case UserType.supervisor:
        return Icons.supervisor_account_rounded;
      case UserType.standard:
        return Icons.person_rounded;
    }
  }

  /// Check if user type has admin privileges
  bool isAdmin() {
    return this == UserType.admin;
  }

  /// Check if user type has management privileges
  bool isManager() {
    return this == UserType.admin || this == UserType.manager;
  }

  /// Check if user type can access cashier functions
  bool canAccessCashier() {
    return this == UserType.admin ||
        this == UserType.manager ||
        this == UserType.cashier;
  }

  /// Check if user type can access inventory functions
  bool canAccessInventory() {
    return this == UserType.admin ||
        this == UserType.manager ||
        this == UserType.storekeeper;
  }
}

