import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../app/theme/app_sizes.dart';
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
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
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
                  _buildCompanyLogo(theme, company.logoUrl!)
                else
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceVariant,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: theme.colorScheme.outline.withOpacity(0.2),
                      ),
                    ),
                    child: Icon(
                      Icons.business,
                      color: theme.colorScheme.onSurfaceVariant,
                      size: 28,
                    ),
                  ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        company.name,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (company.tradeName != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          company.tradeName!,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Contact Information
            if (company.phone1 != null)
              CompactInfoRow(
                icon: Icons.phone_outlined,
                label: l10n.phone1,
                value: company.phone1!,
                isCompact: true,
              ),
            if (company.phone1 != null && company.phone2 != null)
              const Divider(height: 12),
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
                const Divider(height: 12),
              CompactInfoRow(
                icon: Icons.location_city_outlined,
                label: l10n.city,
                value: company.city!,
                isCompact: true,
              ),
            ],
            if (company.wereda != null) ...[
              if (company.city != null || company.phone1 != null || company.phone2 != null)
                const Divider(height: 12),
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
                const Divider(height: 12),
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

  Widget _buildCompanyLogo(ThemeData theme, String logoUrl) {
    final colorScheme = theme.colorScheme;
    final imageUrl = UrlUtils.getFullImageUrl(logoUrl);

    if (imageUrl == null) {
      return Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: colorScheme.outline.withOpacity(0.2),
          ),
        ),
        child: Icon(
          Icons.broken_image,
          color: colorScheme.error,
        ),
      );
    }

    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
            color: colorScheme.surfaceVariant,
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: colorScheme.primary,
              ),
            ),
          ),
          errorWidget: (context, url, error) => Container(
            color: colorScheme.surfaceVariant,
            child: Icon(
              Icons.broken_image,
              color: colorScheme.error,
            ),
          ),
        ),
      ),
    );
  }
}

