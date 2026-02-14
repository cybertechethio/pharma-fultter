import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/utils/url_utils.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../domain/entities/top_selling_product.dart';

/// Top Selling Products card widget
class TopSellingProductsCard extends StatelessWidget {
  final List<TopSellingProduct> products;

  const TopSellingProductsCard({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final numberFormat = NumberFormat('#,##0.##', 'en_US');

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        color: BrandColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        border: Border.all(
          color: BrandColors.border.withValues(alpha: 0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: BrandColors.shadow,
            blurRadius: AppSizes.sm,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSizes.xs2),
                decoration: BoxDecoration(
                  color: BrandColors.secondaryBackgroundLight,
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                ),
                child: Icon(
                  Icons.inventory_2_outlined,
                  color: BrandColors.secondary,
                  size: AppSizes.iconSizeSm + 2,
                ),
              ),
              const SizedBox(width: AppSizes.sm),
              Expanded(
                child: Text(
                  l10n.topSellingProducts,
                  style: context.title(color: BrandColors.textPrimary, bold: true),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.lg),

          // Products list (max 5 items)
          if (products.isEmpty)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.xxl),
                child: Text(
                  l10n.noData,
                  style: context.body(color: BrandColors.textSecondary),
                ),
              ),
            )
          else
            ...products.take(5).toList().asMap().entries.map((entry) {
              final index = entry.key;
              final product = entry.value;
              final limitedList = products.take(5).toList();
              final isLast = index == limitedList.length - 1;
              return _ProductItem(
                product: product,
                numberFormat: numberFormat,
                isLast: isLast,
              );
            }),
        ],
      ),
    );
  }
}

/// Individual product item widget
class _ProductItem extends StatelessWidget {
  final TopSellingProduct product;
  final NumberFormat numberFormat;
  final bool isLast;

  const _ProductItem({
    required this.product,
    required this.numberFormat,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _buildProductImage(context),
            const SizedBox(width: AppSizes.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: context.body(color: BrandColors.textPrimary, bold: true),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppSizes.xs),
                  Row(
                    children: [
                      Text(
                        'ETB ${numberFormat.format(product.price)}',
                        style: context.body(color: BrandColors.textSecondary),
                      ),
                      const SizedBox(width: AppSizes.xs),
                      Container(
                        width: AppSizes.xs,
                        height: AppSizes.xs,
                        decoration: BoxDecoration(
                          color: BrandColors.textSecondary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: AppSizes.xs),
                      Text(
                        '${numberFormat.format(product.sales)}+ Sales',
                        style: context.body(color: BrandColors.textSecondary),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.sm,
                vertical: AppSizes.xs,
              ),
              decoration: BoxDecoration(
                color: BrandColors.successBackgroundLight,
                borderRadius: BorderRadius.circular(AppSizes.xs2),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.arrow_upward_rounded,
                    color: BrandColors.success,
                    size: AppSizes.md2,
                  ),
                  const SizedBox(width: AppSizes.xxs),
                  Text(
                    '${product.growth.toStringAsFixed(0)}%',
                    style: context.caption(color: BrandColors.success, bold: true),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (!isLast) const SizedBox(height: AppSizes.lg),
        if (!isLast)
          Divider(
            height: AppSizes.br,
            color: BrandColors.border.withValues(alpha: 0.1),
          ),
        if (!isLast) const SizedBox(height: AppSizes.lg),
      ],
    );
  }

  Widget _buildProductImage(BuildContext context) {
    final imageUrl = UrlUtils.getFullImageUrl(product.imageUrl);

    if (imageUrl != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          width: AppSizes.xxxxxl,
          height: AppSizes.xxxxxl,
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
            width: AppSizes.xxxxxl,
            height: AppSizes.xxxxxl,
            color: BrandColors.inputBackground,
            child: const Center(
              child: CircularProgressIndicator(strokeWidth: AppSizes.br),
            ),
          ),
          errorWidget: (context, url, error) => Container(
            width: AppSizes.xxxxxl,
            height: AppSizes.xxxxxl,
            decoration: BoxDecoration(
              color: BrandColors.inputBackground,
              borderRadius: BorderRadius.circular(AppSizes.radiusSm),
            ),
            child: Icon(
              Icons.inventory_2_outlined,
              color: BrandColors.textSecondary,
              size: AppSizes.iconSizeLg,
            ),
          ),
        ),
      );
    }

    return Container(
      width: AppSizes.xxxxxl,
      height: AppSizes.xxxxxl,
      decoration: BoxDecoration(
        color: BrandColors.inputBackground,
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
      ),
      child: Icon(
        Icons.inventory_2_outlined,
        color: BrandColors.textSecondary,
        size: AppSizes.iconSizeLg,
      ),
    );
  }
}
