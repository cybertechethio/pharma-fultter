/// App size constants for consistent spacing and dimensions
/// 
/// All spacing values should use these constants instead of hardcoded numbers
/// to maintain consistency and make global changes easier.
class AppSizes {
  AppSizes._();
  
  // ============================================================================
  // SPACING - Use these for SizedBox, EdgeInsets, padding, margin
  // ============================================================================
  
  /// Extra extra small spacing (2px) - Minimal spacing between tightly related elements
  static const xxs = 2.0;
  
  /// Extra small spacing (4px) - Very tight spacing
  static const xs = 4.0;
  
  /// Small spacing (6px) - Tight spacing
  static const xs2 = 6.0;
  
  /// Small spacing (8px) - Standard small spacing
  static const sm = 8.0;
  
  /// Small-medium spacing (10px) - Between small and medium
  static const sm2 = 10.0;
  
  /// Medium spacing (12px) - Standard medium spacing
  static const md = 12.0;
  
  /// Medium-large spacing (14px) - Between medium and large
  static const md2 = 14.0;
  
  /// Large spacing (16px) - Standard large spacing (most common)
  static const lg = 16.0;
  
  /// Extra large spacing (20px) - Large spacing between sections
  static const xl = 20.0;
  
  /// Extra extra large spacing (24px) - Very large spacing
  static const xxl = 24.0;
  
  /// Extra extra extra large spacing (32px) - Huge spacing
  static const xxxl = 32.0;
  
  /// Extra extra extra extra large spacing (40px) - Maximum spacing
  static const xxxxl = 40.0;
  
  /// Extra extra extra extra extra large spacing (48px) - Extreme spacing
  static const xxxxxl = 48.0;
  
  /// Special spacing (72px) - For specific layout needs (e.g., drawer padding)
  static const special = 72.0;

  // ============================================================================
  // BORDER RADIUS - Use these for BorderRadius.circular()
  // ============================================================================
  
  /// Extra small border radius (4px)
  static const radiusXs = 4.0;
  
  /// Small border radius (8px)
  static const radiusSm = 8.0;
  
  /// Medium border radius (10px)
  static const radiusMd = 10.0;
  
  /// Standard border radius (12px) - Most common
  static const radius = 12.0;
  
  /// Large border radius (16px)
  static const radiusLg = 16.0;
  
  /// Extra large border radius (24px)
  static const radiusXl = 24.0;
  
  /// Full border radius (999px) - For circular/pill shapes
  static const radiusFull = 999.0;

  // ============================================================================
  // BORDER WIDTH
  // ============================================================================
  
  /// Standard border width (1.5px)
  static const br = 1.5;

  // ============================================================================
  // BUTTON DIMENSIONS
  // ============================================================================
  
  /// Standard button height (45px)
  static const btnHeight = 45.0;
  
  /// Standard icon size (20px)
  static const iconSize = 20.0;
  
  /// Small icon size (16px)
  static const iconSizeSm = 16.0;
  
  /// Large icon size (24px)
  static const iconSizeLg = 24.0;
}
