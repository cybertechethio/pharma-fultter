import 'package:flutter/material.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/utils/formatters.dart';
import '../../../domain/entities/transfer.dart';

class TransferOverviewSection extends StatelessWidget {
  final Transfer transfer;

  const TransferOverviewSection({
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
        border: Border.all(color: BrandColors.outline.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.overview, style: context.subtitle(bold: true)),
          const SizedBox(height: AppSizes.md),
          // Source Branch
          _InfoRow(
            icon: Icons.location_on_outlined,
            label: l10n.sourceBranch,
            value: transfer.sourceBranchName ?? l10n.notAvailable,
          ),
          const Divider(height: AppSizes.lg),
          // Destination Branch
          _InfoRow(
            icon: Icons.location_city_outlined,
            label: l10n.destinationBranch,
            value: transfer.destinationBranchName ?? l10n.notAvailable,
          ),
          const Divider(height: AppSizes.lg),
          // Created At
          _InfoRow(
            icon: Icons.calendar_today_outlined,
            label: l10n.createdAt,
            value: Formatters.formatDateTime(transfer.createdAt),
          ),
          const Divider(height: AppSizes.lg),
          // Updated At
          _InfoRow(
            icon: Icons.update_outlined,
            label: l10n.updatedAt,
            value: Formatters.formatDateTime(transfer.updatedAt),
          ),
          const Divider(height: AppSizes.lg),
          // Creator
          _InfoRow(
            icon: Icons.person_add_outlined,
            label: l10n.createdBy,
            value: transfer.creatorName ?? l10n.notAvailable,
          ),
          const Divider(height: AppSizes.lg),
          // Updator
          _InfoRow(
            icon: Icons.edit_outlined,
            label: l10n.updatedBy,
            value: transfer.updaterName ?? l10n.notAvailable,
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: AppSizes.md2, color: BrandColors.primary),
            const SizedBox(width: AppSizes.sm),
            Text(label, style: context.small()),
          ],
        ),
        const SizedBox(width: AppSizes.sm),
        Expanded(
          child: Text(
            value,
            style: context.body(bold: true),
            textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}

