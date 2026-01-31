import 'package:flutter/material.dart';
import 'package:cyber_pos/l10n/app_localizations.dart';
/// Custom bottom sheet component following Material Design 3 and project theme
/// 
/// Features:
/// - Consistent theming with brand colors
/// - Dark/light mode support
/// - Multiple variants (standard, modal, persistent)
/// - Built-in header and actions
/// - Support for different heights
/// - Accessibility support
class CustomBottomSheet extends StatelessWidget {
  /// Bottom sheet content
  final Widget child;
  
  /// Bottom sheet variant
  final BottomSheetVariant variant;
  
  /// Bottom sheet title
  final String? title;
  
  /// Bottom sheet subtitle
  final String? subtitle;
  
  /// Whether to show title
  final bool showTitle;
  
  /// Whether to show subtitle
  final bool showSubtitle;
  
  /// Header widget
  final Widget? header;
  
  /// Footer widget
  final Widget? footer;
  
  /// List of action widgets
  final List<Widget>? actions;
  
  /// Whether to show close button
  final bool showClose;
  
  /// Close callback
  final VoidCallback? onClose;
  
  /// Whether to show done button
  final bool showDone;
  
  /// Done callback
  final VoidCallback? onDone;
  
  /// Whether to show cancel button
  final bool showCancel;
  
  /// Cancel callback
  final VoidCallback? onCancel;
  
  /// Whether bottom sheet is dismissible
  final bool isDismissible;
  
  /// Whether bottom sheet is draggable
  final bool isDraggable;
  
  /// Whether bottom sheet is scrollable
  final bool isScrollable;
  
  /// Custom background color
  final Color? backgroundColor;
  
  /// Custom foreground color
  final Color? foregroundColor;
  
  /// Custom elevation
  final double? elevation;
  
  /// Custom shadow color
  final Color? shadowColor;
  
  /// Custom border radius
  final BorderRadius? borderRadius;
  
  /// Custom margin
  final EdgeInsetsGeometry? margin;
  
  /// Custom padding
  final EdgeInsetsGeometry? padding;
  
  /// Custom content padding
  final EdgeInsetsGeometry? contentPadding;
  
  /// Custom width
  final double? width;
  
  /// Custom height
  final double? height;
  
  /// Custom constraints
  final BoxConstraints? constraints;
  
  /// Custom clip behavior
  final Clip clipBehavior;
  
  /// Custom title style
  final TextStyle? titleStyle;
  
  /// Custom subtitle style
  final TextStyle? subtitleStyle;
  
  /// Custom semantic label
  final String? semanticLabel;

  const CustomBottomSheet({
    super.key,
    required this.child,
    this.variant = BottomSheetVariant.standard,
    this.title,
    this.subtitle,
    this.showTitle = false,
    this.showSubtitle = false,
    this.header,
    this.footer,
    this.actions,
    this.showClose = true,
    this.onClose,
    this.showDone = false,
    this.onDone,
    this.showCancel = false,
    this.onCancel,
    this.isDismissible = true,
    this.isDraggable = true,
    this.isScrollable = true,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
    this.shadowColor,
    this.borderRadius,
    this.margin,
    this.padding,
    this.contentPadding,
    this.width,
    this.height,
    this.constraints,
    this.clipBehavior = Clip.none,
    this.titleStyle,
    this.subtitleStyle,
    this.semanticLabel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    // Build bottom sheet content
    Widget sheetContent = _buildSheetContent(context, theme, colorScheme);
    
    // Apply constraints
    if (width != null || height != null || constraints != null) {
      sheetContent = SizedBox(
        width: width,
        height: height,
        child: sheetContent,
      );
    }
    
    // Apply margin
    if (margin != null) {
      sheetContent = Padding(
        padding: margin!,
        child: sheetContent,
      );
    }
    
    // Apply padding
    if (padding != null) {
      sheetContent = Padding(
        padding: padding!,
        child: sheetContent,
      );
    }
    
    return Semantics(
      label: semanticLabel,
      child: sheetContent,
    );
  }
  
  Widget _buildSheetContent(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    switch (variant) {
      case BottomSheetVariant.standard:
        return _buildStandardSheet(context, theme, colorScheme);
      case BottomSheetVariant.modal:
        return _buildModalSheet(context, theme, colorScheme);
      case BottomSheetVariant.persistent:
        return _buildPersistentSheet(context, theme, colorScheme);
    }
  }
  
  Widget _buildStandardSheet(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? colorScheme.surface,
        borderRadius: borderRadius ?? const BorderRadius.vertical(
          top: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? colorScheme.shadow,
            blurRadius: elevation ?? 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      clipBehavior: clipBehavior,
      child: _buildSheetBody(context, theme, colorScheme),
    );
  }
  
  Widget _buildModalSheet(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? colorScheme.surface,
        borderRadius: borderRadius ?? BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? colorScheme.shadow,
            blurRadius: elevation ?? 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      clipBehavior: clipBehavior,
      child: _buildSheetBody(context, theme, colorScheme),
    );
  }
  
