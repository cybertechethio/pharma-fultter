import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/components/common/card_title.dart';
import '../../../../../core/enums/transfer_type_enum.dart';
import '../../../../../core/enums/transfer_status_enum.dart';
import '../../../domain/entities/transfer.dart';
import '../../providers/transfer_notifier.dart';
import '../../providers/transfer_loading_providers.dart';

class TransferHeaderSection extends ConsumerWidget {
  final Transfer transfer;

  const TransferHeaderSection({
    super.key,
    required this.transfer,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final typeColor = transfer.transferType.getColor();
    final status = TransferStatusExtension.fromString(transfer.status);
    final statusColor = status.getColor();
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
          // Transfer Number
          cardTitle(title: transfer.transferNumber),
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
                  borderRadius: BorderRadius.circular(AppSizes.radiusXs2),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      transfer.transferType.getIcon(),
                      size: AppSizes.iconSizeSm,
                      color: typeColor,
                    ),
                    const SizedBox(width: AppSizes.xs),
                    Text(
                      transfer.transferType.getDisplayLabel(),
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
                    status.getDisplayLabel(),
                    style: context.small(color: statusColor),
                  ),
                ],
              ),
            ],
          ),
          // Action Buttons - Only show for transfer_in with pending status
          if (transfer.transferType == TransferType.transferIn && 
              transfer.status.toLowerCase() == 'pending') ...[
            const SizedBox(height: AppSizes.lg),
            const Divider(height: AppSizes.xxs),
            const SizedBox(height: AppSizes.md),
            Wrap(
              spacing: AppSizes.sm,
              runSpacing: AppSizes.sm,
              children: [
                // Accept Button
                _ActionButton(
                  label: l10n.accept,
                  icon: Icons.check_circle_outline,
                  color: BrandColors.success,
                  isLoading: ref.watch(transferStatusUpdateLoadingProvider).contains(transfer.id),
                  isDisabled: ref.watch(transferStatusUpdateLoadingProvider).contains(transfer.id),
                  onPressed: () => _showAcceptConfirmation(context, ref),
                ),
                // Reject Button
                _ActionButton(
                  label: l10n.reject,
                  icon: Icons.cancel_outlined,
                  color: BrandColors.error,
                  isLoading: ref.watch(transferStatusUpdateLoadingProvider).contains(transfer.id),
                  isDisabled: ref.watch(transferStatusUpdateLoadingProvider).contains(transfer.id),
                  onPressed: () => _showRejectConfirmation(context, ref),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  void _showAcceptConfirmation(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    _showConfirmationDialog(
      context: context,
      title: l10n.acceptTransfer,
      message: l10n.confirmAcceptTransfer,
      icon: Icons.check_circle_outline,
      iconColor: BrandColors.success,
      confirmLabel: l10n.accept,
      confirmColor: BrandColors.success,
      onConfirm: () {
        ref.read(transferProvider.notifier).updateTransferStatus(
          id: transfer.id,
          status: 'completed',
        );
      },
    );
  }

  void _showRejectConfirmation(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    _showConfirmationDialog(
      context: context,
      title: l10n.rejectTransfer,
      message: l10n.confirmRejectTransfer,
      icon: Icons.cancel_outlined,
      iconColor: BrandColors.error,
      confirmLabel: l10n.reject,
      confirmColor: BrandColors.error,
      warningText: 'This action cannot be undone.',
      onConfirm: () {
        ref.read(transferProvider.notifier).updateTransferStatus(
          id: transfer.id,
          status: 'rejected',
        );
      },
    );
  }

  void _showConfirmationDialog({
    required BuildContext context,
    required String title,
    required String message,
    required IconData icon,
    required Color iconColor,
    required String confirmLabel,
    required Color confirmColor,
    String? warningText,
    required VoidCallback onConfirm,
  }) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Row(
          children: [
            Icon(icon, color: iconColor),
            const SizedBox(width: AppSizes.sm),
            Text(title),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message, style: context.body()),
            const SizedBox(height: AppSizes.sm),
            Text(
              'Transfer: ${transfer.transferNumber}',
              style: context.small(bold: true),
            ),
            if (warningText != null) ...[
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
                        warningText,
                        style: context.small(color: BrandColors.warning),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(AppLocalizations.of(context).cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              onConfirm();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: confirmColor,
              foregroundColor: BrandColors.textLight,
            ),
            child: Text(confirmLabel),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final bool isLoading;
  final bool isDisabled;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.isLoading,
    required this.isDisabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.xxxl,
      child: OutlinedButton.icon(
        onPressed: isDisabled ? null : onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: color,
          side: BorderSide(color: isDisabled ? BrandColors.textMuted : color),
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
          visualDensity: VisualDensity.compact,
        ),
        icon: isLoading
            ? SizedBox(
                width: AppSizes.md2,
                height: AppSizes.md2,
                child: CircularProgressIndicator(
                  strokeWidth: AppSizes.loaderStrokeWidth,
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                ),
              )
            : Icon(icon, size: AppSizes.iconSizeSm),
        label: Text(
          label,
          style: context.small(color: isDisabled ? BrandColors.textMuted : color, bold: true),
        ),
      ),
    );
  }
}

