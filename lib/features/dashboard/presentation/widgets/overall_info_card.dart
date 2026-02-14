import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../domain/entities/overall_info.dart';

/// Overall Information card widget
class OverallInfoCard extends StatelessWidget {
  final OverallInfo overallInfo;

  const OverallInfoCard({
    super.key,
    required this.overallInfo,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        color: BrandColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
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
        children: [
          // Header
          Row(
            children: [
              Icon(
                Icons.info_outline_rounded,
                color: BrandColors.primary,
                size: AppSizes.iconSize,
              ),
              const SizedBox(width: AppSizes.sm),
              Text(
                l10n.overallInformation,
                style: context.title(color: BrandColors.textPrimary, bold: true),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.xl),

          // Info items row
          Row(
            children: [
              Expanded(
                child: _InfoItem(
                  icon: Icons.person_outline_rounded,
                  iconColor: BrandColors.purchase,
                  label: l10n.suppliers,
                  value: overallInfo.suppliers.toString(),
                ),
              ),
              Expanded(
                child: _InfoItem(
                  icon: Icons.groups_outlined,
                  iconColor: BrandColors.chartExpenseBar,
                  label: l10n.customers,
                  value: overallInfo.customers.toString(),
                ),
              ),
              Expanded(
                child: _InfoItem(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: BrandColors.returnColor,
                  label: l10n.orders,
                  value: overallInfo.orders.toString(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Individual info item widget
class _InfoItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;

  const _InfoItem({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.lg,
        horizontal: AppSizes.sm,
      ),
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.xs),
      decoration: BoxDecoration(
        color: BrandColors.inputBackground,
        borderRadius: BorderRadius.circular(AppSizes.radius),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: iconColor,
            size: AppSizes.iconSizeLg + 4,
          ),
          const SizedBox(height: AppSizes.md),
          Text(
            label,
            style: context.small(color: BrandColors.textSecondary),
          ),
          const SizedBox(height: AppSizes.xs),
          Text(
            value,
            style: context.title(color: BrandColors.textPrimary, bold: true)
                .copyWith(fontSize: AppSizes.fontSizeSubtitle),
          ),
        ],
      ),
    );
  }
}
