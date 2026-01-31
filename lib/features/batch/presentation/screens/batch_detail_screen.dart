import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../domain/entities/batch.dart';
import '../providers/batch_loading_providers.dart';
import '../widgets/batch_form_dialog.dart';
import '../widgets/batch_detail_sections/compact_info_row.dart';

class BatchDetailScreen extends ConsumerWidget {
  final BatchEntity batch;

  const BatchDetailScreen({
    super.key,
    required this.batch,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final updating = ref.watch(batchUpdateLoadingProvider).contains(batch.id);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Batch Details',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Card
            Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            batch.batchName,
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Batch #: ${batch.batchNumber}',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: batch.isActive
                            ? BrandColors.successWithOpacity(0.1)
                            : BrandColors.textMuted.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: batch.isActive ? BrandColors.success : BrandColors.textMuted,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            batch.isActive ? Icons.check_circle : Icons.cancel,
                            size: 14,
                            color: batch.isActive ? BrandColors.success : BrandColors.textMuted,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            batch.isActive ? 'Active' : 'Inactive',
                            style: TextStyle(
                              color: batch.isActive ? BrandColors.success : BrandColors.textMuted,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Basic Information Section
            _buildBasicInfoSection(context, theme, colorScheme, batch),

            const SizedBox(height: 12),

            // Additional Details Section
            _buildAdditionalDetailsSection(context, theme, colorScheme, batch),

            const SizedBox(height: 12),

            // Metadata Section
            _buildMetadataSection(context, theme, colorScheme, batch),

            const SizedBox(height: 24),

            // Action Button
            OutlinedButton.icon(
              onPressed: updating
                  ? null
                  : () {
                      showDialog(
                        context: context,
                        builder: (context) => BatchFormDialog(
                          title: l10n.edit,
                          buttonText: l10n.update,
                          initial: batch,
                        ),
                      );
                    },
              icon: updating
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.edit_outlined),
              label: Text(l10n.edit),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildBasicInfoSection(BuildContext context, ThemeData theme, ColorScheme colorScheme, BatchEntity batch) {
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
              label: 'Batch Name',
              value: batch.batchName,
            ),
            const Divider(height: 12),
            CompactInfoRow(
              icon: Icons.qr_code_outlined,
              label: 'Batch Number',
              value: batch.batchNumber,
              isCompact: true,
            ),
            const Divider(height: 12),
            CompactInfoRow(
              icon: Icons.inventory_2_outlined,
              label: 'Item ID',
              value: batch.itemId.toString(),
              isCompact: true,
            ),
            const Divider(height: 12),
            CompactInfoRow(
              icon: Icons.shopping_bag_outlined,
              label: 'Item Name',
              value: batch.itemName,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdditionalDetailsSection(BuildContext context, ThemeData theme, ColorScheme colorScheme, BatchEntity batch) {
    final dateFormat = DateFormat('yyyy-MM-dd');
    
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
              'Additional Details',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            if (batch.expirationDate != null) ...[
              CompactInfoRow(
                icon: Icons.calendar_today_outlined,
                label: 'Expiration Date',
                value: dateFormat.format(batch.expirationDate!),
                isCompact: true,
              ),
              const Divider(height: 12),
            ],
            if (batch.manufacturingDate != null) ...[
              CompactInfoRow(
                icon: Icons.date_range_outlined,
                label: 'Manufacturing Date',
                value: dateFormat.format(batch.manufacturingDate!),
                isCompact: true,
              ),
              const Divider(height: 12),
            ],
            if (batch.costPrice != null && batch.costPrice!.isNotEmpty) ...[
              CompactInfoRow(
                icon: Icons.attach_money_outlined,
                label: 'Cost Price',
                value: batch.costPrice!,
                isCompact: true,
              ),
              const Divider(height: 12),
            ],
            if (batch.supplierBatchNumber != null && batch.supplierBatchNumber!.isNotEmpty) ...[
              CompactInfoRow(
                icon: Icons.numbers_outlined,
                label: 'Supplier Batch Number',
                value: batch.supplierBatchNumber!,
                isCompact: true,
              ),
              const Divider(height: 12),
            ],
            if (batch.notes != null && batch.notes!.isNotEmpty) ...[
              CompactInfoRow(
                icon: Icons.note_outlined,
                label: 'Notes',
                value: batch.notes!,
              ),
            ],
            if (batch.expirationDate == null &&
                batch.manufacturingDate == null &&
                (batch.costPrice == null || batch.costPrice!.isEmpty) &&
                (batch.supplierBatchNumber == null || batch.supplierBatchNumber!.isEmpty) &&
                (batch.notes == null || batch.notes!.isEmpty))
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'No additional details available',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetadataSection(BuildContext context, ThemeData theme, ColorScheme colorScheme, BatchEntity batch) {
    final dateFormat = DateFormat('yyyy-MM-dd HH:mm');
    
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
            CompactInfoRow(
              icon: Icons.calendar_today_outlined,
              label: 'Created At',
              value: dateFormat.format(batch.createdAt),
              isCompact: true,
            ),
            if (batch.updatedAt != null) ...[
              const Divider(height: 12),
              CompactInfoRow(
                icon: Icons.update_outlined,
                label: 'Updated At',
                value: dateFormat.format(batch.updatedAt!),
                isCompact: true,
              ),
            ],
            if (batch.createdBy != null) ...[
              const Divider(height: 12),
              CompactInfoRow(
                icon: Icons.person_outline,
                label: 'Created By',
                value: batch.createdBy.toString(),
                isCompact: true,
              ),
            ],
            if (batch.updatedBy != null) ...[
              const Divider(height: 12),
              CompactInfoRow(
                icon: Icons.person_outline,
                label: 'Updated By',
                value: batch.updatedBy.toString(),
                isCompact: true,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

