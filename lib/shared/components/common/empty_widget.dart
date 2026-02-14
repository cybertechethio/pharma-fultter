import 'package:flutter/material.dart';
import 'package:cyber_pos/l10n/app_localizations.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/brand_colors.dart';
import '../../../app/theme/text_styles.dart';

/// Empty state widget for displaying empty content
/// 
/// Features:
/// - Multiple empty state variants
/// - Custom illustrations and icons
/// - Action buttons for user guidance
/// - Consistent theming with brand colors
/// - Dark/light mode support
class EmptyWidget extends StatelessWidget {
  /// Empty state message
  final String message;
  
  /// Empty state variant
  final EmptyVariant variant;
  
  /// Custom empty icon
  final IconData? icon;
  
  /// Custom empty illustration
  final Widget? illustration;
  
  /// Action button text
  final String? actionText;
  
  /// Whether to show action button
  final bool showAction;
  
  /// Callback when action is pressed
  final VoidCallback? onAction;
  
  /// Custom actions to show below message
  final List<Widget>? actions;
  
  /// Empty state title (optional)
  final String? title;
  
  /// Whether to show title
  final bool showTitle;
  
  /// Custom text style for message
  final TextStyle? messageStyle;
  
  /// Custom text style for title
  final TextStyle? titleStyle;
  
  /// Custom icon color
  final Color? iconColor;
  
  /// Custom icon size
  final double? iconSize;
  
  /// Spacing between elements
  final double spacing;
  
  /// Horizontal padding
  final double horizontalPadding;
  
  /// Vertical padding
  final double verticalPadding;

  const EmptyWidget({
    super.key,
    required this.message,
    this.variant = EmptyVariant.icon,
    this.icon,
    this.illustration,
    this.actionText,
    this.showAction = false,
    this.onAction,
    this.actions,
    this.title,
    this.showTitle = false,
    this.messageStyle,
    this.titleStyle,
    this.iconColor,
    this.iconSize,
    this.spacing = 16.0,
    this.horizontalPadding = AppSizes.xxl,
    this.verticalPadding = 32.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildEmptyContent(context),
          SizedBox(height: spacing),
          if (showTitle && title != null) ...[
            _buildTitle(context),
            SizedBox(height: spacing),
          ],
          _buildMessage(context),
          SizedBox(height: spacing),
          _buildActions(context),
        ],
      ),
    );
  }
  
  Widget _buildEmptyContent(BuildContext context) {
    switch (variant) {
      case EmptyVariant.icon:
        return _buildIconEmpty(context);
      case EmptyVariant.illustration:
        return _buildIllustrationEmpty(context);
      case EmptyVariant.custom:
        return illustration ?? _buildIconEmpty(context);
    }
  }
  
  Widget _buildIconEmpty(BuildContext context) {
    return Icon(
      icon ?? Icons.inbox_outlined,
      size: iconSize ?? 64,
      color: iconColor ?? BrandColors.textSecondary,
    );
  }
  
  Widget _buildIllustrationEmpty(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: BrandColors.surfaceContainerHighest.withValues(alpha: 0.3),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon ?? Icons.inbox_outlined,
        size: 48,
        color: iconColor ?? BrandColors.textSecondary,
      ),
    );
  }
  
  Widget _buildTitle(BuildContext context) {
    return Text(
      title!,
      style: titleStyle ?? context.header(color: BrandColors.textPrimary),
      textAlign: TextAlign.center,
    );
  }
  
  Widget _buildMessage(BuildContext context) {
    return Text(
      message,
      style: messageStyle ?? context.body(color: BrandColors.textSecondary),
      textAlign: TextAlign.center,
    );
  }
  
  Widget _buildActions(BuildContext context) {
    final List<Widget> actionWidgets = [];
    
    // Add primary action button if enabled
    if (showAction && onAction != null) {
      actionWidgets.add(
        ElevatedButton(
          onPressed: onAction,
          style: ElevatedButton.styleFrom(
            backgroundColor: BrandColors.primary,
            foregroundColor: BrandColors.buttonText,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.radiusSm),
            ),
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.xxl, vertical: AppSizes.md),
          ),
          child: Text(actionText ?? AppLocalizations.of(context).getStarted),
        ),
      );
    }
    
    // Add custom actions
    if (actions != null && actions!.isNotEmpty) {
      if (actionWidgets.isNotEmpty) {
        actionWidgets.add(const SizedBox(width: AppSizes.md));
      }
      actionWidgets.addAll(actions!);
    }
    
    if (actionWidgets.isEmpty) {
      return const SizedBox.shrink();
    }
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: actionWidgets,
    );
  }
}

/// Empty state variants
enum EmptyVariant {
  icon,
  illustration,
  custom,
}

