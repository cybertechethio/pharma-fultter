import 'package:flutter/material.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';

class BestSellerReportFilterButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool hasActiveFilters;

  const BestSellerReportFilterButton({
    super.key,
    required this.onTap,
    this.hasActiveFilters = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: BrandColors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        child: Container(
          padding: const EdgeInsets.all(AppSizes.sm),
          decoration: BoxDecoration(
            color: hasActiveFilters
                ? BrandColors.primary.withOpacity(0.1)
                : BrandColors.transparent,
            borderRadius: BorderRadius.circular(AppSizes.radiusMd),
            border: Border.all(
              color: hasActiveFilters
                  ? BrandColors.primary
                  : BrandColors.divider,
              width: AppSizes.br,
            ),
          ),
          child: Icon(
            Icons.filter_list,
            size: AppSizes.iconSize,
            color: hasActiveFilters
                ? BrandColors.primary
                : BrandColors.textSecondary,
          ),
        ),
      ),
    );
  }
}

