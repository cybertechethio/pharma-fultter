import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../domain/entities/expensereport/expense_item_data.dart';

/// Compact table-like card for expense report items
/// Displays: expenseName, category, date, amount, paymentMethod
/// Uses 2-4 lines as needed to show all data without truncation
class ExpenseItemCard extends StatelessWidget {
  final ExpenseItemData item;

  const ExpenseItemCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('MMM dd, yyyy');
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
          // Line 1: Expense Name + Amount (right aligned)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  item.expenseName,
                  style: context.body(bold: true),
                ),
              ),
              const SizedBox(width: AppSizes.sm),
              Text(
                'ETB ${currencyFormat.format(item.amount)}',
                style: context.body(bold: true, color: BrandColors.error),
              ),
            ],
          ),
          // Line 2: Category (if exists) + Date + Payment Method
          const SizedBox(height: AppSizes.xxs),
          Wrap(
            spacing: AppSizes.sm,
            runSpacing: AppSizes.xxs,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              if (item.category != null && item.category!.isNotEmpty)
                Text(
                  item.category!,
                  style: context.small(),
                ),
              Text(
                dateFormat.format(item.date),
                style: context.small(),
              ),
              if (item.paymentMethod != null && item.paymentMethod!.isNotEmpty)
                Text(
                  item.paymentMethod!,
                  style: context.small(),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

