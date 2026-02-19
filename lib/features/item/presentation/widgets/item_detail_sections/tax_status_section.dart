import 'package:flutter/material.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../domain/entities/item.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/text_styles.dart';
import 'compact_info_row.dart';

class TaxStatusSection extends StatelessWidget {
  final Item item;

  const TaxStatusSection({
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
            l10n.taxAndStatus,
            style: context.subtitle(bold: true),
          ),
          const SizedBox(height: AppSizes.md),
          CompactInfoRow(
            icon: Icons.receipt_outlined,
            label: l10n.isTaxable,
            value: item.isTaxable ? l10n.yes : l10n.no,
            isCompact: true,
          ),
          CompactInfoRow(
            icon: Icons.percent_outlined,
            label: l10n.taxRate,
            value: '${item.taxRate}%',
            isCompact: true,
          ),
        ],
      ),
    );
  }
}

