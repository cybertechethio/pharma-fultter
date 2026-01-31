import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/card_title.dart';
import '../../../../shared/components/common/delete_confirmation_dialog.dart';
import '../../../../shared/components/ui/action_buttons.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/text_styles.dart';
import '../../domain/entities/bank.dart';
import '../providers/bank_notifier.dart';
import '../providers/bank_loading_providers.dart';
import 'bank_form_dialog.dart';

class BankCard extends ConsumerWidget {
  final BankEntity item;
  const BankCard({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deleting = ref.watch(bankDeleteLoadingProvider).contains(item.id);
    final updating = ref.watch(bankUpdateLoadingProvider).contains(item.id);
    final l10n = AppLocalizations.of(context);

    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.lg,
          vertical: AppSizes.md,
        ),
        child: Row(
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
      ),
    );
  }

  void _openEdit(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (context) => BankFormDialog(
        title: l10n.editBank,
        buttonText: l10n.update,
        initial: item,
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref, AppLocalizations l10n) async {
    final confirmed = await DeleteConfirmationHelper.showItemDeleteConfirmation(
      context: context,
      itemName: item.name,
      itemType: l10n.bank,
    );
    if (!confirmed) return;

    await ref.read(bankProvider.notifier).delete(
      id: item.id,
    );
  }
}

