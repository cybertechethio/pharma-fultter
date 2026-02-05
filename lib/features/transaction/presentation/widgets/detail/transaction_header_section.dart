import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/components/common/card_title.dart';
import '../../../../../core/enums/transaction_type_enum.dart';
import '../../../../../core/enums/transaction_status_enum.dart';
import '../../../domain/entities/transaction.dart';
import '../../providers/transaction_notifier.dart';
import '../../providers/transaction_loading_providers.dart';

class TransactionHeaderSection extends ConsumerWidget {
  final Transaction transaction;

  const TransactionHeaderSection({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final status = TransactionStatusExtension.fromString(transaction.status);
    final typeColor = transaction.transactionType.getColor();
    final statusColor = status.getColor();
    final isReversed = status == TransactionStatus.reversed;
    final isReverseLoading = ref.watch(transactionReverseLoadingProvider);

    return Container(
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        color: BrandColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radius),
        border: Border.all(
          color: BrandColors.outline.withOpacity(0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Transaction Number + Reverse Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: cardTitle(title: transaction.transactionNumber),
              ),
              const SizedBox(width: AppSizes.sm),
              // Reverse Button (only show if not already reversed)
              if (!isReversed)
                SizedBox(
                  height: AppSizes.xxxl,
                  child: OutlinedButton.icon(
                    onPressed: isReverseLoading
                        ? null
                        : () => _showReverseConfirmation(context, ref),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: BrandColors.warning,
                      side: BorderSide(color: BrandColors.warning),
                      padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
                      visualDensity: VisualDensity.compact,
                    ),
                    icon: isReverseLoading
                        ? SizedBox(
                            width: AppSizes.md2,
                            height: AppSizes.md2,
                            child: CircularProgressIndicator(
                              strokeWidth: AppSizes.loaderStrokeWidth,
                              valueColor: AlwaysStoppedAnimation<Color>(BrandColors.warning),
                            ),
                          )
                        : Icon(Icons.undo, size: AppSizes.iconSizeSm),
                    label: Text(
                      l10n.reverse,
                      style: context.small(color: BrandColors.warning, bold: true),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: AppSizes.md),
          // Type and Status Badges
          Row(
            children: [
              // Type Badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.sm,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: typeColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      transaction.transactionType.getIcon(),
                      size: AppSizes.iconSizeSm,
                      color: typeColor,
                    ),
                    const SizedBox(width: AppSizes.xs),
                    Text(
                      transaction.transactionType.getDisplayLabel(),
                      style: context.small(color: typeColor, bold: true),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSizes.sm),
              // Status Badge
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: AppSizes.sm,
                    height: AppSizes.sm,
                    decoration: BoxDecoration(
                      color: statusColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: AppSizes.xs2),
                  Text(
                    status.getDisplayText(),
                    style: context.small(color: statusColor),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showReverseConfirmation(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: BrandColors.warning),
            const SizedBox(width: AppSizes.sm),
            Text(l10n.reverseTransaction),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.confirmReverseTransaction,
              style: context.body(),
            ),
            const SizedBox(height: AppSizes.sm),
            Text(
              l10n.transactionLabel(transaction.transactionNumber),
              style: context.small(bold: true),
            ),
            const SizedBox(height: AppSizes.md),
            Container(
              padding: const EdgeInsets.all(AppSizes.sm),
              decoration: BoxDecoration(
                color: BrandColors.warning.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppSizes.radiusSm),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, size: AppSizes.iconSizeSm, color: BrandColors.warning),
                  const SizedBox(width: AppSizes.xs),
                  Expanded(
                    child: Text(
                      l10n.thisActionCannotBeUndone,
                      style: context.small(color: BrandColors.warning),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(l10n.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              _reverseTransaction(ref);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: BrandColors.warning,
              foregroundColor: BrandColors.textLight,
            ),
            child: Text(l10n.reverse),
          ),
        ],
      ),
    );
  }

  void _reverseTransaction(WidgetRef ref) {
    ref.read(transactionProvider.notifier).reverseTransaction(
      transactionType: TransactionType.reverse,
      reversesTransactionId: transaction.id,
    );
  }
}
