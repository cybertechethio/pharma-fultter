import 'package:flutter/material.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../core/enums/transfer_type_enum.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/transfer.dart';
import '../../../../shared/components/common/card_title.dart';
import '../../../../shared/components/common/vertical_bar.dart';

class TransferCard extends StatelessWidget {
  final Transfer transfer;
  final VoidCallback? onTap;

  const TransferCard({
    super.key,
    required this.transfer,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final transferType = transfer.transferType.toTransferType();
    final typeColor = transferType.getColor();

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSizes.radiusSm),
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
                // Transfer info
                Expanded(
                  child: Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSizes.md),
              child: Row(
                children: [
                  // Transfer info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Transfer number and type badge
                        Row(
                          children: [
                            Expanded(
                              child: cardTitle(title: transfer.transferNumber),
                            ),
                            const SizedBox(width: AppSizes.sm),
                            _buildTypeBadge(context),
                          ],
                        ),
                        const SizedBox(height: AppSizes.xs),
                        // Branch info
                        Text(
                          _getBranchInfo(context),
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: AppSizes.xs),
                        // Status and date
                        Row(
                          children: [
                            _buildStatusBadge(context),
                            const Spacer(),
                            Text(
                              _formatDate(transfer.createdAt),
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: AppSizes.sm),
                  Icon(
                    Icons.chevron_right,
                    color: colorScheme.onSurfaceVariant,
                  ),
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

  Widget _buildTypeBadge(BuildContext context) {
    final theme = Theme.of(context);
    final transferType = transfer.transferType.toTransferType();
    final typeColor = transferType.getColor();
    final typeLabel = transferType.getDisplayLabel();
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm, vertical: AppSizes.xxs),
      decoration: BoxDecoration(
        color: typeColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSizes.radiusXs),
      ),
      child: Text(
        typeLabel,
        style: theme.textTheme.labelSmall?.copyWith(
          color: typeColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildStatusBadge(BuildContext context) {
    final color = transfer.status.getTransferStatusColor();
    final statusText = transfer.status.isNotEmpty
        ? transfer.status[0].toUpperCase() + transfer.status.substring(1).toLowerCase()
        : transfer.status;
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
          statusText,
          style: context.label(
            color: color,
            bold: false,
          ),
        ),
      ],
    );
  }

  String _getBranchInfo(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final source = transfer.sourceBranchName ?? l10n.unknown;
    final destination = transfer.destinationBranchName ?? l10n.unknown;
    return '$source → $destination';
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}








