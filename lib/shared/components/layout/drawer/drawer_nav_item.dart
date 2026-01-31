import 'package:flutter/material.dart';

/// An enhanced navigation item with hover effects, selection indicator,
/// and smooth animations.
class DrawerNavItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isSelected;
  final Color? iconColor;

  const DrawerNavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.isSelected = false,
    this.iconColor,
  });

  @override
  State<DrawerNavItem> createState() => _DrawerNavItemState();
}

class _DrawerNavItemState extends State<DrawerNavItem>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.98).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final isActive = widget.isSelected || _isHovered;
    final effectiveIconColor = widget.iconColor ?? colorScheme.primary;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTapDown: (_) => _controller.forward(),
          onTapUp: (_) => _controller.reverse(),
          onTapCancel: () => _controller.reverse(),
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOutCubic,
              decoration: BoxDecoration(
                color: widget.isSelected
                    ? colorScheme.primaryContainer.withOpacity(0.7)
                    : _isHovered
                        ? colorScheme.surfaceContainerHighest.withOpacity(0.7)
                        : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: widget.onTap,
                  borderRadius: BorderRadius.circular(12),
                  splashColor: colorScheme.primary.withOpacity(0.1),
                  highlightColor: colorScheme.primary.withOpacity(0.05),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    child: Row(
                      children: [
                        // Icon Container
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: isActive
                                ? effectiveIconColor.withOpacity(0.15)
                                : colorScheme.surfaceContainerHighest
                                    .withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            widget.icon,
                            size: 20,
                            color: isActive
                                ? effectiveIconColor
                                : colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(width: 14),
                        // Label
                        Expanded(
                          child: Text(
                            widget.label,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight:
                                  isActive ? FontWeight.w600 : FontWeight.w500,
                              color: isActive
                                  ? colorScheme.onSurface
                                  : colorScheme.onSurfaceVariant,
                              letterSpacing: 0.1,
                            ),
                          ),
                        ),
                        // Selection Indicator
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity: widget.isSelected ? 1.0 : 0.0,
                          child: Container(
                            width: 4,
                            height: 20,
                            decoration: BoxDecoration(
                              color: colorScheme.primary,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

