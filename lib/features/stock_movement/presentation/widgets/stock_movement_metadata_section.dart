import 'package:flutter/material.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/utils/formatters.dart';
import '../../domain/entities/stock_movement.dart';

class StockMovementMetadataSection extends StatelessWidget {
  final StockMovement stockMovement;

  const StockMovementMetadataSection({
    super.key,
    required this.stockMovement,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        color: BrandColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radius),
        border: Border.all(color: BrandColors.outline.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.metadata,
            style: context.subtitle(bold: true),
          ),
          const SizedBox(height: AppSizes.md),
          
          // Created At
          _InfoRow(
            icon: Icons.calendar_today_outlined,
            label: l10n.createdAt,
            value: Formatters.formatDateTime(stockMovement.createdAt),
          ),
          const Divider(height: AppSizes.lg),
          
          // Updated At
          _InfoRow(
            icon: Icons.update_outlined,
            label: l10n.updatedAt,
            value: Formatters.formatDateTime(stockMovement.updatedAt),
          ),
          
          // Creator Name
          if (stockMovement.creatorName != null) ...[
            const Divider(height: AppSizes.lg),
            _InfoRow(
              icon: Icons.person_outline,
              label: l10n.createdBy,
              value: stockMovement.creatorName!,
            ),
          ],
          
          // Updater Name
          if (stockMovement.updaterName != null) ...[
            const Divider(height: AppSizes.lg),
            _InfoRow(
              icon: Icons.person_outline,
              label: l10n.updatedBy,
              value: stockMovement.updaterName!,
            ),
          ],
          
          // Notes
          if (stockMovement.notes != null && stockMovement.notes!.isNotEmpty) ...[
            const Divider(height: AppSizes.lg),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.note_outlined,
                      size: AppSizes.iconSizeSm,
                      color: BrandColors.primary,
                    ),
                    const SizedBox(width: AppSizes.sm),
                    Text(
                      l10n.notes,
                      style: context.small(),
                    ),
                  ],
                ),
                const SizedBox(height: AppSizes.xs),
                Padding(
                  padding: const EdgeInsets.only(left: 26),
                  child: Text(
                    stockMovement.notes!,
                    style: context.body(),
                  ),
                ),
              ],
            ),
          ],
          
          // Transaction ID (if exists)
          if (stockMovement.transactionId != null) ...[
            const Divider(height: AppSizes.lg),
            _InfoRow(
              icon: Icons.receipt_long_outlined,
              label: l10n.transactionId,
              value: stockMovement.transactionId.toString(),
            ),
          ],
          
          // Transfer ID (if exists)
          if (stockMovement.transferId != null) ...[
            const Divider(height: AppSizes.lg),
            _InfoRow(
              icon: Icons.compare_arrows_outlined,
              label: l10n.transferId,
              value: stockMovement.transferId.toString(),
            ),
          ],
          
          // Reverses Movement ID (if exists)
          if (stockMovement.reversesMovementId != null) ...[
            const Divider(height: AppSizes.lg),
            _InfoRow(
              icon: Icons.undo_outlined,
              label: l10n.reversedMovement,
              value: stockMovement.reversesMovementId.toString(),
            ),
          ],
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: AppSizes.md2, color: BrandColors.primary),
        const SizedBox(width: AppSizes.sm),
        Expanded(
          child: Text(
            label,
            style: context.small(),
          ),
        ),
        Text(
          value,
          style: context.body(bold: true),
        ),
      ],
    );
  }
}
