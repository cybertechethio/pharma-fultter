import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../routes/route_name.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/common/delete_confirmation_dialog.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../domain/entities/item.dart';
import '../providers/item_notifier.dart';
import '../providers/item_loading_providers.dart';
import '../widgets/item_detail_sections/basic_info_section.dart';
import '../widgets/item_detail_sections/product_details_section.dart';
import '../widgets/item_detail_sections/relationships_section.dart';
import '../widgets/item_detail_sections/pricing_section.dart';
import '../widgets/item_detail_sections/tax_status_section.dart';
import '../widgets/item_detail_sections/metadata_section.dart';

class ItemDetailScreen extends ConsumerWidget {
  final Item item;

  const ItemDetailScreen({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final deleting = ref.watch(itemDeleteLoadingProvider).contains(item.id);
    final updating = ref.watch(itemUpdateLoadingProvider).contains(item.id);

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.itemDetails,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Card
            Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.md),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: context.subtitle(bold: true),
                          ),
                          const SizedBox(height: AppSizes.xs),
                          Text(
                            'SKU: ${item.sku ?? 'N/A'}',
                            style: context.smallSecondary(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.xs2),
                      decoration: BoxDecoration(
                        color: item.isActive
                            ? BrandColors.successWithOpacity(0.1)
                            : BrandColors.textMuted.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                        border: Border.all(
                          color: item.isActive ? BrandColors.success : BrandColors.textMuted,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            item.isActive ? Icons.check_circle : Icons.cancel,
                            size: AppSizes.md2,
                            color: item.isActive ? BrandColors.success : BrandColors.textMuted,
                          ),
                          const SizedBox(width: AppSizes.xs),
                          Text(
                            item.isActive ? l10n.active : l10n.inactive,
                            style: context.label(
                              color: item.isActive ? BrandColors.success : BrandColors.textMuted,
                              bold: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: AppSizes.md),

            // Basic Information Section
            BasicInfoSection(item: item),

            const SizedBox(height: AppSizes.md),

            // Product Details Section
            ProductDetailsSection(item: item),

            const SizedBox(height: AppSizes.md),

            // Relationships Section
            RelationshipsSection(item: item),

            const SizedBox(height: AppSizes.md),

            // Pricing Section
            PricingSection(item: item),

            const SizedBox(height: AppSizes.md),

            // Tax & Status Section
            TaxStatusSection(item: item),

            const SizedBox(height: AppSizes.md),

            // Metadata Section
            MetadataSection(item: item),

            const SizedBox(height: AppSizes.xxl),

            // Action Buttons
            Row(
              children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: updating
                          ? null
                          : () {
                              context.push('${RouteName.items}/${item.id}/edit', extra: item);
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
                ),
                const SizedBox(width: AppSizes.md),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: deleting
                        ? null
                        : () => _confirmDelete(context, ref, l10n),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: BrandColors.error,
                      foregroundColor: BrandColors.onError,
                    ),
                    icon: deleting
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: BrandColors.textLight,
                            ),
                          )
                        : const Icon(Icons.delete_outline),
                    label: Text(l10n.delete),
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppSizes.lg),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
  ) async {
    final confirmed = await DeleteConfirmationHelper.showDeleteConfirmation(
      context: context,
      title: l10n.deleteItem,
      message: l10n.confirmDeleteItem(item.name),
    );
    if (!confirmed) return;

    await ref.read(itemProvider.notifier).delete(id: item.id);
    if (context.mounted) {
      context.pop();
    }
  }
}

