import 'package:flutter/material.dart';
import '../../../domain/entities/item.dart';
import 'compact_info_row.dart';

class ProductDetailsSection extends StatelessWidget {
  final Item item;

  const ProductDetailsSection({
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
              'Product Details',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            CompactInfoRow(
              icon: Icons.palette_outlined,
              label: 'Color',
              value: item.color,
              isCompact: true,
            ),
            const Divider(height: 12),
            CompactInfoRow(
              icon: Icons.straighten_outlined,
              label: 'Size',
              value: item.size,
              isCompact: true,
            ),
            const Divider(height: 12),
            CompactInfoRow(
              icon: Icons.texture_outlined,
              label: 'Material',
              value: item.material,
              isCompact: true,
            ),
            const Divider(height: 12),
            CompactInfoRow(
              icon: Icons.scale_outlined,
              label: 'Weight',
              value: '${item.weight} kg',
              isCompact: true,
            ),
          ],
        ),
      ),
    );
  }
}

