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
import '../../domain/entities/top_customer.dart';

/// Top Customers card widget
class TopCustomersCard extends StatelessWidget {
  final List<TopCustomer> customers;

  const TopCustomersCard({
    super.key,
    required this.customers,
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
                  color: BrandColors.warningBackgroundLight,
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                ),
                child: Icon(
                  Icons.people_outline,
                  color: BrandColors.chartExpenseBar,
                  size: AppSizes.iconSizeSm + 2,
                ),
              ),
              const SizedBox(width: AppSizes.sm),
              Expanded(
                child: Text(
                  l10n.topCustomers,
                  style: context.title(color: BrandColors.textPrimary, bold: true),
                ),
              ),
              TextButton(
                onPressed: () {
                  context.push(RouteName.customers);
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

          // Customers list (max 5 items)
          if (customers.isEmpty)
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
            ...customers.take(5).toList().asMap().entries.map((entry) {
              final index = entry.key;
              final customer = entry.value;
              final limitedList = customers.take(5).toList();
              final isLast = index == limitedList.length - 1;
              return _CustomerItem(
                customer: customer,
                numberFormat: numberFormat,
                l10n: l10n,
                isLast: isLast,
              );
            }),
        ],
      ),
    );
  }
}

/// Individual customer item widget
class _CustomerItem extends StatelessWidget {
  final TopCustomer customer;
  final NumberFormat numberFormat;
  final AppLocalizations l10n;
  final bool isLast;

  const _CustomerItem({
    required this.customer,
    required this.numberFormat,
    required this.l10n,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _buildCustomerAvatar(context),
            const SizedBox(width: AppSizes.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    customer.name,
                    style: context.body(color: BrandColors.textPrimary, bold: true),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppSizes.xs),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: AppSizes.md2,
                        color: BrandColors.textSecondary,
                      ),
                      const SizedBox(width: AppSizes.xs),
                      Text(
                        customer.location ?? l10n.notAvailable,
                        style: context.small(color: BrandColors.textSecondary),
                      ),
                      const SizedBox(width: AppSizes.xs),
                      Container(
                        width: AppSizes.xs,
                        height: AppSizes.xs,
                        decoration: const BoxDecoration(
                          color: BrandColors.chartExpenseBar,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: AppSizes.xs),
                      Text(
                        '${numberFormat.format(customer.orders)} ${l10n.orders}',
                        style: context.small(color: BrandColors.textSecondary),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              'ETB ${numberFormat.format(customer.total)}',
              style: context.title(color: BrandColors.textPrimary, bold: true),
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

  Widget _buildCustomerAvatar(BuildContext context) {
    final imageUrl = UrlUtils.getFullImageUrl(customer.imageUrl);

    if (imageUrl != null) {
      return ClipOval(
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
          errorWidget: (context, url, error) => _buildInitialsAvatar(context),
        ),
      );
    }

    return _buildInitialsAvatar(context);
  }

  Widget _buildInitialsAvatar(BuildContext context) {
    final initials = customer.name
        .split(' ')
        .map((n) => n.isNotEmpty ? n[0].toUpperCase() : '')
        .take(2)
        .join();

    return CircleAvatar(
      radius: AppSizes.xxl,
      backgroundColor: BrandColors.primaryBackgroundLight,
      child: Text(
        initials.isNotEmpty ? initials : 'C',
        style: context.body(color: BrandColors.primary, bold: true),
      ),
    );
  }
}
