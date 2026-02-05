import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../routes/route_name.dart';
import '../../../../shared/utils/url_utils.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../domain/entities/low_stock_product.dart';

/// Low Stock Products card widget
class LowStockProductsCard extends StatelessWidget {
  final List<LowStockProduct> products;

  const LowStockProductsCard({
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
          color: BrandColors.border.withOpacity(0.1),
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
                  color: BrandColors.errorBackgroundLight,
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                ),
                child: Icon(
                  Icons.warning_amber_rounded,
                  color: BrandColors.error,
                  size: AppSizes.iconSizeSm + 2,
                ),
              ),
              const SizedBox(width: AppSizes.sm),
              Expanded(
                child: Text(
                  l10n.lowStockProducts,
                  style: context.title(color: BrandColors.textPrimary, bold: true),
                ),
              ),
              TextButton(
                onPressed: () {
                  context.push(RouteName.stocks);
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.sm,
                    vertical: AppSizes.xs,
                  ),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  l10n.viewAll,
                  style: context.small(color: BrandColors.primary, bold: true),
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
                l10n: l10n,
              );
            }),
        ],
      ),
    );
  }
}

/// Individual product item widget
class _ProductItem extends StatelessWidget {
  final LowStockProduct product;
  final NumberFormat numberFormat;
  final bool isLast;
  final AppLocalizations l10n;

  const _ProductItem({
    required this.product,
    required this.numberFormat,
    required this.isLast,
    required this.l10n,
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
                  if (product.code != null)
                    Text(
                      'ID: #${product.code}',
                      style: context.small(color: BrandColors.textSecondary),
                    ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  l10n.inStock,
                  style: context.small(color: BrandColors.textSecondary),
                ),
                const SizedBox(height: AppSizes.xs),
                Text(
                  numberFormat.format(product.stock),
                  style: context.title(color: BrandColors.chartExpenseBar, bold: true),
                ),
              ],
            ),
          ],
        ),
        if (!isLast) const SizedBox(height: AppSizes.lg),
        if (!isLast)
          Divider(
            height: AppSizes.br,
            color: BrandColors.border.withOpacity(0.1),
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
