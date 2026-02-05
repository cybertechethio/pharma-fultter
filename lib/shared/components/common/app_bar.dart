import 'package:cyber_pos/app/theme/text_styles.dart';
import 'package:flutter/material.dart';
import '../../../app/theme/brand_colors.dart';

/// Single reusable app bar for all screens (branch, dashboard, list, detail, etc.).
/// Uses theme background and white title/icons by default.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Page title text. Ignored if [titleWidget] is set.
  final String? title;
  /// Custom title widget (e.g. logo). When set, [title] is ignored.
  final Widget? titleWidget;
  /// Custom leading widget (e.g. menu). When null, default back button is used.
  final Widget? leading;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final bool centerTitle;
  final Color? backgroundColor;
  final double elevation;

  const CustomAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.leading,
    this.actions,
    this.bottom,
    this.centerTitle = false,
    this.backgroundColor,
    this.elevation = 0,
  }) : assert(title != null || titleWidget != null, 'Provide title or titleWidget');

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      foregroundColor: BrandColors.textLight,
      iconTheme: const IconThemeData(color: BrandColors.textLight),
      leading: leading,
      title: titleWidget != null
          ? titleWidget
          : Text(
              title!,
              style: context.header(color: BrandColors.textLight),
            ),
      bottom: bottom,
      actions: actions,
    );
  }

  @override
  Size get preferredSize {
    final double bottomHeight = bottom?.preferredSize.height ?? 0;
    return Size.fromHeight(kToolbarHeight + bottomHeight);
  }
}
