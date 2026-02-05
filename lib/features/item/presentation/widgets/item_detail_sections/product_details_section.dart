import 'package:flutter/material.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../domain/entities/item.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/text_styles.dart';
import 'compact_info_row.dart';

class ProductDetailsSection extends StatelessWidget {
  final Item item;

  const ProductDetailsSection({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.productDetails,
              style: context.subtitle(bold: true),
            ),
            const SizedBox(height: AppSizes.md),
            CompactInfoRow(
              icon: Icons.palette_outlined,
              label: l10n.color,
              value: item.color,
              isCompact: true,
            ),
            const Divider(height: AppSizes.md),
            CompactInfoRow(
              icon: Icons.straighten_outlined,
              label: l10n.size,
              value: item.size,
              isCompact: true,
            ),
            const Divider(height: AppSizes.md),
            CompactInfoRow(
              icon: Icons.texture_outlined,
              label: l10n.material,
              value: item.material,
              isCompact: true,
            ),
            const Divider(height: AppSizes.md),
            CompactInfoRow(
              icon: Icons.scale_outlined,
              label: l10n.weight,
              value: item.weight != null ? '${item.weight} kg' : null,
              isCompact: true,
            ),
            if (item.expirationDate != null) ...[
              const Divider(height: AppSizes.md),
              CompactInfoRow(
                icon: Icons.calendar_today_outlined,
                label: l10n.expirationDate,
                value: '${item.expirationDate!.year}-${item.expirationDate!.month.toString().padLeft(2, '0')}-${item.expirationDate!.day.toString().padLeft(2, '0')}',
                isCompact: true,
              ),
            ],
            if (item.manufacturingDate != null) ...[
              const Divider(height: AppSizes.md),
              CompactInfoRow(
                icon: Icons.date_range_outlined,
                label: l10n.manufacturingDate,
                value: '${item.manufacturingDate!.year}-${item.manufacturingDate!.month.toString().padLeft(2, '0')}-${item.manufacturingDate!.day.toString().padLeft(2, '0')}',
                isCompact: true,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

