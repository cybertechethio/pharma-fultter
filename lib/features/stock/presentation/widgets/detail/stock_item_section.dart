import 'package:flutter/material.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../domain/entities/stock.dart';

class StockItemSection extends StatelessWidget {
  final Stock stock;

  const StockItemSection({
    super.key,
    required this.stock,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final item = stock.item;

    if (item == null) return const SizedBox.shrink();

    // Build list of available info rows
    final List<Widget> rows = [];

    if (item.categories != null) {
      rows.add(_InfoRow(
        icon: Icons.category_outlined,
        label: l10n.category,
        value: item.categories!,
      ));
    }
    if (item.subCategories != null) {
      rows.add(_InfoRow(
        icon: Icons.subdirectory_arrow_right_outlined,
        label: l10n.subCategory,
        value: item.subCategories!,
      ));
    }
    if (item.brands != null) {
      rows.add(_InfoRow(
        icon: Icons.branding_watermark_outlined,
        label: l10n.brand,
        value: item.brands!,
      ));
    }
    if (item.units != null) {
      rows.add(_InfoRow(
        icon: Icons.straighten_outlined,
        label: l10n.unit,
        value: item.units!,
      ));
    }
    if (item.models != null) {
      rows.add(_InfoRow(
        icon: Icons.style_outlined,
        label: l10n.model,
        value: item.models!,
      ));
    }
    if (item.color != null) {
      rows.add(_InfoRow(
        icon: Icons.palette_outlined,
        label: l10n.color,
        value: item.color!,
      ));
    }
    if (item.size != null) {
      rows.add(_InfoRow(
        icon: Icons.format_size_outlined,
        label: l10n.size,
        value: item.size!,
      ));
    }
    if (item.material != null) {
      rows.add(_InfoRow(
        icon: Icons.texture_outlined,
        label: l10n.material,
        value: item.material!,
      ));
    }
    if (item.weight != null) {
      rows.add(_InfoRow(
        icon: Icons.scale_outlined,
        label: l10n.weight,
        value: item.weight!,
      ));
    }
    if (item.unitPrice != null) {
      rows.add(_InfoRow(
        icon: Icons.attach_money_outlined,
        label: l10n.unitPrice,
        value: item.unitPrice!,
      ));
    }

    if (rows.isEmpty) return const SizedBox.shrink();

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
          Text(l10n.itemDetails, style: context.subtitle(bold: true)),
          const SizedBox(height: AppSizes.md),
          for (int i = 0; i < rows.length; i++) ...[
            rows[i],
            if (i < rows.length - 1) const Divider(height: AppSizes.lg),
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

