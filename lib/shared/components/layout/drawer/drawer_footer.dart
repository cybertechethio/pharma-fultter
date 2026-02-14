import 'package:flutter/material.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../l10n/app_localizations.dart';
import 'drawer_nav_item.dart';

/// A drawer footer with branch switcher, profile, and settings.
class DrawerFooter extends StatelessWidget {
  final Widget? branchSwitcher;
  final VoidCallback onSettingsTap;
  final VoidCallback? onProfileTap;
  final String? appVersion;

  const DrawerFooter({
    super.key,
    this.branchSwitcher,
    required this.onSettingsTap,
    this.onProfileTap,
    this.appVersion,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: BrandColors.primary,
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: AppSizes.sm),
            if (branchSwitcher != null) branchSwitcher!,
            if (onProfileTap != null)
              DrawerNavItem(
                icon: Icons.person_outline_outlined,
                label: l10n.profile,
                onTap: onProfileTap!,
                iconColor: BrandColors.secondary,
              ),
            DrawerNavItem(
              icon: Icons.settings_outlined,
              label: l10n.settings,
              onTap: onSettingsTap,
              iconColor: BrandColors.secondary,
            ),
            // Version Info
            if (appVersion != null)
              Padding(
                padding: const EdgeInsets.only(top: AppSizes.sm, bottom: AppSizes.md),
                child: Text(
                  'v$appVersion',
                  style: context.caption(
                    color: BrandColors.textSecondary,
                  ).copyWith(letterSpacing: 0.5),
                ),
              )
            else
              const SizedBox(height: AppSizes.sm),
          ],
        ),
      ),
    );
  }
}

