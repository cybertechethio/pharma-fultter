import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../domain/entities/annualreport/annual_item_data.dart';

/// Card for annual report item
/// Displays: Item Type, Sales, Cost, VAT, Gross Profit
class AnnualItemCard extends StatelessWidget {
  final AnnualItemData item;

  const AnnualItemCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat('#,##0.00', 'en_US');

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
          // Line 1: Item Type
          Text(
            item.itemType,
            style: context.body(bold: true),
          ),
          const SizedBox(height: AppSizes.xxs),
          // Line 2: Sales + Cost
          Row(
            children: [
              Expanded(
                child: Text(
                  'Sales: ETB ${currencyFormat.format(item.sales)}',
                  style: context.small(),
                ),
              ),
              Expanded(
                child: Text(
                  'Cost: ETB ${currencyFormat.format(item.cost)}',
                  style: context.small(),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.xxs),
          // Line 3: VAT + Gross Profit
          Row(
            children: [
              Expanded(
                child: Text(
                  'VAT: ETB ${currencyFormat.format(item.vat)}',
                  style: context.small(),
                ),
              ),
              Expanded(
                child: Text(
                  'Gross Profit: ETB ${currencyFormat.format(item.grossProfit)}',
                  style: context.small(
                    bold: true,
                    color: item.grossProfit >= 0
                        ? BrandColors.success
                        : BrandColors.error,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

