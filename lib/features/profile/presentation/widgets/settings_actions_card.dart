import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../routes/route_name.dart';

/// Card widget displaying settings and action items
class SettingsActionsCard extends StatelessWidget {
  final VoidCallback onEditProfile;
  final VoidCallback onChangePassword;

  const SettingsActionsCard({
    super.key,
    required this.onEditProfile,
    required this.onChangePassword,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.edit_outlined, color: theme.colorScheme.primary),
            title: Text(l10n.editProfile),
            trailing: Icon(Icons.arrow_forward_ios, size: AppSizes.iconSizeSm),
            onTap: onEditProfile,
          ),
          const Divider(height: 1),
          ListTile(
            leading: Icon(Icons.lock_outline, color: theme.colorScheme.primary),
            title: Text(l10n.changePassword),
            trailing: Icon(Icons.arrow_forward_ios, size: AppSizes.iconSizeSm),
            onTap: onChangePassword,
          ),
          const Divider(height: 1),
          ListTile(
            leading: Icon(Icons.settings_outlined, color: theme.colorScheme.primary),
            title: Text(l10n.settings),
            trailing: Icon(Icons.arrow_forward_ios, size: AppSizes.iconSizeSm),
            onTap: () => context.push(RouteName.settings),
          ),
        ],
      ),
    );
  }
}
