import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/card_title.dart';
import '../../../../shared/components/common/delete_confirmation_dialog.dart';
import '../../../../shared/components/ui/action_buttons.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../routes/route_name.dart';
import '../../domain/entities/role.dart';
import '../providers/role_notifier.dart';
import '../providers/role_loading_providers.dart';

class RoleCard extends ConsumerWidget {
  final RoleEntity item;

  const RoleCard({
    super.key,
    required this.item,
  });

  void _editRole(BuildContext context) {
    context.push('${RouteName.roles}/${item.id}/edit');
  }

  Future<void> _deleteRole(BuildContext context, WidgetRef ref, AppLocalizations l10n) async {
    final confirmed = await DeleteConfirmationHelper.showItemDeleteConfirmation(
      context: context,
      itemName: item.name,
      itemType: 'role',
    );

    if (confirmed) {
      await ref.read(roleProvider.notifier).delete(id: item.id);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final deleting = ref.watch(roleDeleteLoadingProvider).contains(item.id);
    final updating = ref.watch(roleUpdateLoadingProvider).contains(item.id);
    final permissionCount = item.permissions.length;

    return InkWell(
      onTap: () => context.push('${RouteName.roles}/${item.id}'),
      borderRadius: BorderRadius.circular(AppSizes.radiusSm),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.md,
          horizontal: AppSizes.xs,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Role Name and Permission Count Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Role Name
                Expanded(
                  child: cardTitle(title: item.name),
                ),
                const SizedBox(width: AppSizes.sm),
                // Permission count badge
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.shield_outlined,
                      size: 14,
                      color: BrandColors.primary,
                    ),
                    const SizedBox(width: AppSizes.xs),
                    Text(
                      '$permissionCount',
                      style: context.small(
                        color: BrandColors.primary,
                        bold: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: AppSizes.sm),
            // Actions Row
            Row(
              children: [
                const Spacer(),
                // Action Buttons
                ActionButtons(
                  onEdit: () => _editRole(context),
                  onDelete: () => _deleteRole(context, ref, l10n),
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
      ),
    );
  }
}
