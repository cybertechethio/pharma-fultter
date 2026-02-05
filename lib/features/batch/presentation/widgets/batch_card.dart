import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../routes/route_name.dart';
import '../../../../shared/components/common/active_status.dart';
import '../../../../shared/components/common/card_title.dart';
import '../../../../shared/components/ui/action_buttons.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../shared/utils/formatters.dart';
import '../../../../app/theme/app_sizes.dart';
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

    final costStr = batch.costPrice != null
        ? Formatters.formatCurrency(batch.costPrice!)
        : '—';
    final unitStr = batch.unitPrice != null
        ? Formatters.formatCurrency(batch.unitPrice!)
        : '—';
    final details = 'Cost: $costStr · Price: $unitStr';

    return InkWell(
      onTap: () => _navigateToDetail(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.sm,
          horizontal: AppSizes.xs,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name (left) and Qty bold (right)
            Row(
              children: [
                Expanded(child: cardTitle(title: batch.batchName)),
                Text(
                  'Qty: ${batch.quantity}',
                  style: context.small().copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 2),
            // Batch number (left) and status (right)
            Row(
              children: [
                Text(
                  batch.batchNumber,
                  style: context.small(),
                ),
                const Spacer(),
                ActiveStatus(isActive: batch.isActive),
              ],
            ),
            const SizedBox(height: 4),
            // Price row with edit on right
            Row(
              children: [
                Expanded(
                  child: Text(
                    details,
                    style: context.small(),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: AppSizes.xs),
                ActionButtons(
                  onEdit: () => _openEdit(context),
                  onDelete: null,
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

