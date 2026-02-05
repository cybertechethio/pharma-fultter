import 'package:flutter/material.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../shared/components/common/card_title.dart';
import '../../../../shared/utils/formatters.dart';
import '../../../../core/enums/transfer_type_enum.dart';
import '../../../../core/enums/transfer_status_enum.dart';
import '../../domain/entities/transfer.dart';

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
                        // Type badge
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppSizes.xs,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: transfer.transferType.getColor().withOpacity(0.1),
                                borderRadius: BorderRadius.circular(AppSizes.radiusXs),
                              ),
                              child: Text(
                                transfer.transferType.getDisplayLabel(),
                                style: context.small(
                                  color: transfer.transferType.getColor(),
                                  bold: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Branches info
                        if (transfer.sourceBranch != null || transfer.destinationBranch != null) ...[
                          const SizedBox(height: AppSizes.xs),
                          Text(
                            '${transfer.sourceBranch ?? "N/A"} → ${transfer.destinationBranch ?? "N/A"}',
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

