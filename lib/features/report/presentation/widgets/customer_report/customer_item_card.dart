import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../domain/entities/customerreport/customer_item_data.dart';

/// Compact table-like card for customer report items
/// Displays: customerName, totalOrders, totalAmount, paidAmount, dueAmount, code
/// Uses 2-4 lines as needed to show all data without truncation
class CustomerItemCard extends StatelessWidget {
  final CustomerItemData item;

  const CustomerItemCard({
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
          // Line 1: Customer Name + Total Orders
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  item.customerName,
                  style: context.body(bold: true),
                ),
              ),
              const SizedBox(width: AppSizes.sm),
              Text(
                'Orders: ${item.totalOrders}',
                style: context.body(),
              ),
            ],
          ),
          // Line 2: Code (if exists) + Total Amount (right aligned)
          const SizedBox(height: AppSizes.xxs),
          Row(
            children: [
              if (item.code != null && item.code!.isNotEmpty)
                Text(
                  'Code: ${item.code}',
                  style: context.small(),
                ),
              const Spacer(),
              Text(
                'ETB ${currencyFormat.format(item.totalAmount)}',
                style: context.small(bold: true, color: BrandColors.primary),
              ),
            ],
          ),
          // Line 3: Paid Amount + Due Amount
          const SizedBox(height: AppSizes.xxs),
          Wrap(
            spacing: AppSizes.sm,
            runSpacing: AppSizes.xxs,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                'Paid: ETB ${currencyFormat.format(item.paidAmount)}',
                style: context.small(color: BrandColors.success),
              ),
              Text(
                'Due: ETB ${currencyFormat.format(item.dueAmount)}',
                style: context.small(color: BrandColors.error),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

