import 'package:flutter/material.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../core/enums/transaction_type_enum.dart';

class TransactionTypeFilterCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color? color;
  final bool isSelected;
  final VoidCallback onTap;

  const TransactionTypeFilterCard({
    super.key,
    required this.label,
    required this.icon,
    this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cardColor = color ?? BrandColors.primary;
    
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.radiusXs),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.xs),
        margin: const EdgeInsets.only(right: AppSizes.xs),
        decoration: BoxDecoration(
          color: isSelected
              ? cardColor.withOpacity(0.15)
              : BrandColors.background,
          borderRadius: BorderRadius.circular(AppSizes.radiusXs),
          border: Border.all(
            color: isSelected ? cardColor : BrandColors.divider,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? cardColor : BrandColors.textSecondary,
              size: 18,
            ),
            const SizedBox(width: AppSizes.xs),
            Text(
              label,
              style: context.small(
                color: isSelected ? cardColor : BrandColors.textSecondary,
                bold: isSelected,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