  Widget _buildPersistentSheet(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? colorScheme.surface,
        borderRadius: borderRadius ?? const BorderRadius.vertical(
          top: Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? colorScheme.shadow,
            blurRadius: elevation ?? 4,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      clipBehavior: clipBehavior,
      child: _buildSheetBody(context, theme, colorScheme),
    );
  }
  
  Widget _buildSheetBody(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    final List<Widget> sheetChildren = [];
    
    // Add header
    if (header != null) {
      sheetChildren.add(header!);
    }
    
    // Add title section
    if (showTitle || showSubtitle) {
      sheetChildren.add(_buildTitleSection(context, theme, colorScheme));
    }
    
    // Add main content
    sheetChildren.add(
      Padding(
        padding: contentPadding ?? const EdgeInsets.all(16),
        child: child,
      ),
    );
    
    // Add actions
    if (actions != null && actions!.isNotEmpty) {
      sheetChildren.add(_buildActionsSection(context, theme, colorScheme));
    }
    
    // Add footer
    if (footer != null) {
      sheetChildren.add(footer!);
    }
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: sheetChildren,
    );
  }
  
  Widget _buildTitleSection(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    final List<Widget> titleChildren = [];
    
    if (showTitle && title != null) {
      titleChildren.add(
        Text(
          title!,
          style: titleStyle ?? theme.textTheme.headlineSmall?.copyWith(
            color: foregroundColor ?? colorScheme.onSurface,
          ),
        ),
      );
    }
    
    if (showSubtitle && subtitle != null) {
      titleChildren.add(
        Text(
          subtitle!,
          style: subtitleStyle ?? theme.textTheme.bodyMedium?.copyWith(
            color: foregroundColor ?? colorScheme.onSurfaceVariant,
          ),
        ),
      );
    }
    
    if (titleChildren.isEmpty) {
      return const SizedBox.shrink();
    }
    
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: titleChildren,
      ),
    );
  }
  
  Widget _buildActionsSection(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: actions!,
      ),
    );
  }
}

/// Bottom sheet variants
enum BottomSheetVariant {
  standard,
  modal,
  persistent,
}

/// Convenience constructors for common bottom sheet types
extension CustomBottomSheetConstructors on CustomBottomSheet {
  /// Standard bottom sheet
  static CustomBottomSheet standard({
    required Widget child,
    String? title,
    String? subtitle,
    bool showTitle = false,
    bool showSubtitle = false,
    EdgeInsetsGeometry? contentPadding,
    Key? key,
  }) {
    return CustomBottomSheet(
      key: key,
      child: child,
      title: title,
      subtitle: subtitle,
      showTitle: showTitle,
      showSubtitle: showSubtitle,
      contentPadding: contentPadding,
    );
  }
  
  /// Standard bottom sheet with localized text
  static CustomBottomSheet standardLocalized({
    required BuildContext context,
    required Widget child,
    String? title,
    String? subtitle,
    bool showTitle = false,
    bool showSubtitle = false,
    EdgeInsetsGeometry? contentPadding,
    Key? key,
  }) {
    final l10n = AppLocalizations.of(context);
    return CustomBottomSheet(
      key: key,
      child: child,
      title: title ?? l10n.appTitle,
      subtitle: subtitle,
      showTitle: showTitle,
      showSubtitle: showSubtitle,
      contentPadding: contentPadding,
    );
  }
  
  /// Modal bottom sheet
  static CustomBottomSheet modal({
    required Widget child,
    String? title,
    String? subtitle,
    bool showTitle = false,
    bool showSubtitle = false,
    EdgeInsetsGeometry? contentPadding,
    Key? key,
  }) {
    return CustomBottomSheet(
      key: key,
      child: child,
      variant: BottomSheetVariant.modal,
      title: title,
      subtitle: subtitle,
      showTitle: showTitle,
      showSubtitle: showSubtitle,
      contentPadding: contentPadding,
    );
  }
  
  /// Persistent bottom sheet
  static CustomBottomSheet persistent({
    required Widget child,
    String? title,
    String? subtitle,
    bool showTitle = false,
    bool showSubtitle = false,
    EdgeInsetsGeometry? contentPadding,
    Key? key,
  }) {
    return CustomBottomSheet(
      key: key,
      child: child,
      variant: BottomSheetVariant.persistent,
      title: title,
      subtitle: subtitle,
      showTitle: showTitle,
      showSubtitle: showSubtitle,
      contentPadding: contentPadding,
    );
  }
  
