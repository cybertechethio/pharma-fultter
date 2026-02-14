import 'package:flutter/material.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../domain/entities/transaction.dart';
import '../../../domain/entities/trans_item.dart';
import 'transaction_item_batch_tile.dart';

class TransactionItemsSection extends StatelessWidget {
  final Transaction transaction;

  const TransactionItemsSection({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final items = transaction.items;

    return Container(
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        color: BrandColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radius),
        border: Border.all(color: BrandColors.outline.withValues(alpha: 0.1)),
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
                  color: BrandColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
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
  final TransItem item;
  final int index;

  const _ItemCard({
    required this.item,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final batches = item.batches;

    return Container(
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: BrandColors.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
        border: Border.all(color: BrandColors.outline.withValues(alpha: 0.1)),
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
                  color: BrandColors.primary.withValues(alpha: 0.1),
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
                    const SizedBox(height: AppSizes.xxs),
                    Text(
                      '${AppLocalizations.of(context).itemCode}: ${item.itemCode}',
                      style: context.small(),
                    ),
                  ],
                ),
              ),
              Text(
                '${AppLocalizations.of(context).qty}: ${item.quantity}',
                style: context.bodyPrimary(bold: true),
              ),
            ],
          ),
          if (batches.isNotEmpty) ...[
            const SizedBox(height: AppSizes.sm),
            const Divider(height: AppSizes.xs),
            const SizedBox(height: AppSizes.xs),
            Text(l10n.batches, style: context.small(bold: true)),
            const SizedBox(height: AppSizes.xs),
            ...batches.map(
              (batch) => Padding(
                padding: const EdgeInsets.only(bottom: AppSizes.xs),
                child: TransactionItemBatchTile(batch: batch),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
