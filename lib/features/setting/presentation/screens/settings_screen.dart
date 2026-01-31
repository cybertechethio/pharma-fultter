import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../core/errors/failure.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/common/error_widget.dart' as app_err;
import '../../../../features/profile/presentation/widgets/section_header_widget.dart';
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
                  padding: const EdgeInsets.fromLTRB(AppSizes.lg, 24, AppSizes.lg, 12),
                  child: Row(
                    children: [
                      Icon(
                        Icons.business,
                        color: Theme.of(context).colorScheme.primary,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        l10n.companyInformation,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CompanyUpdateScreen(company: company),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.edit_outlined,
                          size: 16,
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

                const SizedBox(height: AppSizes.lg),

                // Configuration Section
                SectionHeaderWidget(
                  title: l10n.configuration,
                  icon: Icons.settings,
                ),
                CompanyConfigurationCard(company: company),

                const SizedBox(height: AppSizes.lg),

                // App Settings Section
                SectionHeaderWidget(
                  title: l10n.appSettings,
                  icon: Icons.settings_outlined,
                ),
                const LanguageTile(),
              ],
            ),
          );
        },
      ),
    );
  }
}

