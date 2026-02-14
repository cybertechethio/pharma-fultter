import 'package:flutter/material.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/brand_colors.dart';
import '../../../app/theme/text_styles.dart';

/// Simple custom text field with theme-based styling
class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool obscureText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextInputType? inputType;
  final int? maxLines;
  final bool filled;
  /// When true, uses muted/subtle styling for label (less prominent)
  final bool subtle;

  const CustomTextField({
    super.key, 
    required this.labelText,
    required this.controller,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.inputType,
    this.maxLines,
    this.filled = false,
    this.subtle = true,
  });

  @override
  Widget build(BuildContext context) {
    // When obscureText is true, maxLines must be 1
    final effectiveMaxLines = obscureText ? 1 : (maxLines ?? 1);
    
    final labelColor = subtle
        ? BrandColors.inputPlaceholder
        : BrandColors.primary;
    final iconColor = subtle
        ? BrandColors.inputPlaceholder
        : BrandColors.primary;

    final labelStyle = subtle
        ? context.small(color: BrandColors.inputPlaceholder)
        : context.body(color: labelColor).copyWith(
            fontWeight: FontWeight.w500,
            fontSize: AppSizes.fontSizeBody,
          );
    final floatingLabelStyle = context.small(
      color: labelColor,
      bold: true,
    ).copyWith(fontSize: AppSizes.fontSizeBodySmall);
    
    final inputStyle = context.body(
      color: BrandColors.inputText,
    ).copyWith(fontSize: AppSizes.fontSizeBody);
    
    return SizedBox(
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        keyboardType: inputType,
        maxLines: effectiveMaxLines,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon,
                  size: subtle ? AppSizes.iconSizeSm : AppSizes.iconSize,
                  color: iconColor,
                )
              : null,
          suffixIcon: suffixIcon,
          filled: filled,
          fillColor: filled ? BrandColors.surfaceContainerHighest : null,
          labelStyle: labelStyle,
          floatingLabelStyle: floatingLabelStyle,
          // Make the field more compact when subtle
          isDense: subtle,
          contentPadding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.contentPaddingInput),
        ),
        style: inputStyle,
      ),
    );
  }
}