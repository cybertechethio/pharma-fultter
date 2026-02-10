import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/card_title.dart';
import '../../../../shared/utils/formatters.dart';
import '../../../../core/enums/transfer_status_enum.dart';
import '../../../auth/presentation/providers/current_context_provider.dart';
import '../../domain/entities/transfer.dart';
import '../utils/transfer_branch_helpers.dart';

class TransferCard extends ConsumerWidget {
  final Transfer transfer;
  final VoidCallback? onTap;

  const TransferCard({
    super.key,
    required this.transfer,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final currentBranchId = ref.watch(currentContextProvider).value?.currentBranchId;
    final isSource = isCurrentBranchSource(transfer, currentBranchId);
    final typeColor = isSource ? BrandColors.warning : BrandColors.success;
    final typeLabel = isSource ? l10n.transferOut : l10n.transferIn;
    final typeIcon = isSource ? Icons.call_made : Icons.call_received;
    final status = TransferStatusExtension.fromString(transfer.status);
    final statusColor = status.getColor();

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
                        // Transfer number
                        cardTitle(title: transfer.transferNumber),
                        const SizedBox(height: AppSizes.xs),
                        // Type badge (based on current branch: source = Out, else = In)
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppSizes.xs,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: typeColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(AppSizes.radiusXs),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    typeIcon,
                                    size: AppSizes.iconSizeSm,
                                    color: typeColor,
                                  ),
                                  const SizedBox(width: AppSizes.xs),
                                  Text(
                                    typeLabel,
                                    style: context.small(
                                      color: typeColor,
                                      bold: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // Branches info
                        if ((transfer.sourceBranchName ?? '').isNotEmpty || (transfer.destinationBranchName ?? '').isNotEmpty) ...[
                          const SizedBox(height: AppSizes.xs),
                          Text(
                            '${transfer.sourceBranchName ?? "N/A"} → ${transfer.destinationBranchName ?? "N/A"}',
                            style: context.small(),
                          ),
                        ],
                        // Creator name if exists
                        if (transfer.creatorName != null) ...[
                          const SizedBox(height: AppSizes.xs),
                          Text(
                            'by ${transfer.creatorName!}',
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
                              color: statusColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: AppSizes.xs),
                          Text(
                            status.getDisplayLabel(),
                            style: context.label(
                              color: statusColor,
                              bold: false,
                            ),
                          ),
                        ],
                      ),
                      // Items count
                      Text(
                        '${transfer.transferItems.length} items',
                        style: context.small(),
                      ),
                      // Date
                      Text(
                        Formatters.formatDateTime(transfer.createdAt),
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

