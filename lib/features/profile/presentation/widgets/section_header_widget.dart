import 'package:flutter/material.dart';
import '../../../../app/theme/app_sizes.dart';

/// Reusable section header widget for profile sections
class SectionHeaderWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? color;

  const SectionHeaderWidget({
    super.key,
    required this.title,
    required this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final headerColor = color ?? colorScheme.primary;

    return Padding(
      padding: const EdgeInsets.fromLTRB(AppSizes.lg, 24, AppSizes.lg, 12),
      child: Row(
        children: [
          Icon(
            icon,
            color: headerColor,
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              color: headerColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
