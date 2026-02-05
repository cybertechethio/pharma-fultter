import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/state/locale_provider.dart';
import 'routes/app_router.dart';
import 'package:cyber_pos/l10n/app_localizations.dart';
import 'features/auth/presentation/providers/auth_providers.dart';
import 'core/services/auth_session_service.dart';
import 'app/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(
    const ProviderScope(
      child: CyberTech(),
    ),
  );
}

class CyberTech extends ConsumerWidget {
  const CyberTech({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // Initialize SharedPreferences at app startup
    ref.read(sharedPreferencesProvider.future).then((_) {
      print('✅ SharedPreferences initialized at app startup');
    }).catchError((error) {
      print('❌ Failed to initialize SharedPreferences: $error');
    });

    // Initialize Isar database at app startup
    ref.read(isarDatabaseProvider.future).then((_) {
      print('✅ Isar database initialized at app startup');
    }).catchError((error) {
      print('❌ Failed to initialize Isar database: $error');
    });

    // Initialize AuthSessionService with Riverpod providers
    // This enables automatic logout and redirect when token refresh fails
    initializeAuthSessionService(ref);
    
    final localeState = ref.watch(localeProvider);
    // Use the persistent router provider instead of creating a new instance
    // This prevents navigation state from being lost when locale changes
    final router = ref.watch(goRouterProvider);
    
    return MaterialApp.router(
      // Localization configuration
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: LocaleNotifier.supportedLocales,
      locale: localeState.locale,
      
      // App configuration
      title: 'Cyber Tech',
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
