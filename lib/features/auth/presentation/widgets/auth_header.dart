import 'package:flutter/material.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';

class AuthHeader extends StatelessWidget {
  final String? imagePath;
  final String title;
  final String subtitle;

  const AuthHeader({
    super.key,
    this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (imagePath != null) ...[
          Container(
            width: AppSizes.xxxxl,
            height: AppSizes.xxxxl,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.radiusLg),
              boxShadow: [
                BoxShadow(
                  color: BrandColors.primary.withOpacity(0.3),
                  blurRadius: AppSizes.md,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Image.asset(
              imagePath!,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: AppSizes.xl),
        ],
        Text(
          title,
          style: context.header(color: BrandColors.textPrimary),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSizes.sm),
        Text(
          subtitle,
          style: context.bodySecondary(),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSizes.xl),
      ],
    );
  }
}

