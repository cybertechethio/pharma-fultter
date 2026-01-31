import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/app_images.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../shared/components/forms/custom_text_field.dart';
import '../../../../shared/components/forms/custom_button.dart';
import '../../../../shared/components/language_selector.dart';
import '../widgets/auth_header.dart';
import '../../../../shared/utils/validators.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/auth_notifier.dart';
import '../providers/auth_state.dart';
import '../../../../routes/route_name.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  void _submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      await ref.read(authProvider.notifier).login(
        identifier: _phoneController.text.trim(),
        password: _passwordController.text,
      );
    }
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
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
            authenticated: (message, user, tokens) {
              // Show success message and navigate to home screen
              snackbar.showSuccess(
                message,
              );
              print('message: $message');
              context.go(RouteName.home);
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
                    title: l10n.appTitleWithPos,
                    subtitle: l10n.signInToContinue,
                  ),
                  CustomTextField(
                    labelText: l10n.enterPhone,
                    controller: _phoneController,
                    validator: (value) {
                      final isValid = Validators.isValidPhone(value ?? '');
                      return isValid ? null : l10n.enterValidPhone;
                    },
                    prefixIcon: Icons.phone,
                    inputType: TextInputType.number,
                  ),
                  const SizedBox(height: AppSizes.lg),
                  CustomTextField(
                    labelText: l10n.enterPassword,
                    controller: _passwordController,
                    validator: (value){
                      final isValid = Validators.isValidPassword(value ?? '');
                      return isValid ? null : l10n.enterValidPassword;
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
                  const SizedBox(height: AppSizes.sm),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        context.push(RouteName.forgotPassword);
                      },
                      child: Text(
                        l10n.forgotPassword,
                        style: context.bodyPrimary(),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSizes.sm),
                  CustomButton(
                    text: l10n.login,
                    onPressed: _submit,
                    isLoading: authState is AuthLoading,
                    loadingText: authState is AuthLoading ? authState.message : null,
                  ),
                  const SizedBox(height: AppSizes.lg),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Divider(
                          thickness: 1, 
                          color: BrandColors.divider,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
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
                  CustomButton(
                    text: l10n.loginWithGoogle,
                    onPressed: authState is AuthLoading ? null : () {
                      // TODO: Implement Google login logic later
                    },
                    isSocial: true,
                    color: BrandColors.background,
                  ),
                  const SizedBox(height: AppSizes.xxl),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "${l10n.dontHaveAccount} ",
                        style: context.bodySecondary(),
                        children: [
                          TextSpan(
                            text: l10n.signUp,
                            style: context.bodyPrimary(bold: true),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.push(RouteName.register);
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