import 'package:flutter/material.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';

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
    final headerColor = color ?? BrandColors.primary;

    return Padding(
      padding: const EdgeInsets.fromLTRB(AppSizes.lg, AppSizes.xxl, AppSizes.lg, AppSizes.md),
      child: Row(
        children: [
          Icon(
            icon,
            color: headerColor,
            size: AppSizes.iconSize,
          ),
          const SizedBox(width: AppSizes.sm),
          Text(
            title,
            style: context.title(
              color: headerColor,
              bold: true,
            ),
          ),
        ],
      ),
    );
  }
}
