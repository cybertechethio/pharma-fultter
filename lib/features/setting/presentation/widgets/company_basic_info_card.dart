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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg, vertical: 12),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Company Logo and Name Header
            
            // Contact Information
            if (company.phone1 != null)
              CompactInfoRow(
                icon: Icons.phone_outlined,
                label: l10n.phone1,
                value: company.phone1!,
                isCompact: true,
              ),
            if (company.phone2 != null)
              CompactInfoRow(
                icon: Icons.phone_outlined,
                label: l10n.phone2,
                value: company.phone2!,
                isCompact: true,
              ),
            if (company.city != null)
              CompactInfoRow(
                icon: Icons.location_city_outlined,
                label: l10n.city,
                value: company.city!,
                isCompact: true,
              ),
            if (company.wereda != null)
              CompactInfoRow(
                icon: Icons.map_outlined,
                label: l10n.wereda,
                value: company.wereda!,
                isCompact: true,
              ),
            if (company.tinNumber != null)
              CompactInfoRow(
                icon: Icons.badge_outlined,
                label: l10n.tinNumber,
                value: company.tinNumber!,
                isCompact: true,
              ),
          ],
        ),
    );
  }

 
}

