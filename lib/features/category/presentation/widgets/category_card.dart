import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/card_title.dart';
import '../../../../shared/components/common/delete_confirmation_dialog.dart';
import '../../../../shared/components/ui/action_buttons.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../routes/route_name.dart';
import '../../domain/entities/category.dart';
import '../providers/category_notifier.dart';
import '../providers/category_loading_providers.dart';
import 'category_form_dialog.dart';

class CategoryCard extends ConsumerWidget {
  final Category item;
  const CategoryCard({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deleting = ref.watch(categoryDeleteLoadingProvider).contains(item.id);
    final updating = ref.watch(categoryUpdateLoadingProvider).contains(item.id);
    final l10n = AppLocalizations.of(context);

    return InkWell(
      onTap: () => _navigateToSubCategories(context),
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

  void _navigateToSubCategories(BuildContext context) {
    context.push('${RouteName.subCategories}?categoryId=${item.id}');
  }

  void _openEdit(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (context) => CategoryFormDialog(
        title: l10n.editCategory,
        buttonText: l10n.update,
        initial: item,
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref, AppLocalizations l10n) async {
    final confirmed = await DeleteConfirmationHelper.showItemDeleteConfirmation(
      context: context,
      itemName: item.name,
      itemType: l10n.category,
    );
    if (!confirmed) return;

    await ref.read(categoryProvider.notifier).delete(
      id: item.id,
    );
  }
}

