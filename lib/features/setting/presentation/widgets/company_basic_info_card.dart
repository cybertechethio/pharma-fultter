import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../shared/utils/url_utils.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/company.dart';
import 'compact_info_row.dart';

class CompanyBasicInfoCard extends StatelessWidget {
  final Company company;

  const CompanyBasicInfoCard({
    super.key,
    required this.company,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Company Logo and Name Header
            Row(
              children: [
                // Company Logo
                if (company.logoUrl != null && company.logoUrl!.isNotEmpty)
                  _buildCompanyLogo(context, company.logoUrl!)
                else
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: BrandColors.surfaceVariant,
                      borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                      border: Border.all(
                        color: BrandColors.outline.withOpacity(0.2),
                      ),
                    ),
                    child: Icon(
                      Icons.business,
                      color: BrandColors.textSecondary,
                      size: 28,
                    ),
                  ),
                const SizedBox(width: AppSizes.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        company.name,
                        style: context.title(bold: true),
                      ),
                      if (company.tradeName != null) ...[
                        const SizedBox(height: AppSizes.xxs),
                        Text(
                          company.tradeName!,
                          style: context.small(color: BrandColors.textSecondary),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.md),
            // Contact Information
            if (company.phone1 != null)
              CompactInfoRow(
                icon: Icons.phone_outlined,
                label: l10n.phone1,
                value: company.phone1!,
                isCompact: true,
              ),
            if (company.phone1 != null && company.phone2 != null)
              const Divider(height: AppSizes.md),
            if (company.phone2 != null)
              CompactInfoRow(
                icon: Icons.phone_outlined,
                label: l10n.phone2,
                value: company.phone2!,
                isCompact: true,
              ),
            // Location Information
            if (company.city != null) ...[
              if (company.phone1 != null || company.phone2 != null)
                const Divider(height: AppSizes.md),
              CompactInfoRow(
                icon: Icons.location_city_outlined,
                label: l10n.city,
                value: company.city!,
                isCompact: true,
              ),
            ],
            if (company.wereda != null) ...[
              if (company.city != null || company.phone1 != null || company.phone2 != null)
                const Divider(height: AppSizes.md),
              CompactInfoRow(
                icon: Icons.map_outlined,
                label: l10n.wereda,
                value: company.wereda!,
                isCompact: true,
              ),
            ],
            // TIN Number
            if (company.tinNumber != null) ...[
              if (company.phone1 != null || company.phone2 != null || company.city != null || company.wereda != null)
                const Divider(height: AppSizes.md),
              CompactInfoRow(
                icon: Icons.badge_outlined,
                label: l10n.tinNumber,
                value: company.tinNumber!,
                isCompact: true,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildCompanyLogo(BuildContext context, String logoUrl) {
    final imageUrl = UrlUtils.getFullImageUrl(logoUrl);

    if (imageUrl == null) {
      return Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: BrandColors.surfaceVariant,
          borderRadius: BorderRadius.circular(AppSizes.radiusSm),
          border: Border.all(
            color: BrandColors.outline.withOpacity(0.2),
          ),
        ),
        child: Icon(
          Icons.broken_image,
          color: BrandColors.error,
        ),
      );
    }

    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
        border: Border.all(
          color: BrandColors.outline.withOpacity(0.2),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
            color: BrandColors.surfaceVariant,
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: AppSizes.loaderStrokeWidth,
                color: BrandColors.primary,
              ),
            ),
          ),
          errorWidget: (context, url, error) => Container(
            color: BrandColors.surfaceVariant,
            child: Icon(
              Icons.broken_image,
              color: BrandColors.error,
            ),
          ),
        ),
      ),
    );
  }
}

