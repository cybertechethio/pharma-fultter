import 'package:flutter/material.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/utils/formatters.dart';
import '../../../domain/entities/trans_item_batch.dart';

/// Reusable tile that displays a single transaction item batch.
/// Matches the format used in transfer detail (TransferItemBatchTile).
class TransactionItemBatchTile extends StatelessWidget {
  final TransItemBatch batch;

  const TransactionItemBatchTile({
    super.key,
    required this.batch,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.sm,
        vertical: AppSizes.xs,
      ),
      decoration: BoxDecoration(
        color: BrandColors.surfaceContainerHighest.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(AppSizes.radiusXs),
        border: Border.all(color: BrandColors.outline.withValues(alpha: 0.08)),
      ),
      child: Row(
        children: [
          Icon(
            Icons.inventory_2_outlined,
            size: AppSizes.iconSizeSm,
            color: BrandColors.primary,
          ),
          const SizedBox(width: AppSizes.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  batch.batchNumber,
                  style: context.small(bold: true),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (batch.costPrice != null ||
                    batch.unitPrice != null ||
                    batch.expirationDate != null) ...[
                  const SizedBox(height: AppSizes.xxs),
                  Wrap(
                    spacing: AppSizes.sm,
                    runSpacing: AppSizes.xxs,
                    children: [
                      if (batch.costPrice != null)
                        _Chip(
                          label: l10n.costPrice,
                          value: _formatPrice(batch.costPrice!),
                        ),
                      if (batch.unitPrice != null)
                        _Chip(
                          label: l10n.unitPrice,
                          value: _formatPrice(batch.unitPrice!),
                        ),
                      if (batch.expirationDate != null)
                        _Chip(
                          label: l10n.expirationDate,
                          value: Formatters.formatDateTime(batch.expirationDate!),
                        ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: AppSizes.xs),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.xs,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              color: BrandColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppSizes.radiusXs2),
            ),
            child: Text(
              '×${batch.quantity}',
              style: context.smallPrimary(bold: true),
            ),
          ),
        ],
      ),
    );
  }

  static String _formatPrice(double value) => value.toStringAsFixed(2);
}

class _Chip extends StatelessWidget {
  final String label;
  final String value;

  const _Chip({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$label: $value',
      style: context.label(),
    );
  }
}
