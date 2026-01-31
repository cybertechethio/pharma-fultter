import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/components/common/active_status.dart';
import '../../../../shared/components/common/card_title.dart';
import '../../domain/entities/branch.dart';
import '../../../../shared/components/common/delete_confirmation_dialog.dart';
import '../../../../shared/components/ui/action_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../providers/branch_notifier.dart';
import '../providers/branch_loading_providers.dart';
import 'branch_form_dialog.dart';

class BranchCard extends ConsumerWidget {
  final Branch branch;

  const BranchCard({
    super.key,
    required this.branch,
  });

  void _updateBranch(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (context) => BranchFormDialog(
        branch: branch,
        title: l10n.editBranch,
        buttonText: l10n.update,
      ),
    );
  }

  Future<void> _deleteBranch(BuildContext context, WidgetRef ref, AppLocalizations l10n) async {
    final confirmed = await DeleteConfirmationHelper.showItemDeleteConfirmation(
      context: context,
      itemName: branch.name,
      itemType: 'branch',
    );
    
    if (confirmed) {
      await ref.read(branchProvider.notifier).deleteBranch(branch.id);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final deleting = ref.watch(branchDeleteLoadingProvider).contains(branch.id);
    final updating = ref.watch(branchUpdateLoadingProvider).contains(branch.id);
    final theme = Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.md,
        horizontal: AppSizes.xs,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Branch Name
          cardTitle(title: branch.name),
          const SizedBox(height: 4),
          // Status and Actions Row
          Row(
            children: [
              // Status (just dot and text, no background)
              ActiveStatus(isActive: branch.isActive),
              const Spacer(),
              // Action Buttons
              ActionButtons(
                onEdit: () => _updateBranch(context),
                onDelete: () => _deleteBranch(context, ref, l10n),
                isEditing: updating,
                isDeleting: deleting,
                style: ActionButtonStyle.text,
                editLabel: l10n.edit,
                deleteLabel: l10n.delete,
              ),
            ],
          ),
        ],
      ),
    );
  }

  
}
