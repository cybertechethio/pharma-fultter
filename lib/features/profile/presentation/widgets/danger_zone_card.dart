import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';

/// Card widget displaying danger zone actions (logout and delete account)
class DangerZoneCard extends StatelessWidget {
  final VoidCallback onLogout;
  final VoidCallback onDeleteAccount;

  const DangerZoneCard({
    super.key,
    required this.onLogout,
    required this.onDeleteAccount,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: BrandColors.errorWithOpacity(0.3), width: 1),
      ),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.logout_outlined, color: BrandColors.error),
            title: Text(l10n.logout, style: const TextStyle(color: BrandColors.error)),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: onLogout,
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.delete_outline, color: BrandColors.error),
            title: Text(l10n.deleteAccount, style: const TextStyle(color: BrandColors.error)),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: onDeleteAccount,
          ),
        ],
      ),
    );
  }
}
