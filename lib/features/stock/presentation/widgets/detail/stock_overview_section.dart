import 'package:flutter/material.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../../../core/enums/stock_status_enum.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../domain/entities/stock.dart';
import '../update_stock_dialog.dart';

class StockOverviewSection extends StatelessWidget {
  final Stock stock;

  const StockOverviewSection({
    super.key,
    required this.stock,
  });

  void _showUpdateDialog(BuildContext context) {
    showDialog<Stock>(
      context: context,
      builder: (context) => UpdateStockDialog(stock: stock),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.all(AppSizes.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(l10n.stockInformation, style: context.subtitle(bold: true)),
              ),
              TextButton.icon(
                onPressed: () => _showUpdateDialog(context),
                icon: Icon(
                  Icons.edit_outlined,
                  size: AppSizes.iconSize,
                  color: BrandColors.primary,
                ),
                label: Text(
                  l10n.edit,
                  style: context.small(color: BrandColors.primary),
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.sm,
                    vertical: 4,
                  ),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.md),
          _InfoRow(
            icon: Icons.inventory_2_outlined,
            label: l10n.quantity,
            value: stock.totalQuantity.toString(),
          ),
          if (stock.item?.code != null && stock.item!.code!.isNotEmpty)
            _InfoRow(
              icon: Icons.qr_code_outlined,
              label: l10n.itemCode,
              value: stock.item!.code!,
            ),
          _InfoRow(
            icon: stock.lowStockStatus.getIcon(),
            label: l10n.status,
            value: stock.lowStockStatus.getDisplayText(),
          ),
          if (stock.lowStockThreshold != null)
            _InfoRow(
              icon: Icons.warning_amber_outlined,
              label: l10n.lowStockThreshold,
              value: stock.lowStockThreshold!,
            ),
          if (stock.location != null && stock.location!.isNotEmpty)
            _InfoRow(
              icon: Icons.location_on_outlined,
              label: l10n.location,
              value: stock.location!,
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

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: AppSizes.iconSize, color: BrandColors.primary),
        const SizedBox(width: AppSizes.sm),
        Text(
          label,
          style: context.small(color: BrandColors.textSecondary),
        ),
        const Spacer(),
        Text(
          value,
          style: context.body(bold: true),
        ),
      ],
    );
  }
}

