import 'package:flutter/material.dart';
import '../../../app/theme/app_sizes.dart';

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

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: existingDate ?? initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? DateTime(2100),
      helpText: 'Select Date',
      cancelText: 'Cancel',
      confirmText: 'Select',
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
    final colorScheme = Theme.of(context).colorScheme;

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
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    size: AppSizes.iconSize,
                    color: colorScheme.primary,
                  )
                : const Icon(Icons.calendar_today_outlined),
            suffixIcon: value.text.isNotEmpty
                ? IconButton(
                    icon: Icon(
                      Icons.clear,
                      size: 18,
                      color: colorScheme.onSurface.withOpacity(0.6),
                    ),
                    onPressed: _clearDate,
                    tooltip: 'Clear date',
                    padding: const EdgeInsets.all(8),
                    constraints: const BoxConstraints(),
                  )
                : const Icon(Icons.arrow_drop_down),
            labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: colorScheme.primary,
            ),
            ),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurface,
          ),
        );
      },
    );
  }
}

