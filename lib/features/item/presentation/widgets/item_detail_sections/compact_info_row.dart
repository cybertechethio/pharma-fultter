import 'package:flutter/material.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../app/theme/text_styles.dart';

class CompactInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? value;
  final bool isCompact;
  final String? fallbackText;

  const CompactInfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.isCompact = false,
    this.fallbackText,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final fallback = fallbackText ?? l10n.nA;

    if (isCompact) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSizes.xs2),
        child: Row(
          children: [
            Icon(icon, size: AppSizes.md2, color: BrandColors.primary),
            const SizedBox(width: AppSizes.sm),
            Text(
              label,
              style: context.smallSecondary(),
            ),
            const Spacer(),
            Text(
              value ?? fallback,
              style: value == null
                  ? context.bodySecondary(bold: true)
                  : context.body(bold: true),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSizes.xs2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: AppSizes.md2, color: BrandColors.primary),
            const SizedBox(width: AppSizes.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: context.smallSecondary(),
                  ),
                  const SizedBox(height: AppSizes.xxs),
                  Text(
                    value ?? fallback,
                    style: value == null
                        ? context.bodySecondary(bold: true)
                        : context.body(bold: true),
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

