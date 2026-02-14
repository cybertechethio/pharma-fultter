import 'package:flutter/material.dart';
import 'package:cyber_pos/l10n/app_localizations.dart';

import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/brand_colors.dart';
import '../../../app/theme/text_styles.dart';

/// Reusable date picker field widget (date only, no time)
/// 
/// Features:
/// - Date picker dialog (date only, no time)
/// - Formatted date display (YYYY-MM-DD)
/// - Optional validation
/// - Theme-aware styling
/// 
/// Usage:
/// ```dart
/// DatePickerField(
///   labelText: 'Expiration Date',
///   controller: _expirationDateController,
///   validator: (value) => value?.isEmpty == true ? 'Date is required' : null,
/// )
/// ```
class DatePickerField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime? initialDate;

  const DatePickerField({
    super.key,
    required this.labelText,
    required this.controller,
    this.validator,
    this.prefixIcon,
    this.firstDate,
    this.lastDate,
    this.initialDate,
  });

  Future<void> _selectDate(BuildContext context) async {
    // Try to parse existing date from controller, otherwise use initialDate or now
    DateTime? existingDate;
    if (controller.text.isNotEmpty) {
      try {
        existingDate = DateTime.parse(controller.text);
      } catch (e) {
        // Invalid date format, ignore
      }
    }

    final l10n = AppLocalizations.of(context);
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: existingDate ?? initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? DateTime(2100),
      helpText: l10n.selectDate,
      cancelText: l10n.cancel,
      confirmText: l10n.select,
    );

    if (picked != null) {
      // Format as YYYY-MM-DD
      final formattedDate = '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
      controller.text = formattedDate;
    }
  }

  void _clearDate() {
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final labelStyle = context.small(color: BrandColors.inputPlaceholder);
    final inputStyle = context.body(color: BrandColors.inputText);

    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controller,
      builder: (context, value, child) {
        return TextFormField(
          controller: controller,
          readOnly: true,
          validator: validator,
          onTap: () => _selectDate(context),
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: labelStyle,
            prefixIcon: Icon(
              prefixIcon ?? Icons.calendar_today_outlined,
              size: AppSizes.iconSize,
              color: BrandColors.inputPlaceholder,
            ),
            suffixIcon: value.text.isNotEmpty
                ? IconButton(
                    icon: Icon(
                      Icons.clear_rounded,
                      size: AppSizes.iconSizeSm,
                      color: BrandColors.inputPlaceholder,
                    ),
                    onPressed: _clearDate,
                    tooltip: 'Clear date',
                    padding: const EdgeInsets.all(AppSizes.sm),
                    constraints: const BoxConstraints(),
                  )
                : Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: AppSizes.iconSizeLg,
                    color: BrandColors.inputPlaceholder,
                  ),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppSizes.md,
              vertical: 15,
            ),
          ),
          style: inputStyle,
        );
      },
    );
  }
}

