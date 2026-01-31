import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/card_title.dart';
import '../../../../shared/components/common/delete_confirmation_dialog.dart';
import '../../../../shared/components/ui/action_buttons.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/text_styles.dart';
import '../../domain/entities/unit.dart';
import '../providers/unit_notifier.dart';
import '../providers/unit_loading_providers.dart';
import 'unit_form_dialog.dart';

class UnitCard extends ConsumerWidget {
  final UnitEntity item;
  const UnitCard({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deleting = ref.watch(unitDeleteLoadingProvider).contains(item.id);
    final updating = ref.watch(unitUpdateLoadingProvider).contains(item.id);
    final l10n = AppLocalizations.of(context);

    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.lg,
          vertical: AppSizes.md,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row 1: Name (left), ActionButtons (right)
            Row(
              children: [
                Expanded(
                  child: cardTitle(title: item.name),
                ),
                ActionButtons(
                  onEdit: () => _openEdit(context),
                  onDelete: () => _confirmDelete(context, ref, l10n),
                  isEditing: updating,
                  isDeleting: deleting,
                  style: ActionButtonStyle.text,
                  editLabel: l10n.edit,
                  deleteLabel: l10n.delete,
                ),
              ],
            ),
            if (item.description.isNotEmpty) ...[
              const SizedBox(height: AppSizes.xs),
              // Description: italic, small, maxLines: 1, overflow
              Text(
                item.description,
                style: context.small(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _openEdit(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (context) => UnitFormDialog(
        title: l10n.editUnit,
        buttonText: l10n.update,
        initial: item,
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref, AppLocalizations l10n) async {
    final confirmed = await DeleteConfirmationHelper.showItemDeleteConfirmation(
      context: context,
      itemName: item.name,
      itemType: l10n.unit,
    );
    if (!confirmed) return;

    await ref.read(unitProvider.notifier).delete(
      id: item.id,
    );
  }
}

