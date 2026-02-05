import 'package:flutter/material.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';

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
    if (isCompact) {
      // Compact: Label and value on same line
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSizes.xs2),
        child: Row(
          children: [
            Icon(icon, size: AppSizes.iconSize, color: BrandColors.primary),
            const SizedBox(width: AppSizes.sm),
            Text(
              label,
              style: context.small(color: BrandColors.textSecondary),
            ),
            const Spacer(),
            Text(
              value ?? fallbackText,
              style: context.body(
                color: value == null ? BrandColors.textSecondary : null,
                bold: false,
              ).copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      );
    } else {
      // Expanded: Label above value (for long text)
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSizes.xs2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: AppSizes.iconSize, color: BrandColors.primary),
            const SizedBox(width: AppSizes.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: context.small(color: BrandColors.textSecondary),
                  ),
                  const SizedBox(height: AppSizes.xxs),
                  Text(
                    value ?? fallbackText,
                    style: context.body(
                      color: value == null ? BrandColors.textSecondary : null,
                      bold: false,
                    ).copyWith(fontWeight: FontWeight.w500),
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

