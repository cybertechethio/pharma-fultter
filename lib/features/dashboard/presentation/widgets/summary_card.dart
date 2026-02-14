import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';

/// Individual summary card for dashboard metrics
class SummaryCard extends StatelessWidget {
  final String title;
  final double value;
  final Color backgroundColor;

  const SummaryCard({
    super.key,
    required this.title,
    required this.value,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat('#,##0', 'en_US');

    // Determine if background is dark for text contrast
    final isDark = _isDarkColor(backgroundColor);
    final textColor = isDark ? BrandColors.textLight : BrandColors.textPrimary;
    final secondaryTextColor = isDark
        ? BrandColors.textLight.withValues(alpha: 0.8)
        : BrandColors.textSecondary;

    return Container(
      padding: const EdgeInsets.all(AppSizes.md2),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
        boxShadow: [
          BoxShadow(
            color: backgroundColor.withValues(alpha: 0.3),
            blurRadius: AppSizes.sm,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title
          Text(
            title,
            style: context.small(color: secondaryTextColor, bold: true),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppSizes.sm2),
          // Value (full width)
          Text(
            'ETB ${numberFormat.format(value.toInt())}',
            style: context.body(color: textColor, bold: true),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  /// Check if color is dark for text contrast
  bool _isDarkColor(Color color) {
    final luminance = color.computeLuminance();
    return luminance < 0.5;
  }
}
