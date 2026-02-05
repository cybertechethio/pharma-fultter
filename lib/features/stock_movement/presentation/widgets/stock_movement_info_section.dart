import 'package:flutter/material.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/enums/stock_movement_type_enum.dart';
import '../../domain/entities/stock_movement.dart';

class StockMovementInfoSection extends StatelessWidget {
  final StockMovement stockMovement;

  const StockMovementInfoSection({
    super.key,
    required this.stockMovement,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isInbound = stockMovement.type.isInbound();
    final isOutbound = stockMovement.type.isOutbound();

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
            l10n.movementInformation,
            style: context.subtitle(bold: true),
          ),
          const SizedBox(height: AppSizes.md),
          
          // Quantity
          _InfoRow(
            icon: Icons.inventory_2_outlined,
            label: l10n.quantity,
            value: stockMovement.quantity,
            valueColor: isInbound
                ? BrandColors.primary
                : isOutbound
                    ? BrandColors.error
                    : null,
          ),
          const Divider(height: AppSizes.lg),
          
          // Previous Stock
          if (stockMovement.previousStock != null)
            _InfoRow(
              icon: Icons.history_outlined,
              label: l10n.previousStock,
              value: stockMovement.previousStock!,
            ),
          if (stockMovement.previousStock != null)
            const Divider(height: AppSizes.lg),
          
          // New Stock
          if (stockMovement.newStock != null)
            _InfoRow(
              icon: Icons.inventory_outlined,
              label: l10n.newStock,
              value: stockMovement.newStock!,
              valueColor: BrandColors.primary,
            ),
          if (stockMovement.newStock != null)
            const Divider(height: AppSizes.lg),
          
          // Inbound/Outbound
          if (isInbound || isOutbound) ...[
            _InfoRow(
              icon: isInbound ? Icons.arrow_downward : Icons.arrow_upward,
              label: isInbound ? l10n.inbound : l10n.outbound,
              value: isInbound
                  ? stockMovement.inbound.toStringAsFixed(2)
                  : stockMovement.outbound.toStringAsFixed(2),
              valueColor: isInbound ? BrandColors.primary : BrandColors.error,
            ),
            const Divider(height: AppSizes.lg),
          ],
          
          // Source Branch (for transfers)
          if (stockMovement.sourceBranchName != null)
            _InfoRow(
              icon: Icons.location_on_outlined,
              label: l10n.sourceBranch,
              value: stockMovement.sourceBranchName!,
            ),
          if (stockMovement.sourceBranchName != null)
            const Divider(height: AppSizes.lg),
          
          // Destination Branch (for transfers)
          if (stockMovement.destinationBranchName != null)
            _InfoRow(
              icon: Icons.location_city_outlined,
              label: l10n.destinationBranch,
              value: stockMovement.destinationBranchName!,
            ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
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
          style: context.body(
            color: valueColor,
            bold: valueColor != null,
          ),
        ),
      ],
    );
  }
}
