import 'package:flutter/material.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/text_styles.dart';
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
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(AppSizes.radius),
        border: Border.all(color: colorScheme.outline.withOpacity(0.1)),
      ),
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
                  size: 18,
                  color: colorScheme.primary,
                ),
                label: Text(
                  l10n.update,
                  style: context.small(color: colorScheme.primary),
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
          if (stock.lowStockThreshold != null) ...[
            const Divider(height: AppSizes.lg),
            _InfoRow(
              icon: Icons.warning_amber_outlined,
              label: l10n.lowStockThreshold,
              value: stock.lowStockThreshold!,
            ),
          ],
          if (stock.location != null && stock.location!.isNotEmpty) ...[
            const Divider(height: AppSizes.lg),
            _InfoRow(
              icon: Icons.location_on_outlined,
              label: l10n.location,
              value: stock.location!,
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      children: [
        Icon(icon, size: 18, color: colorScheme.primary),
        const SizedBox(width: AppSizes.sm),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

