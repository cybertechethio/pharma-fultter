import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../shared/components/forms/custom_button.dart';
import '../../../../shared/components/forms/custom_otp_input.dart';
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
import '../../../../core/errors/failure.dart';

class ValidateOtpScreen extends ConsumerStatefulWidget {
  final String phoneNumber;
  
  const ValidateOtpScreen({
    super.key,
    required this.phoneNumber,
  });

  @override
  ConsumerState<ValidateOtpScreen> createState() => _ValidateOtpScreenState();
}

class _ValidateOtpScreenState extends ConsumerState<ValidateOtpScreen> {
  final _otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
   

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _validateOtp() async {
    if (_otpController.text.length != 6) {
      final snackbar = ref.read(snackbarServiceProvider);
      final l10n = AppLocalizations.of(context);
      snackbar.showError(
        Failure.validationError(l10n.pleaseEnterComplete6DigitCode),
      );
      return;
    }

    await ref.read(authProvider.notifier).validateOtp(
      identifier: widget.phoneNumber,
      otp: _otpController.text,
    );
  }

  void _resendOtp() async {
    await ref.read(authProvider.notifier).resendOtp(
      identifier: widget.phoneNumber,
    );
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
            otpValidated: (message, user) {
              // Show success message and navigate to reset password screen
              snackbar.showSuccess(
                message,
              );
              if(user.resetToken != null) {
              // Navigate to reset password screen with identifier and OTP
              context.push(RouteName.resetPassword, extra: {
                'identifier': widget.phoneNumber,
                'resetToken': user.resetToken,
              });}else{
                final l10n = AppLocalizations.of(context);
                snackbar.showError(
                  Failure.validationError(l10n.noResetTokenFound),
                );
              }
            },
            otpResent: (message, user) {
              // Show success message for OTP resend
              snackbar.showSuccess(message);
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          const LanguageToggleButton(),
          const SizedBox(width: 8),
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
                    title: l10n.validateOtpTitle,
                    subtitle: l10n.validateOtpSubtitle(widget.phoneNumber),
                  ),
                  
                  // OTP Input using reusable component
                  CustomOtpInput(
                    controller: _otpController,
                    length: 6,
                    onCompleted: (pin) {
                      if (pin.length == 6) {
                        _validateOtp();
                      }
                    },
                    onChanged: (value) {
                      // Clear any previous validation errors when user types
                    },
                  ),
                  const SizedBox(height: AppSizes.lg),
                  
                  // Verify OTP Button
                  CustomButton(
                    text: l10n.verifyOtp,
                    onPressed: _validateOtp,
                    isLoading: authState is AuthLoading,
                    loadingText: authState is AuthLoading ? authState.message : null,
                  ),
                  const SizedBox(height: AppSizes.lg),
                  
                  // Resend OTP and Edit Phone TextButtons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: authState is AuthLoading ? null : _resendOtp,
                        child: Text(
                          l10n.resendOtp,
                          style: context.bodyPrimary(),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          context.go(RouteName.forgotPassword);
                        },
                        child: Text(
                          l10n.editPhone,
                          style: context.bodyPrimary(),
                        ),
                      ),
                    ],
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
                          style: context.bodySecondary(bold: true),
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
