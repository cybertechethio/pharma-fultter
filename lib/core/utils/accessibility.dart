import 'package:flutter/material.dart';
import '../../app/theme/brand_colors.dart';

/// Accessibility utilities following WCAG 2.1 guidelines
class AccessibilityUtils {
  // WCAG 2.1 AA compliance - minimum contrast ratio 4.5:1
  static const double minContrastRatio = 4.5;
  
  // WCAG 2.1 AAA compliance - enhanced contrast ratio 7:1
  static const double enhancedContrastRatio = 7.0;
  
  /// Check if color combination meets WCAG AA accessibility standards
  static bool hasSufficientContrast(Color foreground, Color background) {
    return getContrastRatio(foreground, background) >= minContrastRatio;
  }
  
  /// Check if color combination meets WCAG AAA accessibility standards
  static bool hasEnhancedContrast(Color foreground, Color background) {
    return getContrastRatio(foreground, background) >= enhancedContrastRatio;
  }
  
  /// Calculate contrast ratio between two colors
  static double getContrastRatio(Color foreground, Color background) {
    final foregroundLuminance = foreground.computeLuminance();
    final backgroundLuminance = background.computeLuminance();
    
    final lighter = foregroundLuminance > backgroundLuminance 
        ? foregroundLuminance 
        : backgroundLuminance;
    final darker = foregroundLuminance > backgroundLuminance 
        ? backgroundLuminance 
        : foregroundLuminance;
    
    return (lighter + 0.05) / (darker + 0.05);
  }
  
  /// Get accessible text color (dark or light) for a given background
  static Color getAccessibleTextColor(Color backgroundColor) {
    return backgroundColor.computeLuminance() > 0.5 
        ? BrandColors.textPrimary 
        : BrandColors.textLight;
  }
  
  /// Generate accessible color variant based on brightness
  static Color getAccessibleVariant(Color baseColor, Brightness brightness) {
    final hsl = HSLColor.fromColor(baseColor);
    
    if (brightness == Brightness.light) {
      // Darker for light background
      return hsl.withLightness(0.3).toColor();
    } else {
      // Lighter for dark background
      return hsl.withLightness(0.8).toColor();
    }
  }
  
  /// Adjust color to meet minimum contrast ratio
  static Color ensureContrast(
    Color foreground, 
    Color background, {
    double minRatio = minContrastRatio,
  }) {
    if (getContrastRatio(foreground, background) >= minRatio) {
      return foreground;
    }
    
    final hsl = HSLColor.fromColor(foreground);
    final backgroundLuminance = background.computeLuminance();
    
    // If background is light, make foreground darker
    if (backgroundLuminance > 0.5) {
      return hsl.withLightness(0.2).toColor();
    } else {
      // If background is dark, make foreground lighter
      return hsl.withLightness(0.9).toColor();
    }
  }
  
  /// Get semantic tap target size (minimum 48x48 as per Material Design)
  static const double minTapTargetSize = 48.0;
  
  /// Get recommended touch target padding
  static EdgeInsets getTapTargetPadding(Size currentSize) {
    final horizontalPadding = (minTapTargetSize - currentSize.width) / 2;
    final verticalPadding = (minTapTargetSize - currentSize.height) / 2;
    
    return EdgeInsets.symmetric(
      horizontal: horizontalPadding > 0 ? horizontalPadding : 0,
      vertical: verticalPadding > 0 ? verticalPadding : 0,
    );
  }
}

