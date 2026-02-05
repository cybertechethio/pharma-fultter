import 'package:flutter/material.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/card_title.dart';
import '../../../../core/enums/stock_movement_type_enum.dart';
import '../../../../core/enums/stock_movement_status_enum.dart';
import '../../domain/entities/stock_movement.dart';

class StockMovementHeaderSection extends StatelessWidget {
  final StockMovement stockMovement;

  const StockMovementHeaderSection({
    super.key,
    required this.stockMovement,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final typeColor = stockMovement.type.getColor();
    final statusColor = stockMovement.status.getColor();
    final item = stockMovement.item;

    return Container(
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        color: BrandColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radius),
        border: Border.all(
          color: BrandColors.outline.withOpacity(0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Item Name
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: cardTitle(
                  title: item?.name ?? l10n.unknownItem,
                ),
              ),
              const SizedBox(width: AppSizes.sm),
              // Status Badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.sm,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSizes.radiusXs2),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      stockMovement.status.getIcon(),
                      size: AppSizes.iconSizeSm,
                      color: statusColor,
                    ),
                    const SizedBox(width: AppSizes.xs),
                    Text(
                      stockMovement.status.getDisplayText(),
                      style: context.small(color: statusColor, bold: true),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.md),
          // Type Badge and Item Code
          Row(
            children: [
              // Type Badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.sm,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: typeColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSizes.radiusXs2),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      stockMovement.type.getIcon(),
                      size: AppSizes.iconSizeSm,
                      color: typeColor,
                    ),
                    const SizedBox(width: AppSizes.xs),
                    Text(
                      stockMovement.type.getDisplayLabel(),
                      style: context.small(color: typeColor, bold: true),
                    ),
                  ],
                ),
              ),
              if (item?.code != null) ...[
                const SizedBox(width: AppSizes.sm),
                // Code Badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.sm,
                    vertical: 4,
                  ),
                decoration: BoxDecoration(
                  color: BrandColors.surfaceVariant,
                  borderRadius: BorderRadius.circular(AppSizes.xs2),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.qr_code_outlined,
                      size: AppSizes.lg,
                      color: BrandColors.textSecondary,
                    ),
                    const SizedBox(width: AppSizes.xs),
                    Text(
                      item!.code!,
                      style: context.smallSecondary(),
                    ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
