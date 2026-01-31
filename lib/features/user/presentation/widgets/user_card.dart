import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/active_status.dart';
import '../../../../shared/components/common/card_title.dart';
import '../../../../shared/components/common/delete_confirmation_dialog.dart';
import '../../../../shared/components/ui/action_buttons.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../routes/route_name.dart';
import '../../domain/entities/user.dart';
import '../providers/user_notifier.dart';
import '../providers/user_loading_providers.dart';

class UserCard extends ConsumerWidget {
  final UserEntity item;
  const UserCard({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deleting = ref.watch(userDeleteLoadingProvider).contains(item.id);
    final updating = ref.watch(userUpdateLoadingProvider).contains(item.id);
    final l10n = AppLocalizations.of(context);

    return InkWell(
      onTap: () {
        context.push('${RouteName.users}/${item.id}');
      },
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
                  child: cardTitle(title: '${item.firstName} ${item.lastName}'),
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
            if (item.phone.isNotEmpty) ...[
              const SizedBox(height: AppSizes.xs),
              // Phone
              Text(
                item.phone,
                style: context.small(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            const SizedBox(height: AppSizes.xs),
            // Status
            ActiveStatus(isActive: item.isActive),
          ],
        ),
      ),
    );
  }

  void _openEdit(BuildContext context) {
    context.push('${RouteName.users}/${item.id}/edit');
  }

  Future<void> _confirmDelete(
      BuildContext context, WidgetRef ref, AppLocalizations l10n) async {
    final confirmed = await DeleteConfirmationHelper.showItemDeleteConfirmation(
      context: context,
      itemName: '${item.firstName} ${item.lastName}',
      itemType: l10n.user,
    );
    if (!confirmed) return;

    await ref.read(userProvider.notifier).delete(id: item.id);
  }
}

