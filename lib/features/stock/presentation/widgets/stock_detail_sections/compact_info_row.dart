import 'package:flutter/material.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../app/theme/text_styles.dart';

class CompactInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool isCompact;

  const CompactInfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {

    if (isCompact) {
      // Compact: Label and value on same line
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
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
              value,
              style: context.body(bold: true),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
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
                    value,
                    style: context.body(bold: true),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
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

