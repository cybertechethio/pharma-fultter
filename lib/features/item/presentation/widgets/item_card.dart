import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../routes/route_name.dart';
import '../../../../shared/components/common/active_status.dart';
import '../../../../shared/components/common/card_title.dart';
import '../../../../shared/components/common/delete_confirmation_dialog.dart';
import '../../../../shared/components/ui/action_buttons.dart';
import '../../../../shared/utils/url_utils.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../shared/utils/formatters.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../domain/entities/item.dart';
import '../providers/item_notifier.dart';
import '../providers/item_loading_providers.dart';

class ItemCard extends ConsumerWidget {
  final Item item;
  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deleting = ref.watch(itemDeleteLoadingProvider).contains(item.id);
    final updating = ref.watch(itemUpdateLoadingProvider).contains(item.id);
    final l10n = AppLocalizations.of(context);

    return InkWell(
      onTap: () => _navigateToDetail(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.md,
          horizontal: AppSizes.xs,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            _buildImage(context),
            const SizedBox(width: AppSizes.md),
            // Content
            Expanded(
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                   // Name
                  cardTitle(title: item.name),

                   const SizedBox(height: AppSizes.xs),
                   // Code
                   if (item.code.isNotEmpty)
                     Text(
                       'Code: ${item.code}',
                       style: context.small(),
                     ),
                   if (item.code.isNotEmpty) const SizedBox(height: AppSizes.sm),
                   // Status and Actions Row
            Row(
              children: [
                       // Status (just colored text, no background/border)
                       ActiveStatus(isActive: item.isActive),
                       const Spacer(),
                       // Action Buttons
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
          ],
        ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    if (item.imageUrl != null && item.imageUrl!.isNotEmpty) {
      final imageUrl = UrlUtils.getFullImageUrl(item.imageUrl);
      if (imageUrl != null) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.radius),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            width: 56,
            height: 56,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              width: 56,
              height: 56,
              color: BrandColors.divider,
              child: const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              width: 56,
              height: 56,
              color: BrandColors.divider,
              child: Icon(
                Icons.inventory_2_outlined,
                color: BrandColors.textSecondary,
              ),
            ),
          ),
        );
      }
    }
    
    // Placeholder icon
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: BrandColors.divider,
        borderRadius: BorderRadius.circular(AppSizes.radius),
      ),
      child: Icon(
        Icons.inventory_2_outlined,
        color: BrandColors.textSecondary,
        size: 28,
      ),
    );
  }

  void _openEdit(BuildContext context) {
    context.push('${RouteName.items}/${item.id}/edit', extra: item);
  }

  void _navigateToDetail(BuildContext context) {
    context.push(RouteName.itemDetail, extra: item);
  }

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
  ) async {
    final confirmed = await DeleteConfirmationHelper.showItemDeleteConfirmation(
      context: context,
      itemName: item.name,
      itemType: l10n.item,
    );
    if (!confirmed) return;

    await ref.read(itemProvider.notifier).delete(id: item.id);
  }
}


