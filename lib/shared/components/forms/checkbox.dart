import 'package:flutter/material.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/brand_colors.dart';
import '../../../app/theme/text_styles.dart';

/// Custom checkbox component following Material Design 3 and project theme
/// 
/// Features:
/// - Consistent theming with brand colors
/// - Dark/light mode support
/// - Multiple variants (checkbox, radio, switch)
/// - Custom labels and descriptions
/// - Accessibility support
class CustomCheckbox extends StatelessWidget {
  /// Whether checkbox is checked
  final bool value;
  
  /// Callback when checkbox state changes
  final ValueChanged<bool>? onChanged;
  
  /// Checkbox variant
  final CheckboxVariant variant;
  
  /// Label text
  final String? label;
  
  /// Description text (shown below label)
  final String? description;
  
  /// Whether checkbox is enabled
  final bool enabled;
  
  /// Whether checkbox is required
  final bool required;
  
  /// Custom text style for label
  final TextStyle? labelStyle;
  
  /// Custom text style for description
  final TextStyle? descriptionStyle;
  
  /// Custom active color
  final Color? activeColor;
  
  /// Custom inactive color
  final Color? inactiveColor;
  
  /// Spacing between checkbox and label
  final double spacing;
  
  /// Whether to show label on the left side
  final bool labelOnLeft;
  
  /// Custom checkbox widget
  final Widget? customCheckbox;

  const CustomCheckbox({
    super.key,
    required this.value,
    this.onChanged,
    this.variant = CheckboxVariant.checkbox,
    this.label,
    this.description,
    this.enabled = true,
    this.required = false,
    this.labelStyle,
    this.descriptionStyle,
    this.activeColor,
    this.inactiveColor,
    this.spacing = 8.0,
    this.labelOnLeft = false,
    this.customCheckbox,
  });

  @override
  Widget build(BuildContext context) {
    final isDisabled = !enabled || onChanged == null;

    Widget checkboxWidget = _buildCheckbox(context, isDisabled);

    if (label != null) {
      final labelWidget = _buildLabel(context, isDisabled);
      final descriptionWidget = _buildDescription(context, isDisabled);
      
      final content = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          labelWidget,
          if (description != null) ...[
            const SizedBox(height: AppSizes.xs),
            descriptionWidget,
          ],
        ],
      );
      
      if (labelOnLeft) {
        return IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              content,
              SizedBox(width: spacing),
              checkboxWidget,
            ],
          ),
        );
      } else {
        return IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              checkboxWidget,
              SizedBox(width: spacing),
              content,
            ],
          ),
        );
      }
    }
    
    return checkboxWidget;
  }
  
  Widget _buildCheckbox(BuildContext context, bool isDisabled) {
    if (customCheckbox != null) {
      return customCheckbox!;
    }

    switch (variant) {
      case CheckboxVariant.checkbox:
        return _buildMaterialCheckbox(context, isDisabled);
      case CheckboxVariant.radio:
        return _buildRadioButton(context, isDisabled);
      case CheckboxVariant.switchButton:
        return _buildSwitch(context, isDisabled);
    }
  }

  Widget _buildMaterialCheckbox(BuildContext context, bool isDisabled) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.radiusXs),
        boxShadow: value && !isDisabled
            ? [
                BoxShadow(
                  color: (activeColor ?? BrandColors.primary).withValues(alpha: 0.3),
                  blurRadius: AppSizes.xs,
                  offset: const Offset(0, AppSizes.xxs),
                ),
              ]
            : null,
      ),
      child: Checkbox(
        value: value,
        onChanged: isDisabled ? null : (bool? newValue) {
          if (newValue != null) {
            onChanged?.call(newValue);
          }
        },
        activeColor: activeColor ?? BrandColors.primary,
        checkColor: BrandColors.buttonText,
        fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.disabled)) {
            return BrandColors.surfaceVariant;
          }
          if (states.contains(WidgetState.selected)) {
            return activeColor ?? BrandColors.primary;
          }
          return inactiveColor ?? BrandColors.outline;
        }),
        side: WidgetStateBorderSide.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return BorderSide(color: BrandColors.outline);
          }
          return BorderSide(color: BrandColors.outline);
        }),
      ),
    );
  }

  Widget _buildRadioButton(BuildContext context, bool isDisabled) {
    return Radio<bool>(
      value: true,
      groupValue: value,
      onChanged: isDisabled ? null : (bool? newValue) {
        if (newValue != null) {
          onChanged?.call(newValue);
        }
      },
      activeColor: activeColor ?? BrandColors.primary,
      fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.disabled)) {
          return BrandColors.surfaceVariant;
        }
        if (states.contains(WidgetState.selected)) {
          return activeColor ?? BrandColors.primary;
        }
        return inactiveColor ?? BrandColors.outline;
      }),
    );
  }

  Widget _buildSwitch(BuildContext context, bool isDisabled) {
    return Switch(
      value: value,
      onChanged: isDisabled ? null : onChanged,
      activeColor: activeColor ?? BrandColors.primary,
      inactiveThumbColor: inactiveColor ?? BrandColors.outline,
      inactiveTrackColor: BrandColors.surfaceVariant,
      activeTrackColor: (activeColor ?? BrandColors.primary).withValues(alpha: 0.3),
    );
  }

  Widget _buildLabel(BuildContext context, bool isDisabled) {
    return Text(
      required ? '$label *' : label ?? '',
      style: labelStyle ??
          context.body(
            color: isDisabled
                ? BrandColors.textSecondary.withValues(alpha: 0.5)
                : BrandColors.textPrimary,
          ),
    );
  }

  Widget _buildDescription(BuildContext context, bool isDisabled) {
    return Text(
      description ?? '',
      style: descriptionStyle ??
          context.small(
            color: isDisabled
                ? BrandColors.textSecondary.withValues(alpha: 0.5)
                : BrandColors.textSecondary,
          ),
    );
  }
}

/// Checkbox variants
enum CheckboxVariant {
  checkbox,
  radio,
  switchButton,
}

/// Convenience constructors for common checkbox types
extension CustomCheckboxConstructors on CustomCheckbox {
  /// Standard checkbox
  static CustomCheckbox standard({
    required bool value,
    ValueChanged<bool>? onChanged,
    String? label,
    String? description,
    bool enabled = true,
    bool required = false,
    Key? key,
  }) {
    return CustomCheckbox(
      key: key,
      value: value,
      onChanged: onChanged,
      variant: CheckboxVariant.checkbox,
      label: label,
      description: description,
      enabled: enabled,
      required: required,
    );
  }
  
  /// Radio button
  static CustomCheckbox radio({
    required bool value,
    ValueChanged<bool>? onChanged,
    String? label,
    String? description,
    bool enabled = true,
    bool required = false,
    Key? key,
  }) {
    return CustomCheckbox(
      key: key,
      value: value,
      onChanged: onChanged,
      variant: CheckboxVariant.radio,
      label: label,
      description: description,
      enabled: enabled,
      required: required,
    );
  }
  
  /// Switch
  static CustomCheckbox switchButton({
    required bool value,
    ValueChanged<bool>? onChanged,
    String? label,
    String? description,
    bool enabled = true,
    bool required = false,
    Key? key,
  }) {
    return CustomCheckbox(
      key: key,
      value: value,
      onChanged: onChanged,
      variant: CheckboxVariant.switchButton,
      label: label,
      description: description,
      enabled: enabled,
      required: required,
    );
  }
}
