import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../core/state/locale_provider.dart';
import '../../../../l10n/app_localizations.dart';

class LanguageTile extends ConsumerWidget {
  const LanguageTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final localeState = ref.watch(localeProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
      child: ListTile(
        leading: Icon(
          Icons.language,
          color: BrandColors.primary,
        ),
        title: Text(l10n.language),
        subtitle: Text(localeState.currentLanguageName),
        trailing: Icon(Icons.arrow_forward_ios, size: AppSizes.iconSizeSm),
        onTap: () {
          _showLanguageSelector(context, ref);
        },
      ),
    );
  }

  static void _showLanguageSelector(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.xl)),
      ),
      isDismissible: true,
      enableDrag: true,
      builder: (BuildContext bottomSheetContext) {
        return Consumer(
          builder: (context, ref, child) {
            final localeState = ref.watch(localeProvider);
            final l10n = AppLocalizations.of(bottomSheetContext);

            return Container(
              padding: const EdgeInsets.all(AppSizes.xl),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.changeLanguage,
                    style: context.header(color: BrandColors.textPrimary),
                  ),
                  const SizedBox(height: AppSizes.xl),
                  ...LocaleNotifier.availableLanguages.entries.map((entry) {
                    final isSelected = localeState.locale.languageCode == entry.key;

                    return ListTile(
                      leading: Icon(
                        Icons.language,
                        color: isSelected ? BrandColors.primary : null,
                      ),
                      title: Text(
                        entry.value,
                        style: context.body(
                          color: isSelected ? BrandColors.primary : null,
                          bold: isSelected,
                        ),
                      ),
                      trailing: isSelected
                          ? Icon(Icons.check, color: BrandColors.primary)
                          : null,
                      onTap: () async {
                        await ref.read(localeProvider.notifier).setLocaleByCode(entry.key);
                        if (bottomSheetContext.mounted) {
                          Navigator.pop(bottomSheetContext);
                        }
                      },
                    );
                  }),
                  const SizedBox(height: AppSizes.sm2),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

