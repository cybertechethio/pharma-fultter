import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../domain/entities/item.dart';
import 'compact_info_row.dart';

class MetadataSection extends StatelessWidget {
  final Item item;

  const MetadataSection({
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
              'Metadata',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            if (item.createdAt != null) ...[
              CompactInfoRow(
                icon: Icons.calendar_today_outlined,
                label: 'Created',
                value: DateFormat('MMM dd, yyyy • hh:mm a').format(item.createdAt!),
              ),
            ],
            if (item.updatedAt != null) ...[
              const Divider(height: 12),
              CompactInfoRow(
                icon: Icons.update_outlined,
                label: 'Updated',
                value: DateFormat('MMM dd, yyyy • hh:mm a').format(item.updatedAt!),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

