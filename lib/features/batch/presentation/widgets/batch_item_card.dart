import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../routes/route_name.dart';
import '../../../../shared/components/common/card_title.dart';
import '../../../../shared/utils/url_utils.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../item/domain/entities/item.dart';

class BatchItemCard extends StatelessWidget {
  final Item item;
  const BatchItemCard({super.key, required this.item});

  String? get _categoryName => item.categoryName ?? item.categories;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _navigateToBatchList(context),
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
                   // Name with Quantity and menu
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: cardTitle(title: item.name),
                      ),
                      // 3-dot menu: Transfer, Consolidation, Split
                      PopupMenuButton<String>(
                        icon: Icon(
                          Icons.more_vert,
                          color: BrandColors.textSecondary,
                          size: 20,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                          minWidth: 32,
                          minHeight: 32,
                        ),
                        onSelected: (value) => _onOperationSelected(context, value),
                        itemBuilder: (context) => [
                          const PopupMenuItem<String>(
                            value: 'transfer',
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: Icon(Icons.swap_horiz_outlined, size: 22),
                              title: Text('Transfer'),
                            ),
                          ),
                          const PopupMenuItem<String>(
                            value: 'consolidation',
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: Icon(Icons.merge_type_outlined, size: 22),
                              title: Text('Consolidation'),
                            ),
                          ),
                          const PopupMenuItem<String>(
                            value: 'split',
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: Icon(Icons.call_split_outlined, size: 22),
                              title: Text('Split'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                   const SizedBox(height: AppSizes.xs),
                   // Code and category on same row
                   if (item.code.isNotEmpty || (_categoryName != null && _categoryName!.isNotEmpty))
                     Row(
                       children: [
                         if (item.code.isNotEmpty)
                           Text(
                             item.code.toUpperCase(),
                             style: context.small(),
                           ),
                         if (item.code.isNotEmpty && (_categoryName != null && _categoryName!.isNotEmpty))
                           Text(
                             ' · ',
                             style: context.small(),
                           ),
                         if (_categoryName != null && _categoryName!.isNotEmpty)
                           Expanded(
                             child: Text(
                               _categoryName!,
                               style: context.small(),
                               overflow: TextOverflow.ellipsis,
                             ),
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

  void _navigateToBatchList(BuildContext context) {
    context.push(RouteName.batchList, extra: item);
  }

  void _onOperationSelected(BuildContext context, String operation) {
    switch (operation) {
      case 'transfer':
        context.push(RouteName.batchTransferForm, extra: item);
        break;
      case 'consolidation':
        context.push(RouteName.batchConsolidationForm, extra: item);
        break;
      case 'split':
        context.push(RouteName.batchSplitForm, extra: item);
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Operation – coming soon')),
        );
    }
  }
}


