import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';

/// Metric card for dashboard - light background
class MetricCard extends StatelessWidget {
  final String title;
  final double value;
  final IconData icon;
  final Color iconColor;

  const MetricCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat('#,##0', 'en_US');

    return Container(
      padding: const EdgeInsets.all(AppSizes.md2),
      decoration: BoxDecoration(
        color: BrandColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
        border: Border.all(
          color: BrandColors.border.withValues(alpha: 0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: BrandColors.shadow,
            blurRadius: AppSizes.sm,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon and Title row (like SummaryCard)
          Row(
            children: [
              // Icon
              Container(
                padding: const EdgeInsets.all(AppSizes.sm),
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: AppSizes.iconSize,
                ),
              ),
              const SizedBox(width: AppSizes.sm2),
              // Title
              Expanded(
                child: Text(
                  title,
                  style: context.small(color: BrandColors.textSecondary, bold: true),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.xs),
          // Value (full width)
          Text(
            'ETB ${numberFormat.format(value.toInt())}',
            style: context.body(color: BrandColors.textPrimary, bold: true),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
