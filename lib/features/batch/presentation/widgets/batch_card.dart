import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/active_status.dart';
import '../../../../shared/components/common/card_title.dart';
import '../../../../shared/components/ui/action_buttons.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../shared/utils/formatters.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../routes/route_name.dart';
import '../../domain/entities/batch.dart';
import '../providers/batch_loading_providers.dart';
import '../widgets/batch_form_dialog.dart';

class BatchCard extends ConsumerWidget {
  final BatchEntity batch;
  const BatchCard({super.key, required this.batch});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final updating = ref.watch(batchUpdateLoadingProvider).contains(batch.id);
    final l10n = AppLocalizations.of(context);

    return InkWell(
      onTap: () => _navigateToDetail(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.md,
          horizontal: AppSizes.xs,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Batch Name
            cardTitle(title: batch.batchName),
            const SizedBox(height: AppSizes.xs),
            // Batch Number
            Text(
              'Batch #: ${batch.batchNumber}',
              style: context.small(),
            ),
            const SizedBox(height: AppSizes.xs),
            // Item Name
            Text(
              'Item: ${batch.itemName}',
              style: context.small(),
            ),
            const SizedBox(height: AppSizes.sm),
            // Status, Time, and Actions Row
            Row(
              children: [
                // Status (just colored text, no background/border)
                ActiveStatus(isActive: batch.isActive),
                const Spacer(),
                // Created Date (next to action buttons)
                Padding(
                  padding: const EdgeInsets.only(right: AppSizes.sm),
                  child: Text(
                    Formatters.formatRelativeDate(batch.createdAt),
                    style: context.small(),
                  ),
                ),
                // Action Buttons (only edit, no delete)
                ActionButtons(
                  onEdit: () => _openEdit(context),
                  onDelete: null, // Batch doesn't have delete functionality
                  isEditing: updating,
                  style: ActionButtonStyle.text,
                  editLabel: l10n.edit,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToDetail(BuildContext context) {
    context.push(RouteName.batchDetail, extra: batch);
  }

  void _openEdit(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (context) => BatchFormDialog(
        title: l10n.edit,
        buttonText: l10n.update,
        initial: batch,
      ),
    );
  }
}

