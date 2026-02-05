import 'package:flutter/material.dart';

/// Brand colors for the application
/// 
/// All brand colors are defined in one centralized location.
/// Use these colors directly or through the theme system.
class BrandColors {
  BrandColors._();

  // ============================================================================
  // PRIMARY BRAND COLORS
  // ============================================================================
  
  static const Color primary = Color(0xFF026BFF);
  static const Color primaryLight = Color(0xFF4A9EFF);
  
  // ============================================================================
  // SECONDARY BRAND COLORS
  // ============================================================================
  
  static const Color secondary = Color(0xFF6C5CE7);
  
  // ============================================================================
  // SEMANTIC COLORS
  // ============================================================================
  
  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF3B82F6);
  //white
  
  
  // ============================================================================
  // TEXT COLORS
  // ============================================================================
  
  static const Color textPrimary = Color(0xFF1F2937);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textLight = Colors.white;
  static const Color textMuted = Color(0xFF9CA3AF);
  static const Color textDisabled = Color(0xFFD1D5DB);
  
  // ============================================================================
  // BACKGROUND COLORS
  // ============================================================================
  
  static const Color backgroundLight = Color(0xFFFFF9ED);
  static const Color background = Colors.white;
  static const Color surfaceLight = Color(0xFFFFFBFE);
  static const Color cardBackground = Colors.white;
  
  // ============================================================================
  // FORM / INPUT COLORS
  // ============================================================================
  
  static const Color inputBorder = Color(0xFFE5E7EB);
  static const Color inputBorderFocused = primary;
  static const Color inputBackground = Color(0xFFF9FAFB);
  static const Color inputText = textPrimary;
  static const Color inputPlaceholder = textSecondary;
  static const Color inputErrorBorder = error;
  
  // ============================================================================
  // UI ELEMENT COLORS
  // ============================================================================
  
  static const Color divider = Color(0xFFE5E7EB);
  static const Color outline = Color(0xFFE5E7EB);
  static const Color surfaceVariant = Color(0xFFF3F4F6);
  static const Color surfaceContainerHighest = Color(0xFFE5E7EB);
  static const Color onError = Colors.white;
  static const Color shadow = Color(0x1A000000);
  static const Color overlay = Color(0x80000000);
  static const Color overlaySolid = Color(0xFF000000);
  static const Color border = Color(0xFFE5E7EB);
  static const Color transparent = Color(0x00000000);
  
  // ============================================================================
  // BUTTON COLORS
  // ============================================================================
  
  static const Color buttonPrimary = primary;
  static const Color buttonSecondary = Color(0xFFF3F4F6);
  static const Color buttonDisabled = Color(0xFFD1D5DB);
  static const Color buttonText = Colors.white;
  static const Color buttonTextSecondary = textPrimary;
  
  // ============================================================================
  // MOVEMENT TYPE COLORS
  // ============================================================================
  
  static const Color purchase = Color(0xFF3B82F6);  // Blue
  static const Color sale = Color(0xFF10B981);      // Green
  static const Color transfer = Color(0xFFF59E0B); // Orange
  static const Color adjustment = Color(0xFF8B5CF6); // Purple
  static const Color returnColor = Color(0xFF14B8A6); // Teal

  // ============================================================================
  // DASHBOARD CARD COLORS
  // ============================================================================
  
  static const Color cardSales = Color(0xFFFE9F43);         // Orange - Total Sales
  static const Color cardSalesReturn = Color(0xFF092C4C);   // Dark Blue - Total Sales Return
  static const Color cardPurchase = Color(0xFF0F9385);      // Teal - Total Purchase
  static const Color cardPurchaseReturn = Color(0xFF165EF0); // Blue - Total Purchase Return

  // ============================================================================
  // ALERT / BANNER COLORS
  // ============================================================================

  static const Color alertBackground = Color(0xFFFFF4E6);
  static const Color alertBorder = Color(0xFFFFE5CC);
  static const Color alertIcon = Color(0xFFFF6B35);

  // ============================================================================
  // SEMANTIC SURFACE COLORS (light backgrounds for icons/badges)
  // ============================================================================

  static const Color errorBackgroundLight = Color(0xFFFEE2E2);
  static const Color successBackgroundLight = Color(0xFFD1FAE5);
  static const Color warningBackgroundLight = Color(0xFFFFF4E6);
  static const Color primaryBackgroundLight = Color(0xFFE0F2FE);
  static const Color secondaryBackgroundLight = Color(0xFFFCE7F3); // pink tint for top selling
  static const Color primaryContainer = Color(0xFFE0F2FE);
  static const Color onPrimaryContainer = Color(0xFF001D35);
  static const Color secondaryContainer = Color(0xFFF3E5F5);
  static const Color onSecondaryContainer = Color(0xFF2D1229);
  static const Color surface = Color(0xFFFFFFFF);

  // ============================================================================
  // CHART COLORS (bar/line charts)
  // ============================================================================

  static const Color chartPurchaseBar = Color(0xFFFFD4B2);
  static const Color chartSalesBar = Color(0xFFFFAB76);
  static const Color chartRevenueBar = Color(0xFF14B8A6);
  static const Color chartExpenseBar = Color(0xFFF97316);

  // ============================================================================
  // GRADIENT DEFINITIONS
  // ============================================================================
  
  /// Primary gradient (from primary to secondary)
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      primary,
      secondary,
    ],
  );
  
  /// Background gradient (subtle)
  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      backgroundLight,
      background,
    ],
  );
  
  
  // ============================================================================
  // HELPER METHODS
  // ============================================================================
  
  /// Get primary color with opacity
  static Color primaryWithOpacity(double opacity) {
    return primary.withOpacity(opacity);
  }
  
  /// Get secondary color with opacity
  static Color secondaryWithOpacity(double opacity) {
    return secondary.withOpacity(opacity);
  }
  
  /// Get error color with opacity
  static Color errorWithOpacity(double opacity) {
    return error.withOpacity(opacity);
  }
  
  /// Get success color with opacity
  static Color successWithOpacity(double opacity) {
    return success.withOpacity(opacity);
  }
}

