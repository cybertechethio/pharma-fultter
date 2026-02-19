import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../core/errors/failure.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/common/error_widget.dart' as app_err;
import '../../../../features/profile/presentation/widgets/section_header_widget.dart';
import '../../../../shared/utils/url_utils.dart';
import '../providers/company_notifier.dart';
import '../widgets/company_basic_info_card.dart';
import '../widgets/company_configuration_card.dart';
import '../widgets/language_tile.dart';
import '../screens/company_update_screen.dart';

/// Settings screen for app configuration
/// 
/// Contains:
/// - Company information
/// - Language selector
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final companyAsync = ref.watch(companyProvider);

    return Scaffold(
      backgroundColor: BrandColors.background,
      appBar: CustomAppBar(
        title: l10n.settings,
      ),
      body: companyAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.xl),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                app_err.ErrorsWidget(
                  failure: error is Failure
                      ? error
                      : Failure.unexpectedError(error.toString()),
                ),
                const SizedBox(height: AppSizes.lg),
                ElevatedButton(
                  onPressed: () => ref.read(companyProvider.notifier).load(),
                  child: Text(l10n.retry),
                ),
              ],
            ),
          ),
        ),
        data: (company) {
          if (company == null) {
            return Center(
              child: Text(l10n.noCompanyFound),
            );
          }

          return RefreshIndicator(
            onRefresh: () => ref.read(companyProvider.notifier).load(),
            child: ListView(
              children: [
                // Company Basic Information Section with Edit Button
                Padding(
                  padding: const EdgeInsets.fromLTRB(AppSizes.lg, AppSizes.xxl, AppSizes.lg, AppSizes.md),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
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
                                    color: BrandColors.outline.withValues(alpha: 0.2),
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
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    company.name,
                                    style: context.title(bold: true),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  if (company.tradeName != null) ...[
                                    const SizedBox(height: AppSizes.xxs),
                                    Text(
                                      company.tradeName!,
                                      style: context.small(color: BrandColors.textSecondary),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CompanyUpdateScreen(company: company),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.edit_outlined,
                          size: AppSizes.iconSizeSm,
                        ),
                        label: Text(l10n.edit),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSizes.sm,
                            vertical: AppSizes.xs,
                          ),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
                  ),
                ),
                CompanyBasicInfoCard(company: company),


                // Configuration Section
                SectionHeaderWidget(
                  title: l10n.configuration,
                  icon: Icons.settings,
                ),
                CompanyConfigurationCard(company: company),


                // App Settings Section
                SectionHeaderWidget(
                  title: l10n.appSettings,
                  icon: Icons.settings_outlined,
                ),
                const LanguageTile(),
                const SizedBox(height: AppSizes.lg),
              ],
            ),
          );
        },
      ),
    );
  }
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
            color: BrandColors.outline.withValues(alpha: 0.2),
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
          color: BrandColors.outline.withValues(alpha: 0.2),
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