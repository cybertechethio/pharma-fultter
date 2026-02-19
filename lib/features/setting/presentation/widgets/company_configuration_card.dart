import 'package:flutter/material.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/company.dart';

class CompanyConfigurationCard extends StatelessWidget {
  final Company company;

  const CompanyConfigurationCard({
    super.key,
    required this.company,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.print,
              color: BrandColors.primary,
            ),
            title: Text(l10n.autoPrint),
            subtitle: Text(
              company.autoPrint ? l10n.enabled : l10n.disabled,
            ),
            trailing: Icon(
              company.autoPrint ? Icons.check_circle : Icons.cancel,
              color: company.autoPrint
                  ? BrandColors.success
                  : BrandColors.error,
            ),
          ),
          if (company.defaultStartDate != null)
            ListTile(
              leading: Icon(
                Icons.calendar_today,
                color: BrandColors.primary,
              ),
              title: Text(l10n.defaultStartDate),
              subtitle: Text(
                company.defaultStartDate!.toIso8601String().split('T')[0],
              ),
            ),
        ],
      ),
    );
  }
}

