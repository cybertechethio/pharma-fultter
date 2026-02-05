import 'package:flutter/material.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import 'drawer_nav_item.dart';
import 'drawer_navigation_group.dart';

/// An expandable navigation item that can show/hide child items
class DrawerExpandableItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final List<DrawerNavItemData> children;
  final Color? iconColor;
  final bool initiallyExpanded;

  const DrawerExpandableItem({
    super.key,
    required this.icon,
    required this.label,
    required this.children,
    this.iconColor,
    this.initiallyExpanded = false,
  });

  @override
  State<DrawerExpandableItem> createState() => _DrawerExpandableItemState();
}

class _DrawerExpandableItemState extends State<DrawerExpandableItem> {
  late bool _isExpanded;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final isActive = _isExpanded || _isHovered;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Column(
        children: [
          // Main expandable item
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOutCubic,
              margin: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.xxs),
              decoration: BoxDecoration(
                color: _isExpanded
                    ? colorScheme.surfaceContainerHighest.withOpacity(0.4)
                    : _isHovered
                        ? colorScheme.surfaceContainerHighest.withOpacity(0.4)
                        : BrandColors.transparent,
                borderRadius: BorderRadius.circular(AppSizes.radius),
              ),
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.md2, vertical: AppSizes.sm),
              child: Row(
                children: [
                  Icon(
                    widget.icon,
                    size: 22,
                    color: (widget.iconColor ?? BrandColors.primary).withValues(
                      alpha: isActive ? 1.0 : 0.5,
                    ),
                  ),
                  const SizedBox(width: AppSizes.md2),
                  Expanded(
                    child: Text(
                      widget.label,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight:
                            isActive ? FontWeight.w600 : FontWeight.w500,
                        color: isActive
                            ? colorScheme.onSurface
                            : colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  Icon(
                    _isExpanded
                        ? Icons.keyboard_arrow_up_outlined
                        : Icons.keyboard_arrow_down_outlined,
                    size: 20,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
            ),
          ),
          // Children items (shown when expanded)
          if (_isExpanded) ...[
            ...widget.children.map((child) => Padding(
                  padding: const EdgeInsets.only(left: AppSizes.sm),
                  child: DrawerNavItem(
                    icon: child.icon,
                    label: child.label,
                    onTap: child.onTap,
                    isSelected: false,
                    iconColor: child.iconColor,
                  ),
                )),
          ],
        ],
      ),
    );
  }
}
