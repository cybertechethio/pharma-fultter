import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../auth/domain/entities/user.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/app_sizes.dart';

/// Card widget displaying account information
class AccountInfoCard extends StatelessWidget {
  final User user;

  const AccountInfoCard({
    super.key,
    required this.user,
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
            leading: Icon(Icons.person_outline, color: BrandColors.primary),
            title: Text(l10n.fullName),
            subtitle: Text(user.fullName),
          ),
          if (user.email != null && user.email!.isNotEmpty) ...[
            const Divider(height: 1),
            ListTile(
              leading: Icon(Icons.email_outlined, color: BrandColors.primary),
              title: Text(l10n.email),
              subtitle: Text(user.email!),
            ),
          ],
          const Divider(height: 1),
          ListTile(
            leading: Icon(Icons.phone_outlined, color: BrandColors.primary),
            title: Text(l10n.phoneNumber),
            subtitle: Text(user.phone),
          ),
          const Divider(height: 1),
          ListTile(
            leading: Icon(Icons.business_outlined, color: theme.colorScheme.primary),
            title: Text(l10n.companyName),
            subtitle: Text(
              (user.companyName?.isNotEmpty ?? false)
                  ? user.companyName!
                  : l10n.unknown,
            ),
          ),
          const Divider(height: 1),
          ListTile(
            leading: Icon(Icons.verified_user_outlined, color: BrandColors.primary),
            title: Text(l10n.accountStatus),
            subtitle: Text(user.isAccountVerified ? l10n.verified : l10n.notVerified),
            trailing: user.isAccountVerified
                ? Icon(Icons.check_circle, color: BrandColors.success, size: AppSizes.iconSize)
                : Icon(Icons.cancel_outlined, color: BrandColors.warning, size: AppSizes.iconSize),
          ),
          const Divider(height: 1),
          ListTile(
            leading: Icon(Icons.calendar_today_outlined, color: BrandColors.primary),
            title: Text(l10n.memberSince),
            subtitle: Text(DateFormat('MMM dd, yyyy').format(user.createdAt)),
          ),
        ],
      ),
    );
  }
}
