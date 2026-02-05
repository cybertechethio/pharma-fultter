import 'package:flutter/material.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../domain/entities/item.dart';
import 'compact_info_row.dart';

class BasicInfoSection extends StatelessWidget {
  final Item item;

  const BasicInfoSection({
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
              l10n.basicInformation,
              style: context.subtitle(bold: true),
            ),
            const SizedBox(height: AppSizes.md),
            CompactInfoRow(
              icon: Icons.label_outline,
              label: l10n.name,
              value: item.name,
            ),
            const Divider(height: AppSizes.md),
            CompactInfoRow(
              icon: Icons.description_outlined,
              label: l10n.description,
              value: item.description,
            ),
            const Divider(height: AppSizes.md),
            CompactInfoRow(
              icon: Icons.qr_code_outlined,
              label: l10n.sku,
              value: item.sku,
              isCompact: true,
            ),
            const Divider(height: AppSizes.md),
            CompactInfoRow(
              icon: Icons.tag_outlined,
              label: l10n.itemCode,
              value: item.code,
              isCompact: true,
            ),
            const Divider(height: AppSizes.md),
            CompactInfoRow(
              icon: Icons.barcode_reader,
              label: l10n.barcode,
              value: item.barcode,
              isCompact: true,
            ),
          ],
        ),
      ),
    );
  }
}

