import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../shared/components/forms/custom_button.dart';
import '../../../../shared/components/forms/custom_text_field.dart';
import '../../../../shared/components/language_selector.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/app_images.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../app/theme/text_styles.dart';
import '../widgets/auth_header.dart';
import '../providers/auth_notifier.dart';
import '../providers/auth_state.dart';
import '../../../../routes/route_name.dart';

class ResetPasswordScreen extends ConsumerStatefulWidget {
  final String identifier;
  final String resetToken;
  
  const ResetPasswordScreen({
    super.key,
    required this.identifier,
    required this.resetToken,
  });

  @override
  ConsumerState<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends ConsumerState<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _resetPassword() async {
    if (_formKey.currentState?.validate() ?? false) {
      await ref.read(authProvider.notifier).resetPassword(
        identifier: widget.identifier,
        resetToken: widget.resetToken,
        newPassword: _newPasswordController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
     final snackbar = ref.read(snackbarServiceProvider);
    
    // Watch auth state for success/error handling
    ref.listen<AsyncValue<AuthState>>(authProvider, (previous, next) {
      next.whenOrNull(
        data: (state) {
          state.whenOrNull(
            passwordReset: (message, user, tokens) {
              // Show success message and navigate to login
              snackbar.showSuccess(
                message,
              );
              context.push(RouteName.home);
            },
            error: (failure) {
              snackbar.showError(
                failure,
              );
            },
          );
        },
      );
    });

    // Get current auth state for loading states
    final authState = ref.watch(authProvider).value;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColors.transparent,
        elevation: 0,
        actions: [
          const LanguageToggleButton(),
          const SizedBox(width: AppSizes.sm),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.lg),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AuthHeader(
                    imagePath: AppImages.appLogo,
                    title: l10n.resetPassword,
                    subtitle: l10n.resetPasswordSubtitle,
                  ),
                  
                  // New Password Input
                  CustomTextField(
                    labelText: l10n.newPassword,
                    controller: _newPasswordController,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return l10n.enterValidPassword;
                      }
                      if (value.length < 6) {
                        return l10n.passwordMinLength;
                      }
                      return null;
                    },
                    prefixIcon: Icons.lock,
                    inputType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(height: AppSizes.lg),
                  
                  // Confirm Password Input
                  CustomTextField(
                    labelText: l10n.confirmNewPassword,
                    controller: _confirmPasswordController,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return l10n.enterValidPassword;
                      }
                      if (value != _newPasswordController.text) {
                        return l10n.passwordsDoNotMatch;
                      }
                      return null;
                    },
                    prefixIcon: Icons.lock_outline,
                    inputType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(height: AppSizes.xl),
                  
                  // Reset Password Button
                  CustomButton(
                    text: l10n.resetPasswordButton,
                    onPressed: _resetPassword,
                    isLoading: authState is AuthLoading,
                    loadingText: authState is AuthLoading ? authState.message : null,
                  ),
                  const SizedBox(height: AppSizes.lg),
                  
                  // Back to Login TextButton
                  Center(
                    child: TextButton(
                      onPressed: () {
                        context.go(RouteName.login);
                      },
                      child: Text(
                        l10n.back,
                        style: context.bodyPrimary().copyWith(fontSize: AppSizes.fontSizeBodySmall),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: AppSizes.xl),
                  
                  // Help text
                  Container(
                    padding: const EdgeInsets.all(AppSizes.md),
                    decoration: BoxDecoration(
                      color: BrandColors.inputBackground,
                      borderRadius: BorderRadius.circular(AppSizes.radius),
                    ),
                    child: Column(
                      children: [
                        Text(
                          l10n.passwordStrength,
                          style: context.bodySecondary(bold: true).copyWith(fontSize: AppSizes.fontSizeBodySmall),
                        ),
                        const SizedBox(height: AppSizes.sm),
                        Text(
                          l10n.passwordMinLength,
                          style: context.small(),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
