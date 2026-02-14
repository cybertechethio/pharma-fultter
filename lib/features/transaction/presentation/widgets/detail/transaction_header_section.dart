import 'package:cyber_pos/core/enums/transaction_type_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/components/common/card_title.dart';
import '../../../../../shared/components/forms/custom_button.dart';
import '../../../../../shared/components/forms/custom_text_field.dart';
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
          color: BrandColors.outline.withValues(alpha: 0.1),
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
              // Reverse Button (only for sale, purchase, imported; hide if already reversed)
              if (!isReversed &&
                  (transaction.transactionType == TransactionType.sale ||
                   transaction.transactionType == TransactionType.purchase ||
                   transaction.transactionType == TransactionType.imported))
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
                  color: typeColor.withValues(alpha: 0.1),
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

  void _showReverseConfirmation(BuildContext context, WidgetRef ref) async {
    final note = await showDialog<String>(
      context: context,
      builder: (dialogContext) => _ReverseConfirmDialog(
        transaction: transaction,
      ),
    );
    if (note != null) {
      _reverseTransaction(ref, notes: note.isEmpty ? null : note);
    }
  }

  void _reverseTransaction(WidgetRef ref, {String? notes}) {
    ref.read(transactionProvider.notifier).reverseTransaction(
      reversesTransactionId: transaction.id,
      notes: notes,
    );
  }
}

class _ReverseConfirmDialog extends StatefulWidget {
  final Transaction transaction;

  const _ReverseConfirmDialog({required this.transaction});

  @override
  State<_ReverseConfirmDialog> createState() => _ReverseConfirmDialogState();
}

class _ReverseConfirmDialogState extends State<_ReverseConfirmDialog> {
  late final TextEditingController _notesController;

  @override
  void initState() {
    super.initState();
    _notesController = TextEditingController();
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final transaction = widget.transaction;

    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.warning_amber_rounded, color: BrandColors.warning),
          const SizedBox(width: AppSizes.sm),
          Text(l10n.reverseTransaction),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
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
                color: BrandColors.warning.withValues(alpha: 0.1),
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
            const SizedBox(height: AppSizes.md),
            CustomTextField(
              labelText: l10n.notesOptional,
              controller: _notesController,
              maxLines: 3,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(null),
          child: Text(l10n.cancel),
        ),
        CustomButton(
          text: l10n.reverse,
          color: BrandColors.warning,
          textColor: BrandColors.textLight,
          width: 120,
          onPressed: () => context.pop(_notesController.text.trim()),
        ),
      ],
    );
  }
}
