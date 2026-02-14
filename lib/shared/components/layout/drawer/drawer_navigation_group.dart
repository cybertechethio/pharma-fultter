import 'package:flutter/material.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import 'drawer_nav_item.dart';

/// A group of navigation items with an optional section header.
/// Organizes drawer items into logical categories.
class DrawerNavigationGroup extends StatelessWidget {
  final String? title;
  final List<DrawerNavItemData>? items;
  final List<Widget>? customItems;
  final String? currentRoute;

  const DrawerNavigationGroup({
    super.key,
    this.title,
    this.items,
    this.customItems,
    this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(26, 8, 16, 4),
            child: Text(
              title!.toUpperCase(),
              style: context.caption(
                color: BrandColors.textSecondary,
                bold: true,
              ).copyWith(
                letterSpacing: 1.2,
                fontSize: AppSizes.fontSizeCaption,
              ),
            ),
          ),
        ],
        if (items != null)
          ...items!.map((item) => DrawerNavItem(
                icon: item.icon,
                label: item.label,
                onTap: item.onTap,
                isSelected: currentRoute == item.route,
                iconColor: item.iconColor,
              )),
        if (customItems != null) ...customItems!,
      ],
    );
  }
}

/// Data model for a navigation item.
class DrawerNavItemData {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final String? route;
  final Color? iconColor;

  const DrawerNavItemData({
    required this.icon,
    required this.label,
    required this.onTap,
    this.route,
    this.iconColor,
  });
}

