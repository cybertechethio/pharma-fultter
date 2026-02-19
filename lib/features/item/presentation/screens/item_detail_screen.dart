import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../routes/route_name.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/common/delete_confirmation_dialog.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
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
        title: item.name,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Card
            
            // Basic Information Section
            BasicInfoSection(item: item),

            const SizedBox(height: AppSizes.xs2),

            // Product Details Section
            ProductDetailsSection(item: item),

            const SizedBox(height: AppSizes.xs2),

            // Relationships Section
            RelationshipsSection(item: item),

            const SizedBox(height: AppSizes.xs2),

            // Pricing Section
            PricingSection(item: item),

            const SizedBox(height: AppSizes.xs2),

            // Tax & Status Section
            TaxStatusSection(item: item),

            const SizedBox(height: AppSizes.xs2),

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

