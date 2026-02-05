import 'package:flutter/material.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../domain/entities/transfer.dart';
import '../../../domain/entities/transfer_item.dart';

class TransferItemsSection extends StatelessWidget {
  final Transfer transfer;

  const TransferItemsSection({
    super.key,
    required this.transfer,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final items = transfer.transferItems;

    return Container(
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        color: BrandColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radius),
        border: Border.all(color: BrandColors.outline.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(l10n.items, style: context.subtitle(bold: true)),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.sm,
                  vertical: AppSizes.xxs,
                ),
                decoration: BoxDecoration(
                  color: BrandColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSizes.radius),
                ),
                child: Text(
                  '${items.length}',
                  style: context.smallPrimary(bold: true),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.md),
          if (items.isEmpty)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.lg),
                child: Text(l10n.noItems, style: context.body()),
              ),
            )
          else
            ...items.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              return Column(
                children: [
                  _ItemCard(item: item, index: index + 1),
                  if (index < items.length - 1) const SizedBox(height: AppSizes.sm),
                ],
              );
            }),
        ],
      ),
    );
  }
}

class _ItemCard extends StatelessWidget {
  final TransferItem item;
  final int index;

  const _ItemCard({
    required this.item,
    required this.index,
  });

  String _formatDouble(double? value) => value?.toStringAsFixed(2) ?? '0.00';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: BrandColors.surfaceContainerHighest.withOpacity(0.3),
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
        border: Border.all(color: BrandColors.outline.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: AppSizes.xxl,
                height: AppSizes.xxl,
                decoration: BoxDecoration(
                  color: BrandColors.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  '$index',
                  style: context.smallPrimary(bold: true),
                ),
              ),
              const SizedBox(width: AppSizes.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.itemName,
                      style: context.body(bold: true),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (item.itemCode != null) ...[
                      const SizedBox(height: AppSizes.xxs),
                      Text(
                        'Code: ${item.itemCode}',
                        style: context.small(),
                      ),
                    ],
                  ],
                ),
              ),
              Text(
                'Qty: ${_formatDouble(item.quantity)}',
                style: context.bodyPrimary(bold: true),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

