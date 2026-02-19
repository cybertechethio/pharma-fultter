import 'package:flutter/material.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/utils/formatters.dart';
import '../../../domain/entities/stock.dart';

class StockMetadataSection extends StatelessWidget {
  final Stock stock;

  const StockMetadataSection({
    super.key,
    required this.stock,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.all(AppSizes.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.metadata, style: context.subtitle(bold: true)),
          const SizedBox(height: AppSizes.md),
          _InfoRow(
            icon: Icons.calendar_today_outlined,
            label: l10n.createdAt,
            value: Formatters.formatDateTime(stock.createdAt),
          ),
          _InfoRow(
            icon: Icons.update_outlined,
            label: l10n.updatedAt,
            value: Formatters.formatDateTime(stock.updatedAt),
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

