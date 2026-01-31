import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../core/state/locale_provider.dart';
import '../../../../l10n/app_localizations.dart';

class LanguageTile extends ConsumerWidget {
  const LanguageTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final localeState = ref.watch(localeProvider);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(
          Icons.language,
          color: Theme.of(context).colorScheme.primary,
        ),
        title: Text(l10n.language),
        subtitle: Text(localeState.currentLanguageName),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
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
            final theme = Theme.of(bottomSheetContext);

            return Container(
              padding: const EdgeInsets.all(AppSizes.xl),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.changeLanguage,
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: AppSizes.xl),
                  ...LocaleNotifier.availableLanguages.entries.map((entry) {
                    final isSelected = localeState.locale.languageCode == entry.key;

                    return ListTile(
                      leading: Icon(
                        Icons.language,
                        color: isSelected ? theme.colorScheme.primary : null,
                      ),
                      title: Text(
                        entry.value,
                        style: TextStyle(
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected ? theme.colorScheme.primary : null,
                        ),
                      ),
                      trailing: isSelected
                          ? Icon(Icons.check, color: theme.colorScheme.primary)
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

