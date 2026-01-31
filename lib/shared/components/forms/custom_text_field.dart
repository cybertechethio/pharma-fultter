import 'package:flutter/material.dart';
import '../../../app/theme/app_sizes.dart';

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
    this.subtle = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    // When obscureText is true, maxLines must be 1
    final effectiveMaxLines = obscureText ? 1 : (maxLines ?? 1);
    
    // Subtle mode: muted colors and smaller font
    final labelColor = subtle 
        ? colorScheme.onSurfaceVariant.withOpacity(0.7)
        : colorScheme.primary;
    
    final iconColor = subtle 
        ? colorScheme.onSurfaceVariant.withOpacity(0.7)
        : colorScheme.primary;
    
    // Use smaller text style for subtle mode
    final labelStyle = subtle
        ? theme.textTheme.bodySmall?.copyWith(
            color: labelColor,
            fontWeight: FontWeight.normal,
          )
        : theme.textTheme.bodyLarge?.copyWith(
            color: labelColor,
            fontWeight: FontWeight.w500,
          );
    
    final inputStyle = subtle
        ? theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurface,
          )
        : theme.textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurface,
          );
    
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
                  size: subtle ? 18 : AppSizes.iconSize,
                  color: iconColor,
                )
              : null,
          suffixIcon: suffixIcon,
          filled: filled,
          fillColor: filled ? colorScheme.surfaceContainerHighest : null,
          labelStyle: labelStyle,
          // Make the field more compact when subtle
          isDense: subtle,
          contentPadding: subtle 
              ? const EdgeInsets.symmetric(horizontal: 12, vertical: 12)
              : null,
        ),
        style: inputStyle,
      ),
    );
  }
}