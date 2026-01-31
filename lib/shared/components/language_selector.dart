import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/state/locale_provider.dart';
import 'package:cyber_pos/l10n/app_localizations.dart';
import '../../app/theme/brand_colors.dart';

/// A reusable language selector widget
/// 
/// Displays a dropdown to switch between available languages
class LanguageSelector extends ConsumerWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeState = ref.watch(localeProvider);

    return DropdownButton<String>(
      value: localeState.locale.languageCode,
      icon: const Icon(Icons.language),
      underline: Container(
        height: 2,
        color: BrandColors.primary,
      ),
      onChanged: (String? newLanguageCode) {
        if (newLanguageCode != null) {
          ref.read(localeProvider.notifier).setLocaleByCode(newLanguageCode);
        }
      },
      items: LocaleNotifier.availableLanguages.entries
          .map<DropdownMenuItem<String>>((entry) {
        return DropdownMenuItem<String>(
          value: entry.key,
          child: Text(
            entry.value,
            style: const TextStyle(fontSize: 16),
          ),
        );
      }).toList(),
    );
  }
}

/// A simple language toggle button
/// 
/// Switches between English and Amharic with a single tap
class LanguageToggleButton extends ConsumerWidget {
  const LanguageToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: const Icon(Icons.translate),
      tooltip: 'Change Language',
      onPressed: () {
        ref.read(localeProvider.notifier).toggleLanguage();
      },
    );
  }
}

/// Language selection bottom sheet
/// 
/// A more user-friendly way to select language
class LanguageSelectorSheet {
  static void show(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Consumer(
          builder: (context, ref, child) {
            final localeState = ref.watch(localeProvider);
            
            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.changeLanguage,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 20),
                  ...LocaleNotifier.availableLanguages.entries.map((entry) {
                    final isSelected = localeState.locale.languageCode == entry.key;
                    
                    return ListTile(
                      leading: Icon(
                        Icons.language,
                        color: isSelected ? BrandColors.primary : null,
                      ),
                      title: Text(
                        entry.value,
                        style: TextStyle(
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected ? BrandColors.primary : null,
                        ),
                      ),
                      trailing: isSelected
                          ? const Icon(Icons.check, color: BrandColors.primary)
                          : null,
                      onTap: () {
                        ref.read(localeProvider.notifier).setLocaleByCode(entry.key);
                        Navigator.pop(context);
                      },
                    );
                  }).toList(),
                  const SizedBox(height: 10),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

