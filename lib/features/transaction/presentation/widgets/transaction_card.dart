import 'package:flutter/material.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../shared/components/common/card_title.dart';
import '../../../../shared/utils/formatters.dart';
import '../../../../core/enums/transaction_type_enum.dart';
import '../../../../core/enums/transaction_status_enum.dart';
import '../../domain/entities/transaction.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;
  final VoidCallback? onTap;

  const TransactionCard({
    super.key,
    required this.transaction,
    this.onTap,
  });

  /// Get customer/supplier name or "Walking" for sale/purchase
  String _getDisplayName() {
    if (transaction.transactionType == TransactionType.sale) {
      return transaction.customerName ?? 'Walking';
    } else if (transaction.transactionType == TransactionType.purchase) {
      return transaction.supplierName ?? 'Walking';
    }
    return transaction.customerName ?? transaction.supplierName ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final displayName = _getDisplayName();
    final status = transaction.status.toLowerCase() == 'reversed'
        ? TransactionStatus.reversed
        : TransactionStatus.completed;
    final showName = transaction.transactionType == TransactionType.sale ||
        transaction.transactionType == TransactionType.purchase;

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSizes.radiusSm),
      child: Material(
        color: BrandColors.transparent,
        child: InkWell(
          onTap: onTap,
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(width: AppSizes.sm),
                // Left content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppSizes.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Customer/Supplier/Walking name
                        if (showName)
                          cardTitle(title: displayName),
                        if (showName) const SizedBox(height: AppSizes.xs),
                        // Transaction number
                        Text(
                          transaction.transactionNumber,
                          style: context.small(),
                        ),
                        const SizedBox(height: AppSizes.xs),
                        // Type badge
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppSizes.xs,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: transaction.transactionType.getColor().withOpacity(0.1),
                                borderRadius: BorderRadius.circular(AppSizes.radiusXs),
                              ),
                              child: Text(
                                transaction.transactionType.getDisplayLabel(),
                                style: context.small(
                                  color: transaction.transactionType.getColor(),
                                  bold: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Creator name if exists
                        if (transaction.creatorName != null) ...[
                          const SizedBox(height: AppSizes.xs),
                          Text(
                            'by ${transaction.creatorName!}',
                            style: context.small(),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                // Right content
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSizes.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Status badge
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: status.getColor(),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: AppSizes.xs),
                          Text(
                            status.getDisplayText(),
                            style: context.label(
                              color: status.getColor(),
                              bold: false,
                            ),
                          ),
                        ],
                      ),
                      // Total amount
                      Text(
                        Formatters.formatCurrency(transaction.totalAmount),
                        style: context.subtitle(
                          bold: true,
                          color: BrandColors.primary,
                        ),
                      ),
                      // Date
                      Text(
                        Formatters.formatDateTime(transaction.createdAt),
                        style: context.small(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppSizes.sm),
                Icon(
                  Icons.chevron_right,
                  color: BrandColors.textSecondary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
