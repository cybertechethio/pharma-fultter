import 'package:flutter/material.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../../../../shared/components/common/active_status.dart';
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

    return Padding(
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
            isCompact: true,
          ),
          CompactInfoRow(
            icon: Icons.qr_code_outlined,
            label: l10n.sku,
            value: item.sku,
            isCompact: true,
          ),
          CompactInfoRow(
            icon: Icons.tag_outlined,
            label: l10n.itemCode,
            value: item.code,
            isCompact: true,
          ),
          CompactInfoRow(
            icon: Icons.barcode_reader,
            label: l10n.barcode,
            value: item.barcode,
            isCompact: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSizes.xs2),
            child: Row(
              children: [
                Icon(Icons.toggle_on_outlined,
                    size: AppSizes.md2, color: BrandColors.primary),
                const SizedBox(width: AppSizes.sm),
                Text(
                  l10n.activeStatus,
                  style: context.smallSecondary(),
                ),
                const Spacer(),
                ActiveStatus(isActive: item.isActive),
              ],
            ),
          ),
          CompactInfoRow(
            icon: Icons.description_outlined,
            label: l10n.description,
            value: item.description,
            isCompact: true,
          ),
        ],
      ),
    );
  }
}

