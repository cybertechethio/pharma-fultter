import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../../../core/enums/transaction_type_enum.dart';
import '../../../../../core/enums/transaction_status_enum.dart';
import '../../../../../routes/route_name.dart';
import '../../../../transaction/domain/entities/transaction.dart';

class SupplierCustomerTransactionCard extends StatelessWidget {
  final Transaction transaction;

  const SupplierCustomerTransactionCard({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final typeColor = transaction.transactionType.getColor();
    final status = TransactionStatusExtension.fromString(transaction.status);

    return Container(
      margin: const EdgeInsets.only(bottom: AppSizes.sm),
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: BrandColors.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(AppSizes.sm),
      ),
      child: Row(
        children: [
          // Type badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm, vertical: AppSizes.xs),
            decoration: BoxDecoration(
              color: typeColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppSizes.xs),
            ),
            child: Text(
              transaction.transactionType.getDisplayLabel(),
              style: context.small(bold: true, color: typeColor),
            ),
          ),
          const SizedBox(width: AppSizes.sm),
          // Number and Status
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.transactionNumber,
                  style: context.body(bold: true),
                ),
                const SizedBox(height: AppSizes.xxs),
                Text(
                  status.getDisplayText(),
                  style: context.small(color: status.getColor()),
                ),
              ],
            ),
          ),
          // Amount
          Text(
            NumberFormat.currency(symbol: '', decimalDigits: 2).format(transaction.totalAmount),
            style: context.body(bold: true),
          ),
          const SizedBox(width: AppSizes.sm),
          // View button
          IconButton(
            onPressed: () => context.push(RouteName.transactionDetail, extra: transaction.id),
            icon: Icon(Icons.visibility_outlined, size: AppSizes.iconSize, color: BrandColors.primary),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: AppSizes.xxxl, minHeight: AppSizes.xxxl),
            tooltip: 'View details',
          ),
        ],
      ),
    );
  }
}

