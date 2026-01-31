import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/forms/custom_text_field.dart';
import '../../../../shared/components/common/error_widget.dart' as app_err;
import '../../../../shared/components/common/empty_widget.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../routes/route_name.dart';
import '../../../../shared/components/common/delete_confirmation_dialog.dart';
import '../../../auth/domain/entities/user.dart'; 
import '../providers/profile_notifier.dart';
import '../providers/profile_events.dart';
import '../widgets/profile_header_widget.dart';
import '../widgets/edit_profile_dialog.dart';
import '../widgets/change_password_dialog.dart';
import '../widgets/section_header_widget.dart';
import '../widgets/account_info_card.dart';
import '../widgets/settings_actions_card.dart';
import '../widgets/danger_zone_card.dart';

/// Profile screen displaying user information and settings
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    // Load user data when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(profileProvider.notifier).loadUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final snackbar = ref.read(snackbarServiceProvider);

    // Listen to profile events
    ref.listen<ProfileUiEvent?>(
      profileUiEventsProvider,
      (prev, next) {
        if (next == null) return;
        
        if (next is ProfileFailure) {
          snackbar.showError(next.failure);
        } else if (next is ProfileUpdated) {
          snackbar.showSuccess(l10n.profileUpdatedSuccessfully);
        } else if (next is PasswordChanged) {
          snackbar.showSuccess(l10n.passwordChangedSuccessfully);
        } else if (next is ProfilePictureUploaded) {
          snackbar.showSuccess(l10n.profilePictureUploadedSuccessfully);
        } else if (next is ProfileLoggedOut) {
          snackbar.showSuccess(l10n.loggedOutSuccessfully);
          context.go(RouteName.login);
        } else if (next is AccountDeleted) {
          snackbar.showSuccess(l10n.accountDeletedSuccessfully);
          context.go(RouteName.login);
        }
        
        ref.read(profileUiEventsProvider.notifier).clear();
      },
    );

    final asyncUser = ref.watch(profileProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.profile,
        centerTitle: true,
      ),
      body: asyncUser.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        data: (user) {
          if (user == null) {
            return Center(
              child: EmptyWidget(
                icon: Icons.person_off_outlined,
                title: l10n.noUserFound,
                message: l10n.unableToLoadProfile,
              ),
            );
          }
          return _buildProfileContent(context, user, l10n);
        },
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              app_err.ErrorsWidget(
                failure: error is Failure
                    ? error
                    : Failure.unexpectedError(error.toString()),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref.read(profileProvider.notifier).loadUser();
                },
                  child: Text(l10n.retry),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileContent(
    BuildContext context,
    User user,
    AppLocalizations l10n,
  ) {
    return RefreshIndicator(
      onRefresh: () => ref.read(profileProvider.notifier).loadUser(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Profile Header
            ProfileHeaderWidget(user: user),

            // Account Information Section
            SectionHeaderWidget(
              title: l10n.accountInformation,
              icon: Icons.info_outline,
            ),
            AccountInfoCard(user: user),
            const SizedBox(height: 24),

            // Settings & Actions Section
            SectionHeaderWidget(
              title: l10n.actions,
              icon: Icons.settings_outlined,
            ),
            SettingsActionsCard(
              onEditProfile: () => _showEditProfileDialog(context, user),
              onChangePassword: () => _showChangePasswordDialog(context),
            ),
            const SizedBox(height: 24),

            // Danger Zone Section
            SectionHeaderWidget(
              title: l10n.dangerZone,
              icon: Icons.warning_outlined,
              color: BrandColors.error,
            ),
            DangerZoneCard(
              onLogout: () => _showLogoutDialog(context, l10n),
              onDeleteAccount: () => _showDeleteAccountDialog(context, l10n),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  void _showEditProfileDialog(BuildContext context, User user) {
    showDialog(
      context: context,
      builder: (context) => EditProfileDialog(user: user),
    );
  }

  void _showChangePasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const ChangePasswordDialog(),
    );
  }

  

  void _showLogoutDialog(BuildContext context, AppLocalizations l10n) async {
    final confirmed = await DeleteConfirmationHelper.showDeleteConfirmation(
      context: context,
      title: l10n.logout,
      message: l10n.confirmLogout,
      confirmText: l10n.logout,
      cancelText: l10n.cancel,
      isDestructive: true,
      icon: Icons.logout_outlined,
    );

    if (confirmed) {
      await ref.read(profileProvider.notifier).logout();
    }
  }

  void _showDeleteAccountDialog(BuildContext context, AppLocalizations l10n) {
    final passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          l10n.deleteAccount,
          style: TextStyle(color: BrandColors.error),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.deleteAccountWarning,
              style: TextStyle(color: BrandColors.error),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              labelText: l10n.password,
              controller: passwordController,
              obscureText: true,
              prefixIcon: Icons.lock_outline,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              passwordController.dispose();
              Navigator.of(context).pop();
            },
            child: Text(l10n.cancel),
          ),
          ElevatedButton(
            onPressed: () async {
              final password = passwordController.text;
              passwordController.dispose();
              Navigator.of(context).pop();
              
              await ref.read(profileProvider.notifier).deleteAccount(
                password: password,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: BrandColors.error,
              foregroundColor: Colors.white
            ),
            child: Text(l10n.deleteAccount),
          ),
        ],
      ),
    );
  }
}
