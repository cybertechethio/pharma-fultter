import 'package:flutter/material.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../domain/entities/item.dart';
import '../../../../../shared/utils/formatters.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/text_styles.dart';
import 'compact_info_row.dart';

class PricingSection extends StatelessWidget {
  final Item item;

  const PricingSection({
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
            l10n.pricing,
            style: context.subtitle(bold: true),
          ),
          const SizedBox(height: AppSizes.md),
          CompactInfoRow(
            icon: Icons.attach_money_outlined,
            label: l10n.costPrice,
            value: Formatters.formatCurrency(item.costPrice),
            isCompact: true,
          ),
          CompactInfoRow(
            icon: Icons.sell_outlined,
            label: l10n.unitPrice,
            value: Formatters.formatCurrency(item.unitPrice),
            isCompact: true,
          ),
        ],
      ),
    );
  }
}

