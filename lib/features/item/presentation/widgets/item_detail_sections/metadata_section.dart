import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/text_styles.dart';
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
              l10n.metadata,
              style: context.subtitle(bold: true),
            ),
            const SizedBox(height: AppSizes.md),
            CompactInfoRow(
              icon: Icons.calendar_today_outlined,
              label: l10n.created,
              value: DateFormat('MMM dd, yyyy • hh:mm a').format(item.createdAt),
            ),
            if (item.createdByName != null) ...[
              const Divider(height: AppSizes.md),
              CompactInfoRow(
                icon: Icons.person_outline,
                label: l10n.createdBy,
                value: item.createdByName!,
                isCompact: true,
              ),
            ],
            const Divider(height: AppSizes.md),
            CompactInfoRow(
              icon: Icons.update_outlined,
              label: l10n.updated,
              value: DateFormat('MMM dd, yyyy • hh:mm a').format(item.updatedAt),
            ),
          ],
        ),
      ),
    );
  }
}

