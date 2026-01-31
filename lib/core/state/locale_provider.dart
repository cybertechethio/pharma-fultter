import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// State for app locale (language)
class LocaleState {
  final Locale locale;
  
  const LocaleState({required this.locale});
  
  /// Get current language name for display
  String get currentLanguageName {
    switch (locale.languageCode) {
      case 'am':
        return 'አማርኛ';
      case 'en':
      default:
        return 'English';
    }
  }
  
  /// Check if current locale is RTL (Right-to-Left)
  /// Amharic is LTR, so this returns false for both languages
  bool get isRTL => false;
  
  LocaleState copyWith({Locale? locale}) {
    return LocaleState(locale: locale ?? this.locale);
  }
}

/// Notifier for managing app locale state
class LocaleNotifier extends Notifier<LocaleState> {
  static const String _localeKey = 'app_locale';
  
  /// Supported locales
  static const List<Locale> supportedLocales = [
    Locale('en'), // English
    Locale('am'), // Amharic
  ];
  
  /// Get all available languages for selection
  static const Map<String, String> availableLanguages = {
    'en': 'English',
    'am': 'አማርኛ',
  };
  
  @override
  LocaleState build() {
    _loadLocale();
    return const LocaleState(locale: Locale('en'));
  }
  
  /// Load saved locale from shared preferences
  Future<void> _loadLocale() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final languageCode = prefs.getString(_localeKey);
      
      if (languageCode != null) {
        state = state.copyWith(locale: Locale(languageCode));
      }
    } catch (e) {
      // If error loading, use default locale
      debugPrint('Error loading locale: $e');
    }
  }
  
  /// Set new locale and persist to storage
  Future<void> setLocale(Locale newLocale) async {
    if (state.locale == newLocale) return;
    
    // Validate that locale is supported
    if (!supportedLocales.contains(newLocale)) {
      debugPrint('Locale ${newLocale.languageCode} is not supported');
      return;
    }
    
    state = state.copyWith(locale: newLocale);
    
    // Save to shared preferences
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_localeKey, newLocale.languageCode);
    } catch (e) {
      debugPrint('Error saving locale: $e');
    }
  }
  
  /// Set locale by language code
  Future<void> setLocaleByCode(String languageCode) async {
    await setLocale(Locale(languageCode));
  }
  
  /// Toggle between English and Amharic
  Future<void> toggleLanguage() async {
    final newLocale = state.locale.languageCode == 'en' 
        ? const Locale('am') 
        : const Locale('en');
    await setLocale(newLocale);
  }
}

/// Provider for app locale state
final localeProvider = NotifierProvider<LocaleNotifier, LocaleState>(
  LocaleNotifier.new,
);

