import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../app/theme/text_styles.dart';

/// Reusable summary card for sales report metrics
/// Displays: title, value with ETB currency, icon with colored background, colored border
class SalesSummaryCard extends StatelessWidget {
  final String title;
  final double value;
  final IconData icon;
  final Color borderColor;
  final Color iconBackgroundColor;

  const SalesSummaryCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.borderColor,
    required this.iconBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat('#,##0.00', 'en_US');

    return Container(
      padding: const EdgeInsets.all(AppSizes.sm),
      decoration: BoxDecoration(
        color: BrandColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
        border: Border.all(
          color: borderColor,
          width: AppSizes.br,
        ),
        boxShadow: [
          BoxShadow(
            color: BrandColors.shadow.withValues(alpha: 0.05),
            blurRadius: AppSizes.xs,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon and Title on same row
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(AppSizes.xxs),
                decoration: BoxDecoration(
                  color: iconBackgroundColor,
                  borderRadius: BorderRadius.circular(AppSizes.radiusXs),
                ),
                child: Icon(
                  icon,
                  color: BrandColors.textLight,
                  size: AppSizes.iconSizeSm,
                ),
              ),
              const SizedBox(width: AppSizes.xs),
              Flexible(
                child: Text(
                  title,
                  style: context.small(bold: true),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.xxs),
          // Value
          Text(
            'ETB ${numberFormat.format(value)}',
            style: context.body(bold: true),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

