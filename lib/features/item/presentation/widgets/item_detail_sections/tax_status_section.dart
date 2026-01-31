import 'package:flutter/material.dart';
import '../../../domain/entities/item.dart';
import 'compact_info_row.dart';

class TaxStatusSection extends StatelessWidget {
  final Item item;

  const TaxStatusSection({
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
              'Tax & Status',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            CompactInfoRow(
              icon: Icons.receipt_outlined,
              label: 'Is Taxable',
              value: item.isTaxable ? 'Yes' : 'No',
              isCompact: true,
            ),
            const Divider(height: 12),
            CompactInfoRow(
              icon: Icons.percent_outlined,
              label: 'Tax Rate',
              value: '${item.taxRate}%',
              isCompact: true,
            ),
            const Divider(height: 12),
            CompactInfoRow(
              icon: Icons.toggle_on_outlined,
              label: 'Status',
              value: item.isActive ? 'Active' : 'Inactive',
              isCompact: true,
            ),
          ],
        ),
      ),
    );
  }
}

