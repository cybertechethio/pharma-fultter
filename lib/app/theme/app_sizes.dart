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
  
  /// Extra extra small border radius (2px) - e.g. date picker dots
  static const radiusXxs = 2.0;

  /// Extra small border radius (4px)
  static const radiusXs = 4.0;
  
  /// Extra small border radius (6px) - e.g. badges, chips
  static const radiusXs2 = 6.0;
  
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
  
  /// Dialog border radius (6px) - For modal dialogs
  static const radiusDialog = 6.0;

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

  // ============================================================================
  // LOADER / PROGRESS
  // ============================================================================
  
  /// Circular progress indicator stroke width (2px)
  static const loaderStrokeWidth = 2.0;

  // ============================================================================
  // LAYOUT DIMENSIONS
  // ============================================================================
  
  /// Search bar preferred height (60px) - e.g. list screen app bar bottom
  static const searchBarHeight = 60.0;
  
  /// Input field content padding (15px) - For text fields
  static const contentPaddingInput = 15.0;
  
  /// Medium image/card size (56px) - e.g. item card thumbnail
  static const imageSizeMd = 56.0;

  // ============================================================================
  // LIST / CHART DIMENSIONS
  // ============================================================================

  /// Horizontal scroll list height (70px) - e.g. report summary cards list
  static const horizontalListHeight = 70.0;

  /// Chart widget height (250px) - e.g. bar/line charts
  static const chartHeight = 250.0;

  /// Attachment/image thumbnail size (100px) - e.g. expense attachments
  static const attachmentThumbSize = 100.0;

  /// Min height for scrollable form content (200px) - e.g. create transfer/sales order
  static const scrollContentMinHeight = 200.0;

  /// Drawer width (240px) - Navigation drawer panel width
  static const drawerWidth = 240.0;

  // ============================================================================
  // FONT SIZES - Use for explicit text size when context.*() styles need override
  // ============================================================================

  /// Caption / badge font size (10px) - e.g. nav labels, small badges
  static const fontSizeCaption = 10.0;

  /// Label font size (12px) - e.g. small badges, compact labels
  static const fontSizeLabel = 12.0;

  /// Body small / form label / footer text (14px) - e.g. form labels, secondary text, footer links (reference-style)
  static const fontSizeBodySmall = 14.0;

  /// Body / title font size (16px) - e.g. button text, input text, dialog titles
  static const fontSizeBody = 16.0;

  /// Subtitle / emphasized font size (18px) - e.g. summary numbers
  static const fontSizeSubtitle = 18.0;

  /// Section title font size (20px) - e.g. period selector, card headers
  static const fontSizeTitle = 20.0;
}
