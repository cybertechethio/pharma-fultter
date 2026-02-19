import 'package:flutter/material.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../domain/entities/item.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/text_styles.dart';
import 'compact_info_row.dart';

class RelationshipsSection extends StatelessWidget {
  final Item item;

  const RelationshipsSection({
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
              l10n.relationships,
              style: context.subtitle(bold: true),
            ),
            const SizedBox(height: AppSizes.md),
            CompactInfoRow(
              icon: Icons.category_outlined,
              label: l10n.category,
              value: item.categories ?? item.categoryName ?? l10n.nA,
              isCompact: true,
            ),
            CompactInfoRow(
              icon: Icons.subdirectory_arrow_right,
              label: l10n.subCategory,
              value: item.subCategories ?? item.subCategoryName ?? l10n.nA,
              isCompact: true,
            ),
            CompactInfoRow(
              icon: Icons.branding_watermark_outlined,
              label: l10n.brand,
              value: item.brands ?? item.brandName ?? l10n.nA,
              isCompact: true,
            ),
            CompactInfoRow(
              icon: Icons.square_foot_outlined,
              label: l10n.unit,
              value: item.units ?? item.unitName ?? l10n.nA,
              isCompact: true,
            ),
            CompactInfoRow(
              icon: Icons.model_training_outlined,
              label: l10n.model,
              value: item.models ?? item.modelName ?? l10n.nA,
              isCompact: true,
            ),
        ],
      ),
    );
  }
}

