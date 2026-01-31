import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../routes/route_name.dart';

/// Card widget displaying settings and action items
class SettingsActionsCard extends StatelessWidget {
  final VoidCallback onEditProfile;
  final VoidCallback onChangePassword;
  final VoidCallback? onChangeCompanyName;
  final VoidCallback? onUpdateCompany;

  const SettingsActionsCard({
    super.key,
    required this.onEditProfile,
    required this.onChangePassword,
    this.onChangeCompanyName,
    this.onUpdateCompany,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.edit_outlined, color: theme.colorScheme.primary),
            title: Text(l10n.editProfile),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: onEditProfile,
          ),
          const Divider(height: 1),
          ListTile(
            leading: Icon(Icons.lock_outline, color: theme.colorScheme.primary),
            title: Text(l10n.changePassword),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: onChangePassword,
          ),
          if (onChangeCompanyName != null) ...[
            const Divider(height: 1),
            ListTile(
              leading: Icon(Icons.business_outlined, color: theme.colorScheme.primary),
              title: Text(l10n.companyName),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: onChangeCompanyName,
            ),
          ],
          if (onUpdateCompany != null) ...[
            const Divider(height: 1),
            ListTile(
              leading: Icon(Icons.business_center_outlined, color: theme.colorScheme.primary),
              title: Text(l10n.updateCompany),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: onUpdateCompany,
            ),
          ],
          const Divider(height: 1),
          ListTile(
            leading: Icon(Icons.settings_outlined, color: theme.colorScheme.primary),
            title: Text(l10n.settings),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => context.push(RouteName.settings),
          ),
        ],
      ),
    );
  }
}
