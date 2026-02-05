import 'package:flutter/material.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/utils/formatters.dart';
import '../../../domain/entities/transaction.dart';
import '../../../domain/entities/trans_item.dart';

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
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                ),
                child: Text(
                  '${items.length}',
                  style: context.small(color: BrandColors.primary, bold: true),
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

  String _formatDouble(double? value) => value?.toStringAsFixed(2) ?? '0.00';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

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
          // Header: Name and Total
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Index badge
              Container(
                width: AppSizes.iconSizeLg,
                height: AppSizes.iconSizeLg,
                decoration: BoxDecoration(
                  color: BrandColors.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  '$index',
                  style: context.small(color: BrandColors.primary, bold: true),
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
                      l10n.itemCodeLabel(item.itemCode),
                      style: context.small(),
                    ),
                  ],
                ),
              ),
              Text(
                Formatters.formatCurrency(item.total),
                style: context.body(bold: true, color: BrandColors.primary),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.sm),
          const Divider(height: AppSizes.xxs),
          const SizedBox(height: AppSizes.sm),
          // Details Grid
          Row(
            children: [
              Expanded(child: _DetailCell(label: l10n.qty, value: _formatDouble(item.quantity))),
              Expanded(child: _DetailCell(label: l10n.unitPrice, value: Formatters.formatCurrency(item.unitPrice))),
              Expanded(child: _DetailCell(label: l10n.costPrice, value: Formatters.formatCurrency(item.costPrice))),
            ],
          ),
          const SizedBox(height: AppSizes.xs),
          Row(
            children: [
              Expanded(child: _DetailCell(label: l10n.taxRate, value: '${_formatDouble(item.taxRate)}%')),
              Expanded(child: _DetailCell(label: l10n.taxableAmt, value: Formatters.formatCurrency(item.taxableAmount ?? 0))),
              Expanded(child: _DetailCell(label: l10n.taxAmt, value: Formatters.formatCurrency(item.taxAmount ?? 0))),
            ],
          ),
        ],
      ),
    );
  }
}

class _DetailCell extends StatelessWidget {
  final String label;
  final String value;

  const _DetailCell({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: context.caption()),
        const SizedBox(height: AppSizes.xxs),
        Text(value, style: context.small(bold: true)),
      ],
    );
  }
}
