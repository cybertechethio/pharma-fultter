import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../routes/route_name.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/common/delete_confirmation_dialog.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../domain/entities/item.dart';
import '../providers/item_notifier.dart';
import '../providers/item_loading_providers.dart';
import '../widgets/item_detail_sections/basic_info_section.dart';
import '../widgets/item_detail_sections/product_details_section.dart';
import '../widgets/item_detail_sections/relationships_section.dart';
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final deleting = ref.watch(itemDeleteLoadingProvider).contains(item.id);
    final updating = ref.watch(itemUpdateLoadingProvider).contains(item.id);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Item Details',
        
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Card
            Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'SKU: ${item.sku ?? 'N/A'}',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: item.isActive
                            ? BrandColors.successWithOpacity(0.1)
                            : BrandColors.textMuted.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
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
                            size: 14,
                            color: item.isActive ? BrandColors.success : BrandColors.textMuted,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            item.isActive ? 'Active' : 'Inactive',
                            style: TextStyle(
                              color: item.isActive ? BrandColors.success : BrandColors.textMuted,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Basic Information Section
            BasicInfoSection(item: item),

            const SizedBox(height: 12),

            // Product Details Section
            ProductDetailsSection(item: item),

            const SizedBox(height: 12),

            // Relationships Section
            RelationshipsSection(item: item),

            const SizedBox(height: 12),

            // Tax & Status Section
            TaxStatusSection(item: item),

            const SizedBox(height: 12),

            // Metadata Section
            MetadataSection(item: item),

            const SizedBox(height: 24),

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
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: deleting
                        ? null
                        : () => _confirmDelete(context, ref, l10n),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.error,
                      foregroundColor: colorScheme.onError,
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

            const SizedBox(height: 16),
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
      title: 'Delete Item',
      message: 'Are you sure you want to delete ${item.name}? This action cannot be undone.',
    );
    if (!confirmed) return;

    await ref.read(itemProvider.notifier).delete(id: item.id);
    if (context.mounted) {
      context.pop();
    }
  }
}