  /// Bottom sheet with actions
  static CustomBottomSheet withActions({
    required Widget child,
    required List<Widget> actions,
    String? title,
    String? subtitle,
    bool showTitle = false,
    bool showSubtitle = false,
    EdgeInsetsGeometry? contentPadding,
    Key? key,
  }) {
    return CustomBottomSheet(
      key: key,
      child: child,
      actions: actions,
      title: title,
      subtitle: subtitle,
      showTitle: showTitle,
      showSubtitle: showSubtitle,
      contentPadding: contentPadding,
    );
  }
  
  /// Bottom sheet with header and footer
  static CustomBottomSheet withHeaderFooter({
    required Widget child,
    Widget? header,
    Widget? footer,
    String? title,
    String? subtitle,
    bool showTitle = false,
    bool showSubtitle = false,
    EdgeInsetsGeometry? contentPadding,
    Key? key,
  }) {
    return CustomBottomSheet(
      key: key,
      child: child,
      header: header,
      footer: footer,
      title: title,
      subtitle: subtitle,
      showTitle: showTitle,
      showSubtitle: showSubtitle,
      contentPadding: contentPadding,
    );
  }
}

/// Static methods for showing bottom sheets
class CustomBottomSheetHelper {
  /// Show standard bottom sheet
  static Future<T?> showStandard<T>({
    required BuildContext context,
    required Widget child,
    String? title,
    String? subtitle,
    bool showTitle = false,
    bool showSubtitle = false,
    bool isDismissible = true,
    bool isDraggable = true,
    bool isScrollable = true,
    EdgeInsetsGeometry? contentPadding,
    Key? key,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      isScrollControlled: isScrollable,
      backgroundColor: Colors.transparent,
      builder: (context) => CustomBottomSheetConstructors.standard(
        key: key,
        child: child,
        title: title,
        subtitle: subtitle,
        showTitle: showTitle,
        showSubtitle: showSubtitle,
        contentPadding: contentPadding,
      ),
    );
  }
  
  /// Show standard bottom sheet with localized text
  static Future<T?> showStandardLocalized<T>({
    required BuildContext context,
    required Widget child,
    String? title,
    String? subtitle,
    bool showTitle = false,
    bool showSubtitle = false,
    bool isDismissible = true,
    bool isDraggable = true,
    bool isScrollable = true,
    EdgeInsetsGeometry? contentPadding,
    Key? key,
  }) {
    final l10n = AppLocalizations.of(context);
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      isScrollControlled: isScrollable,
      backgroundColor: Colors.transparent,
      builder: (context) => CustomBottomSheetConstructors.standardLocalized(
        key: key,
        context: context,
        child: child,
        title: title ?? l10n.appTitle,
        subtitle: subtitle,
        showTitle: showTitle,
        showSubtitle: showSubtitle,
        contentPadding: contentPadding,
      ),
    );
  }
  
  /// Show modal bottom sheet
  static Future<T?> showModal<T>({
    required BuildContext context,
    required Widget child,
    String? title,
    String? subtitle,
    bool showTitle = false,
    bool showSubtitle = false,
    bool isDismissible = true,
    bool isDraggable = true,
    bool isScrollable = true,
    EdgeInsetsGeometry? contentPadding,
    Key? key,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      isScrollControlled: isScrollable,
      backgroundColor: Colors.transparent,
      builder: (context) => CustomBottomSheetConstructors.modal(
        key: key,
        child: child,
        title: title,
        subtitle: subtitle,
        showTitle: showTitle,
        showSubtitle: showSubtitle,
        contentPadding: contentPadding,
      ),
    );
  }
  
  /// Show persistent bottom sheet
  static PersistentBottomSheetController showPersistent<T>({
    required BuildContext context,
    required Widget child,
    String? title,
    String? subtitle,
    bool showTitle = false,
    bool showSubtitle = false,
    bool isDismissible = true,
    bool isDraggable = true,
    bool isScrollable = true,
    EdgeInsetsGeometry? contentPadding,
    Key? key,
  }) {
    return showBottomSheet(
      context: context,
      builder: (context) => CustomBottomSheetConstructors.persistent(
        key: key,
        child: child,
        title: title,
        subtitle: subtitle,
        showTitle: showTitle,
        showSubtitle: showSubtitle,
        contentPadding: contentPadding,
      ),
    );
  }
}
