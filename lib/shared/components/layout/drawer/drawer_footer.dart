import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';
import 'drawer_nav_item.dart';

/// A drawer footer with settings and help.
class DrawerFooter extends StatelessWidget {
  final VoidCallback onSettingsTap;
  final VoidCallback onHelpTap;
  final String? appVersion;

  const DrawerFooter({
    super.key,
    required this.onSettingsTap,
    required this.onHelpTap,
    this.appVersion,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context);

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: colorScheme.outlineVariant.withOpacity(0.3),
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            // Quick Actions
            DrawerNavItem(
              icon: Icons.help_outline_rounded,
              label: l10n.help,
              onTap: onHelpTap,
              iconColor: colorScheme.secondary,
            ),
            DrawerNavItem(
              icon: Icons.settings_rounded,
              label: l10n.settings,
              onTap: onSettingsTap,
              iconColor: colorScheme.secondary,
            ),
            // Version Info
            if (appVersion != null)
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 12),
                child: Text(
                  'v$appVersion',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant.withOpacity(0.5),
                    letterSpacing: 0.5,
                  ),
                ),
              )
            else
              const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

