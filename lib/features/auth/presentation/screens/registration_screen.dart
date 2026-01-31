import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../shared/components/forms/custom_text_field.dart';
import '../../../../shared/components/forms/custom_button.dart';
import '../../../../shared/components/language_selector.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/app_images.dart';
import '../../../../shared/utils/validators.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgets/auth_header.dart';
import '../providers/auth_notifier.dart';
import '../providers/auth_state.dart';
import '../../../../routes/route_name.dart';

class RegistrationScreen extends ConsumerStatefulWidget {
  const RegistrationScreen({super.key});

  @override
  ConsumerState<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends ConsumerState<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _companyNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  void _submit() async {
    print('1...................................................🚀 FORM SUBMISSION STARTED:');
    print('📍 First Name: ${_firstNameController.text.trim()}');
    print('📍 Last Name: ${_lastNameController.text.trim()}');
    print('📍 Company Name: ${_companyNameController.text.trim()}');
    print('📍 Phone: ${_phoneController.text.trim()}');
    print('📍 Email: ${_emailController.text.trim()}');
    print('📍 Password Length: ${_passwordController.text.length}');
    
    if (_formKey.currentState?.validate() ?? false) {
      print('✅ FORM VALIDATION PASSED - CALLING AUTH NOTIFIER');
      final emailText = _emailController.text.trim();
      await ref.read(authProvider.notifier).register(
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        companyName: _companyNameController.text.trim(),
        phone: _phoneController.text.trim(),
        email: emailText.isEmpty ? null : emailText,
        password: _passwordController.text,
      );
    } else {
      print('❌ FORM VALIDATION FAILED');
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _companyNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
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
            registered: (message, user) {
              // Show success message and navigate to verify account screen
              snackbar.showSuccess(
                message,
              );
              // Navigate to verify account screen with phone number as identifier
              context.push(RouteName.verifyAccount, extra: user.phone);
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
          // Language Toggle Button
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
                    title: l10n.createAccount,
                    subtitle: l10n.joinUsToday,
                  ),
                  
                  // First Name
                  CustomTextField(
                    labelText: l10n.firstName,
                    controller: _firstNameController,
                    validator: Validators.validateFirstName,
                    prefixIcon: Icons.person,
                  ),
                  const SizedBox(height: AppSizes.lg),
                  
                  // Last Name
                  CustomTextField(
                    labelText: l10n.lastName,
                    controller: _lastNameController,
                    validator: Validators.validateLastName,
                    prefixIcon: Icons.person,
                  ),
                  const SizedBox(height: AppSizes.lg),
                  
                  // Company Name
                  CustomTextField(
                    labelText: l10n.companyName,
                    controller: _companyNameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return l10n.nameRequired;
                      }
                      return null;
                    },
                    prefixIcon: Icons.business,
                  ),
                  const SizedBox(height: AppSizes.lg),
                  
                  // Phone Number
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
                  const SizedBox(height: AppSizes.lg),
                  
                  // Email (Optional)
                  CustomTextField(
                    labelText: l10n.email,
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return null; // Email is optional
                      }
                      return Validators.validateEmail(value);
                    },
                    prefixIcon: Icons.email,
                    inputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: AppSizes.lg),
                  
                  // Password
                  CustomTextField(
                    labelText: l10n.password,
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return l10n.pleaseEnterPassword;
                      }
                      if (value.length < 6) {
                        return l10n.passwordMinLength;
                      }
                      return null;
                    },
                    obscureText: _obscurePassword,
                    prefixIcon: Icons.lock,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: BrandColors.primary,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: AppSizes.lg),
                  
                  // Confirm Password
                  CustomTextField(
                    labelText: l10n.confirmPassword,
                    controller: _confirmPasswordController,
                    validator: (value) => Validators.confirmPassword(value, _passwordController.text),
                    obscureText: _obscureConfirmPassword,
                    prefixIcon: Icons.lock,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirmPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: BrandColors.primary,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: AppSizes.lg),
                  
                  // Register Button
                  CustomButton(
                    text: l10n.createAccount,
                    onPressed: _submit,
                    isLoading: authState is AuthLoading,
                    loadingText: authState is AuthLoading ? authState.message : null,
                  ),
                  const SizedBox(height: AppSizes.lg),
                  
                  // OR separator
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Divider(
                          thickness: 1, 
                          color: BrandColors.divider,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
                        child: Text(
                          l10n.or,
                          style: context.bodySecondary(bold: true),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1, 
                          color: BrandColors.divider,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSizes.lg),
                  
                  // Google Sign Up Button
                  CustomButton(
                    text: l10n.continueWithGoogle,
                    onPressed: authState is AuthLoading ? null : () {
                      // TODO: Implement Google signup logic later
                    },
                    isSocial: true,
                    color: BrandColors.background,
                  ),
                  const SizedBox(height: AppSizes.xl),
                  
                  // Terms and Privacy Policy
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: context.small(),
                        children: [
                          TextSpan(text: '${l10n.byCreatingAccount} '),
                          TextSpan(
                            text: l10n.termsOfUse,
                            style: context.smallPrimary(bold: true),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // TODO: Navigate to Terms of Use screen
                              },
                          ),
                          TextSpan(text: ' ${l10n.and} '),
                          TextSpan(
                            text: l10n.privacyPolicy,
                            style: context.smallPrimary(bold: true),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // TODO: Navigate to Privacy Policy screen
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSizes.lg),
                  
                  // Login Link
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: '${l10n.alreadyHaveAccount} ',
                        style: context.bodySecondary(),
                        children: [
                          TextSpan(
                            text: l10n.signIn,
                            style: context.bodyPrimary(bold: true),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.pop();
                              },
                          ),
                        ],
                      ),
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