/// Convenience constructors for common empty states
extension EmptyWidgetConstructors on EmptyWidget {
  /// Empty list state. Pass [context] for localized default message and action text.
  static EmptyWidget list({
    BuildContext? context,
    String? message,
    String? actionText,
    VoidCallback? onAction,
    Key? key,
  }) {
    final l10n = context != null ? AppLocalizations.of(context) : null;
    return EmptyWidget(
      key: key,
      message: message ?? (l10n?.noItemsFound ?? 'No items found. Start by adding your first item.'),
      variant: EmptyVariant.icon,
      icon: Icons.list_alt_outlined,
      showAction: onAction != null,
      onAction: onAction,
      actionText: actionText ?? (l10n?.addItem ?? 'Add Item'),
    );
  }
  
  /// Empty list state with localized text
  static EmptyWidget listLocalized({
    required BuildContext context,
    String? message,
    String? actionText,
    VoidCallback? onAction,
    Key? key,
  }) {
    final l10n = AppLocalizations.of(context);
    return EmptyWidget(
      key: key,
      message: message ?? l10n.noItemsFound,
      variant: EmptyVariant.icon,
      icon: Icons.list_alt_outlined,
      showAction: onAction != null,
      onAction: onAction,
      actionText: actionText ?? l10n.addItem,
    );
  }
  
  /// Empty search results
  static EmptyWidget search({
    String? message,
    String? actionText,
    VoidCallback? onAction,
    Key? key,
  }) {
    return EmptyWidget(
      key: key,
      message: message ?? 'No results found. Try adjusting your search terms.',
      variant: EmptyVariant.icon,
      icon: Icons.search_off,
      showAction: onAction != null,
      onAction: onAction,
      actionText: actionText ?? 'Clear Search',
    );
  }
  
  /// Empty search results with localized text
  static EmptyWidget searchLocalized({
    required BuildContext context,
    String? message,
    String? actionText,
    VoidCallback? onAction,
    Key? key,
  }) {
    final l10n = AppLocalizations.of(context);
    return EmptyWidget(
      key: key,
      message: message ?? l10n.noResultsFound,
      variant: EmptyVariant.icon,
      icon: Icons.search_off,
      showAction: onAction != null,
      onAction: onAction,
      actionText: actionText ?? l10n.clearSearch,
    );
  }
  
  /// Empty favorites
  static EmptyWidget favorites({
    String? message,
    String? actionText,
    VoidCallback? onAction,
    Key? key,
  }) {
    return EmptyWidget(
      key: key,
      message: message ?? 'No favorites yet. Start by adding items you love.',
      variant: EmptyVariant.icon,
      icon: Icons.favorite_border,
      showAction: onAction != null,
      onAction: onAction,
      actionText: actionText ?? 'Browse Items',
    );
  }
  
  /// Empty notifications
  static EmptyWidget notifications({
    String? message,
    Key? key,
  }) {
    return EmptyWidget(
      key: key,
      message: message ?? 'No notifications yet. We\'ll notify you when something important happens.',
      variant: EmptyVariant.icon,
      icon: Icons.notifications_none,
      showAction: false,
    );
  }
  
  /// Empty cart
  static EmptyWidget cart({
    String? message,
    String? actionText,
    VoidCallback? onAction,
    Key? key,
  }) {
    return EmptyWidget(
      key: key,
      message: message ?? 'Your cart is empty. Add some items to get started.',
      variant: EmptyVariant.icon,
      icon: Icons.shopping_cart_outlined,
      showAction: onAction != null,
      onAction: onAction,
      actionText: actionText ?? 'Start Shopping',
    );
  }
  
  /// Empty profile
  static EmptyWidget profile({
    String? message,
    String? actionText,
    VoidCallback? onAction,
    Key? key,
  }) {
    return EmptyWidget(
      key: key,
      message: message ?? 'Complete your profile to get the most out of the app.',
      variant: EmptyVariant.icon,
      icon: Icons.person_outline,
      showAction: onAction != null,
      onAction: onAction,
      actionText: actionText ?? 'Complete Profile',
    );
  }
  
  /// Generic empty state
  static EmptyWidget generic({
    required String message,
    String? title,
    IconData? icon,
    String? actionText,
    VoidCallback? onAction,
    bool showAction = false,
    Key? key,
  }) {
    return EmptyWidget(
      key: key,
      message: message,
      title: title,
      variant: EmptyVariant.icon,
      icon: icon ?? Icons.inbox_outlined,
      showAction: showAction,
      onAction: onAction,
      actionText: actionText,
      showTitle: title != null,
    );
  }
  
  /// Custom empty state with illustration
  static EmptyWidget custom({
    required String message,
    String? title,
    Widget? illustration,
    List<Widget>? actions,
    bool showAction = false,
    VoidCallback? onAction,
    String? actionText,
    Key? key,
  }) {
    return EmptyWidget(
      key: key,
      message: message,
      title: title,
      variant: EmptyVariant.custom,
      illustration: illustration,
      actions: actions,
      showAction: showAction,
      onAction: onAction,
      actionText: actionText,
      showTitle: title != null,
    );
  }
}
