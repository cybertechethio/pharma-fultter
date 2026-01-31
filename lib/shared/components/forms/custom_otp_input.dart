import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/brand_colors.dart';

/// A reusable OTP input component using Pinput
/// 
/// Provides a professional OTP input with consistent styling
/// that can be used across different screens (verify account, reset password, etc.)
class CustomOtpInput extends StatelessWidget {
  final TextEditingController controller;
  final int length;
  final Function(String)? onCompleted;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool enabled;
  final bool autofocus;
  final String? hintText;
  final Color? primaryColor;
  final Color? errorColor;
  final double? width;
  final double? height;

  const CustomOtpInput({
    super.key,
    required this.controller,
    this.length = 6,
    this.onCompleted,
    this.onChanged,
    this.validator,
    this.enabled = true,
    this.autofocus = false,
    this.hintText,
    this.primaryColor,
    this.errorColor,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    
    final primary = primaryColor ?? colorScheme.primary;
    final error = errorColor ?? BrandColors.error;
    final pinWidth = width ?? 56.0;
    final pinHeight = height ?? 56.0;

    return Pinput(
      controller: controller,
      length: length,
      enabled: enabled,
      autofocus: autofocus,
      defaultPinTheme: PinTheme(
        width: pinWidth,
        height: pinHeight,
        textStyle: textTheme.headlineSmall?.copyWith(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.bold,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: colorScheme.outline,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(AppSizes.radius),
          color: colorScheme.surface,
        ),
      ),
      focusedPinTheme: PinTheme(
        width: pinWidth,
        height: pinHeight,
        textStyle: textTheme.headlineSmall?.copyWith(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.bold,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: primary,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(AppSizes.radius),
          color: colorScheme.surface,
        ),
      ),
      errorPinTheme: PinTheme(
        width: pinWidth,
        height: pinHeight,
        textStyle: textTheme.headlineSmall?.copyWith(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.bold,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: error,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(AppSizes.radius),
          color: colorScheme.surface,
        ),
      ),
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: onCompleted,
      onChanged: onChanged,
    );
  }
}

/// Convenience constructors for common OTP input configurations
extension CustomOtpInputExtensions on CustomOtpInput {
  /// Creates an OTP input for account verification
  static CustomOtpInput forVerification({
    required TextEditingController controller,
    Function(String)? onCompleted,
    Function(String)? onChanged,
    String? Function(String?)? validator,
    bool enabled = true,
    bool autofocus = false,
  }) {
    return CustomOtpInput(
      controller: controller,
      length: 6,
      onCompleted: onCompleted,
      onChanged: onChanged,
      validator: validator,
      enabled: enabled,
      autofocus: autofocus,
    );
  }

  /// Creates an OTP input for password reset
  static CustomOtpInput forPasswordReset({
    required TextEditingController controller,
    Function(String)? onCompleted,
    Function(String)? onChanged,
    String? Function(String?)? validator,
    bool enabled = true,
    bool autofocus = false,
  }) {
    return CustomOtpInput(
      controller: controller,
      length: 6,
      onCompleted: onCompleted,
      onChanged: onChanged,
      validator: validator,
      enabled: enabled,
      autofocus: autofocus,
    );
  }

  /// Creates a compact OTP input for smaller screens
  static CustomOtpInput compact({
    required TextEditingController controller,
    int length = 4,
    Function(String)? onCompleted,
    Function(String)? onChanged,
    String? Function(String?)? validator,
    bool enabled = true,
    bool autofocus = false,
  }) {
    return CustomOtpInput(
      controller: controller,
      length: length,
      width: 48.0,
      height: 48.0,
      onCompleted: onCompleted,
      onChanged: onChanged,
      validator: validator,
      enabled: enabled,
      autofocus: autofocus,
    );
  }
}
