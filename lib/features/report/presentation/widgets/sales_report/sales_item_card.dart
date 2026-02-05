import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../domain/entities/salesreport/sales_item_data.dart';

/// Compact table-like card for sales report items
/// Displays: itemName, itemCode, qty, totalAmount, date, instockQty
/// Uses 2-4 lines as needed to show all data without truncation
class SalesItemCard extends StatelessWidget {
  final SalesItemData item;

  const SalesItemCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('MMM dd, yyyy');
    final currencyFormat = NumberFormat('#,##0.00', 'en_US');

    return Container(
      // margin: const EdgeInsets.symmetric(
      //   horizontal: AppSizes.sm,
      //   vertical: AppSizes.xxs,
      // ),
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
          // Line 1: Item Name (can wrap) + Qty + Total Amount
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
                'Qty: ${item.quantity}',
                style: context.body(),
              ),
              const SizedBox(width: AppSizes.sm),
              Text(
                'ETB ${currencyFormat.format(item.totalAmount)}',
                style: context.body(bold: true, color: BrandColors.success),
              ),
            ],
          ),
          // Line 2: Item Code (if exists) + Date + In Stock Qty
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
              Text(
                dateFormat.format(item.date),
                style: context.small(),
              ),
              Text(
                'In Stock: ${item.instockQty}',
                style: context.small(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

