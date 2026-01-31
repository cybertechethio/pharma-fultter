import 'package:flutter/material.dart';
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
              'Basic Information',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            CompactInfoRow(
              icon: Icons.label_outline,
              label: 'Name',
              value: item.name,
            ),
            const Divider(height: 12),
            CompactInfoRow(
              icon: Icons.description_outlined,
              label: 'Description',
              value: item.description,
            ),
            const Divider(height: 12),
            CompactInfoRow(
              icon: Icons.qr_code_outlined,
              label: 'SKU',
              value: item.sku,
              isCompact: true,
            ),
            const Divider(height: 12),
            CompactInfoRow(
              icon: Icons.tag_outlined,
              label: 'Code',
              value: item.code,
              isCompact: true,
            ),
            const Divider(height: 12),
            CompactInfoRow(
              icon: Icons.barcode_reader,
              label: 'Barcode',
              value: item.barcode,
              isCompact: true,
            ),
          ],
        ),
      ),
    );
  }
}

