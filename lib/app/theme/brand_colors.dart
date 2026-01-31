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
  static const Color shadow = Color(0x1A000000);
  static const Color overlay = Color(0x80000000);
  static const Color overlaySolid = Color(0xFF000000);
  static const Color border = Color(0xFFE5E7EB);
  
  // ============================================================================
  // BUTTON COLORS
  // ============================================================================
  
  static const Color buttonPrimary = primary;
  static const Color buttonSecondary = Color(0xFFF3F4F6);
  static const Color buttonDisabled = Color(0xFFD1D5DB);
  static const Color buttonText = Colors.white;
  static const Color buttonTextSecondary = textPrimary;
  
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

