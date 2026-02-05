import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../domain/entities/bestsellerreport/best_seller.dart';

/// Compact table-like card for best seller report items
/// Displays: itemName, itemCode, category, soldQty, soldAmount, instockQty
/// Uses 2-4 lines as needed to show all data without truncation
class BestSellerItemCard extends StatelessWidget {
  final BestSeller item;

  const BestSellerItemCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat('#,##0.00', 'en_US');
    final numberFormat = NumberFormat('#,##0', 'en_US');

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.md,
        vertical: AppSizes.sm,
      ),
      decoration: BoxDecoration(
        color: BrandColors.cardBackground,
        border: Border(
          bottom: BorderSide(
            color: BrandColors.divider,
            width: AppSizes.br,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Line 1: Item Name + Sold Amount (right aligned)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  item.itemName,
                  style: context.body(bold: true),
                ),
              ),
              const SizedBox(width: AppSizes.sm),
              Text(
                'ETB ${currencyFormat.format(item.soldAmount)}',
                style: context.body(bold: true, color: BrandColors.success),
              ),
            ],
          ),
          // Line 2: Item Code (if exists) + Category (if exists)
          const SizedBox(height: AppSizes.xxs),
          Wrap(
            spacing: AppSizes.sm,
            runSpacing: AppSizes.xxs,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              if (item.itemCode != null && item.itemCode!.isNotEmpty)
                Text(
                  'Code: ${item.itemCode}',
                  style: context.small(),
                ),
              if (item.category != null && item.category!.isNotEmpty)
                Text(
                  item.category!,
                  style: context.small(),
                ),
            ],
          ),
          // Line 3: Sold Qty + In Stock Qty
          const SizedBox(height: AppSizes.xxs),
          Wrap(
            spacing: AppSizes.sm,
            runSpacing: AppSizes.xxs,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                'Sold: ${numberFormat.format(item.soldQty)}',
                style: context.small(bold: true, color: BrandColors.primary),
              ),
              Text(
                'In Stock: ${numberFormat.format(item.instockQty)}',
                style: context.small(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

