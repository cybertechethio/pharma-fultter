import 'package:flutter/material.dart';
import '../../../../core/enums/transaction_type_enum.dart';
import '../../../../core/utils/transaction_status_helper.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../shared/components/common/card_title.dart';
import '../../../../shared/components/common/vertical_bar.dart';
import '../../../../shared/utils/formatters.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../domain/entities/transaction.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;
  final VoidCallback? onTap;

  const TransactionCard({
    super.key,
    required this.transaction,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = transaction.status.getTransactionStatusColor();
    final statusText = transaction.status.isNotEmpty
        ? transaction.status[0].toUpperCase() + transaction.status.substring(1).toLowerCase()
        : transaction.status;
    final typeColor = transaction.transactionType.getColor();
    final typeText = transaction.transactionType.getDisplayLabel();
    final amountColor = _getAmountColor();

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSizes.sm),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Leading vertical bar based on type
                VerticalBar(color: typeColor),
                const SizedBox(width: AppSizes.sm),
                // Card content
                Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppSizes.md,
                  horizontal: AppSizes.sm,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name and Amount Row
                    Row(
                      children: [
                        Expanded(
                          child: cardTitle(title: _getDisplayName()),
                        ),
                        // Amount (top right)
                        Text(
                          Formatters.formatAmount(transaction.totalAmount),
                          style: context.small(
                            color: amountColor,
                            bold: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSizes.xs),
                    // Transaction Number
                    Text(
                      '#${transaction.transactionNumber}',
                      style: context.small(),
                    ),
                    const SizedBox(height: AppSizes.xs),
                    // Type, Status, and Time Row
                    Row(
                      children: [
                        // Type Badge
                        _buildTypeBadge(typeText, typeColor),
                        const SizedBox(width: AppSizes.xs),
                        // Status Badge
                        _buildStatusBadge(context, statusText, statusColor),
                        const Spacer(),
                        // Time (right side)
                        Text(
                          Formatters.formatRelativeDate(transaction.createdAt),
                          style: context.small(),
                        ),
                      ],
                    ),
                    if (_shouldShowCreatorInBottomRow() && transaction.creatorName != null) ...[
                      const SizedBox(height: AppSizes.xs),
                      Text(
                        'By: ${transaction.creatorName}',
                        style: context.small(),
                      ),
                    ],
                  ],
                ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Get display name based on transaction type
  /// Returns customer name for sales, supplier name for purchases, creator name for others
  String _getDisplayName() {
    switch (transaction.transactionType) {
      case TransactionType.sale:
        return transaction.customerName ?? 'N/A';
      case TransactionType.purchase:
        return transaction.supplierName ?? 'N/A';
      default:
        return transaction.creatorName ?? 'N/A';
    }
  }

  /// Check if creator name should be shown in bottom row (only for sale/purchase)
  bool _shouldShowCreatorInBottomRow() {
    return transaction.transactionType == TransactionType.sale ||
        transaction.transactionType == TransactionType.purchase;
  }

  /// Get color for amount based on transaction type
  /// Green for sales (money in), Red for purchases (money out), neutral for others
  Color _getAmountColor() {
    switch (transaction.transactionType) {
      case TransactionType.sale:
        return BrandColors.success; // Green for sales (revenue)
      case TransactionType.purchase:
        return BrandColors.error; // Red for purchases (expenses)
      default:
        return BrandColors.textPrimary; // Neutral for other types
    }
  }

  /// Build type badge with icon and colored background
  Widget _buildTypeBadge(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _getTypeIcon(transaction.transactionType),
            size: 14,
            color: color,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  /// Build status badge with dot and text (matching ActiveStatus pattern)
  Widget _buildStatusBadge(BuildContext context, String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: AppSizes.xs),
        Text(
          label,
          style: context.label(
            color: color,
            bold: false,
          ),
        ),
      ],
    );
  }

  /// Get icon for transaction type
  IconData _getTypeIcon(TransactionType type) {
    switch (type) {
      case TransactionType.sale:
        return Icons.point_of_sale_rounded;
      case TransactionType.purchase:
        return Icons.shopping_cart_rounded;
      case TransactionType.adjustment:
        return Icons.tune_rounded;
      case TransactionType.purchaseReverse:
      case TransactionType.saleReverse:
        return Icons.undo_rounded;
    }
  }
}

