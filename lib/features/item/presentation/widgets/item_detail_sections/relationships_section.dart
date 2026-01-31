import 'package:flutter/material.dart';
import '../../../domain/entities/item.dart';
import 'compact_info_row.dart';

class RelationshipsSection extends StatelessWidget {
  final Item item;

  const RelationshipsSection({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Relationships',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            CompactInfoRow(
              icon: Icons.category_outlined,
              label: 'Category',
              value: item.categoryName ?? 'N/A',
              isCompact: true,
            ),
            const Divider(height: 12),
            CompactInfoRow(
              icon: Icons.subdirectory_arrow_right,
              label: 'Sub-Category',
              value: item.subCategoryName ?? 'N/A',
              isCompact: true,
            ),
            const Divider(height: 12),
            CompactInfoRow(
              icon: Icons.branding_watermark_outlined,
              label: 'Brand',
              value: item.brandName ?? 'N/A',
              isCompact: true,
            ),
            const Divider(height: 12),
            CompactInfoRow(
              icon: Icons.square_foot_outlined,
              label: 'Unit',
              value: item.unitName ?? 'N/A',
              isCompact: true,
            ),
            const Divider(height: 12),
            CompactInfoRow(
              icon: Icons.model_training_outlined,
              label: 'Model',
              value: item.modelName ?? 'N/A',
              isCompact: true,
            ),
          ],
        ),
      ),
    );
  }
}

