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
import '../../../../shared/utils/validators.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _sendResetCode() async {
    if (_formKey.currentState?.validate() ?? false) {
      await ref.read(authProvider.notifier).forgotPassword(
        identifier: _phoneController.text.trim(),
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
            forgotPasswordSent: (message, user) {
              // Show success message and navigate to OTP verification
              snackbar.showSuccess(
                message,
              );
              // Navigate to validate OTP screen with the phone number
              context.push(RouteName.validateOtp, extra: _phoneController.text.trim());
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
                    title: l10n.forgotPassword,
                    subtitle: l10n.forgotPasswordSubtitle,
                  ),
                  
                  // Phone Number Input
                  CustomTextField(
                    labelText: l10n.phoneNumber,
                    controller: _phoneController,
                    validator: (value) {
                      final isValid = Validators.isValidPhone(value ?? '');
                      return isValid ? null : l10n.enterValidPhone;
                    },
                    prefixIcon: Icons.phone,
                    inputType: TextInputType.phone,
                  ),
                  const SizedBox(height: AppSizes.xl),
                  
                  // Send Reset Code Button
                  CustomButton(
                    text: l10n.sendResetCode,
                    onPressed: _sendResetCode,
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
                          l10n.didntReceiveCode,
                          style: context.bodySecondary(bold: true).copyWith(fontSize: AppSizes.fontSizeBodySmall),
                        ),
                        const SizedBox(height: AppSizes.sm),
                        Text(
                          l10n.checkSpamFolder,
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
