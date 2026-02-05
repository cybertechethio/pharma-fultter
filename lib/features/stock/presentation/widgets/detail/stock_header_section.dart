import 'package:flutter/material.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/components/common/card_title.dart';
import '../../../../../core/enums/stock_status_enum.dart';
import '../../../domain/entities/stock.dart';

class StockHeaderSection extends StatelessWidget {
  final Stock stock;

  const StockHeaderSection({
    super.key,
    required this.stock,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final statusColor = stock.lowStockStatus.getColor();
    final item = stock.item;

    return Container(
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(AppSizes.radius),
        border: Border.all(
          color: colorScheme.outline.withOpacity(0.1),
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
                child: cardTitle(title: item?.name ?? l10n.unknownItem),
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
                      stock.lowStockStatus.getIcon(),
                      size: 16,
                      color: statusColor,
                    ),
                    const SizedBox(width: AppSizes.xs),
                    Text(
                      stock.lowStockStatus.getDisplayText(),
                      style: context.small(color: statusColor, bold: true),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.md),
          // Quantity and Code
          Row(
            children: [
              // Quantity Badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.sm,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(AppSizes.radiusXs2),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.inventory_2_outlined,
                      size: 16,
                      color: colorScheme.onPrimaryContainer,
                    ),
                    const SizedBox(width: AppSizes.xs),
                    Text(
                      l10n.quantityLabel(stock.totalQuantity.toString()),
                      style: context.small(
                        color: colorScheme.onPrimaryContainer,
                        bold: true,
                      ),
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
                    color: colorScheme.surfaceVariant,
                    borderRadius: BorderRadius.circular(AppSizes.radiusXs2),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.qr_code_outlined,
                        size: 16,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: AppSizes.xs),
                      Text(
                        item!.code!,
                        style: context.small(
                          color: colorScheme.onSurfaceVariant,
                        ),
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

