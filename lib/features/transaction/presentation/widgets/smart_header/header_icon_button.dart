import 'package:flutter/material.dart';

/// A simple, elegant icon button for the smart header bar
/// Shows circular icon with label below (always visible)
class HeaderIconButton extends StatelessWidget {
  final IconData icon;
  final String defaultLabel;
  final String? selectedLabel;
  final Color? iconColor;
  final VoidCallback onTap;

  const HeaderIconButton({
    super.key,
    required this.icon,
    required this.defaultLabel,
    this.selectedLabel,
    this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final isSelected = selectedLabel != null && selectedLabel!.isNotEmpty;
    final displayLabel = isSelected ? selectedLabel! : defaultLabel;
    
    final effectiveIconColor = iconColor ?? 
        (isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant);
    
    final bgColor = isSelected 
        ? effectiveIconColor.withOpacity(0.15)
        : colorScheme.surfaceContainerHighest.withOpacity(0.8);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Circular Icon
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: bgColor,
              shape: BoxShape.circle,
              border: isSelected 
                  ? Border.all(
                      color: effectiveIconColor.withOpacity(0.4),
                      width: 2,
                    )
                  : Border.all(
                      color: colorScheme.outlineVariant.withOpacity(0.3),
                      width: 1,
                    ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: effectiveIconColor.withOpacity(0.2),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : null,
            ),
            child: Icon(
              icon,
              size: 24,
              color: effectiveIconColor,
            ),
          ),
          const SizedBox(height: 6),
          // Label (always visible)
          Text(
            displayLabel,
            style: theme.textTheme.labelSmall?.copyWith(
              color: isSelected 
                  ? effectiveIconColor 
                  : colorScheme.onSurfaceVariant,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              fontSize: 12,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/// Circular item button with count badge
class HeaderItemButton extends StatelessWidget {
  final int itemCount;
  final VoidCallback onTap;

  const HeaderItemButton({
    super.key,
    required this.itemCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final hasItems = itemCount > 0;
    final iconColor = hasItems ? colorScheme.tertiary : colorScheme.onSurfaceVariant;
    final bgColor = hasItems
        ? iconColor.withOpacity(0.15)
        : colorScheme.surfaceContainerHighest.withOpacity(0.8);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Circular Icon with badge
          Stack(
            clipBehavior: Clip.none,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOutCubic,
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: bgColor,
                  shape: BoxShape.circle,
                  border: hasItems
                      ? Border.all(
                          color: iconColor.withOpacity(0.4),
                          width: 2,
                        )
                      : Border.all(
                          color: colorScheme.outlineVariant.withOpacity(0.3),
                          width: 1,
                        ),
                  boxShadow: hasItems
                      ? [
                          BoxShadow(
                            color: iconColor.withOpacity(0.2),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : null,
                ),
                child: Icon(
                  Icons.inventory_2_rounded,
                  size: 24,
                  color: iconColor,
                ),
              ),
              // Badge for item count
              if (hasItems)
                Positioned(
                  top: -2,
                  right: -2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: iconColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: colorScheme.surface,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: iconColor.withOpacity(0.3),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      '$itemCount',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          // Label
          Text(
            'Items',
            style: theme.textTheme.labelSmall?.copyWith(
              color: hasItems ? iconColor : colorScheme.onSurfaceVariant,
              fontWeight: hasItems ? FontWeight.w600 : FontWeight.w500,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
