import 'package:flutter/material.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../domain/entities/transfer.dart';

class TransferSummarySection extends StatelessWidget {
  final Transfer transfer;

  const TransferSummarySection({
    super.key,
    required this.transfer,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        color: BrandColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radius),
        border: Border.all(color: BrandColors.outline.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.summary, style: context.subtitle(bold: true)),
          const SizedBox(height: AppSizes.md),
          // Notes
          if (transfer.notes != null && transfer.notes!.isNotEmpty) ...[
            Text(l10n.notes, style: context.small()),
            const SizedBox(height: AppSizes.xs),
            Text(
              transfer.notes!,
              style: context.body(),
            ),
          ],
          if (transfer.notes == null || transfer.notes!.isEmpty) ...[
            Text(l10n.notes, style: context.small()),
            const SizedBox(height: AppSizes.xs),
            Text(l10n.notAvailable, style: context.body()),
          ],
        ],
      ),
    );
  }
}

