import 'package:flutter/material.dart';

class CompactInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? value;
  final bool isCompact;
  final String fallbackText;

  const CompactInfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.isCompact = false,
    this.fallbackText = 'N/A',
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (isCompact) {
      // Compact: Label and value on same line
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Icon(icon, size: 18, color: colorScheme.primary),
            const SizedBox(width: 8),
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const Spacer(),
            Text(
              value ?? fallbackText,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: value == null 
                    ? colorScheme.onSurfaceVariant 
                    : null,
              ),
            ),
          ],
        ),
      );
    } else {
      // Expanded: Label above value (for long text)
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 18, color: colorScheme.primary),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value ?? fallbackText,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: value == null 
                          ? colorScheme.onSurfaceVariant 
                          : null,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}

