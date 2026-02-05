import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'app_sizes.dart';
import 'brand_colors.dart';

/// App theme configuration
class AppTheme {
  AppTheme._();

  /// Build light theme with brand colors and custom input decoration
  static ThemeData get lightTheme {
    // Create color scheme from brand primary color
    final lightColorScheme = ColorScheme.fromSeed(
      seedColor: BrandColors.primary,
      brightness: Brightness.light,
    ).copyWith(
      primary: BrandColors.primary,
      secondary: BrandColors.secondary,
      error: BrandColors.error,
      surface: BrandColors.background,
      background: BrandColors.background,
      onPrimary: BrandColors.textLight,
      onSecondary: BrandColors.textLight,
      onSurface: BrandColors.textPrimary,
      onBackground: BrandColors.textPrimary,
      onError: BrandColors.textLight,
    );
    
    return ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
      scaffoldBackgroundColor: BrandColors.background,
    ).copyWith(
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppSizes.contentPaddingInput),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: BrandColors.inputBorderFocused,
            width: AppSizes.br,
          ),
          borderRadius: BorderRadius.circular(AppSizes.radius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: BrandColors.inputBorder,
            width: AppSizes.br,
          ),
          borderRadius: BorderRadius.circular(AppSizes.radius),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: BrandColors.inputErrorBorder,
            width: AppSizes.br,
          ),
          borderRadius: BorderRadius.circular(AppSizes.radius),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: BrandColors.inputBorder,
            width: AppSizes.br,
          ),
          borderRadius: BorderRadius.circular(AppSizes.radius),
        ),
       
        labelStyle: TextStyle(
          color: BrandColors.inputText,
          fontSize: AppSizes.fontSizeLabel,
        ),
        floatingLabelStyle: TextStyle(
          color: BrandColors.inputText,
          fontSize: AppSizes.fontSizeLabel,
        ),
        hintStyle: TextStyle(
          color: BrandColors.inputPlaceholder,
          fontSize: AppSizes.fontSizeBody,
        ),
      ),
      dividerTheme: DividerThemeData(
        color: BrandColors.divider,
        thickness: 1,
      ),
      cardTheme: CardThemeData(
        color: BrandColors.background,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radius),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: BrandColors.background,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusDialog),
        ),
        titleTextStyle: TextStyle(
          fontSize: AppSizes.fontSizeBody,
          fontWeight: FontWeight.bold,
          color: BrandColors.textPrimary,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: BrandColors.primary.withValues(alpha: 0.8),
        iconTheme: IconThemeData(
          color: BrandColors.textPrimary,
        ),
        leadingWidth: 56,
        toolbarHeight: 56,
      ),
      actionIconTheme: ActionIconThemeData(
        backButtonIconBuilder: (BuildContext context) => Icon(
          CupertinoIcons.back,
          color: BrandColors.background,
          size: AppSizes.xl,
        ),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
    );
  }
}

