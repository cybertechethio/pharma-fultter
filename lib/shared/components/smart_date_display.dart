import 'package:flutter/material.dart';
import 'package:cyber_pos/l10n/app_localizations.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/brand_colors.dart';
import '../../app/theme/text_styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/calendar_converter.dart';
import '../providers/settings_provider.dart';
import '../models/calendar_type.dart';

/// Smart date display widget that shows EC or GC based on user preference
/// 
/// **Storage Strategy:**
/// - Always stores Gregorian (GC) DateTime as the actual value
/// - Converts to Ethiopian (EC) on-the-fly for display based on user's display preference
/// - This widget handles the conversion automatically
/// 
/// **Display Logic:**
/// 1. Check user's display calendar preference in Settings
/// 2. If auto-detect (default): Use language (Amharic → EC, English → GC)
/// 3. If explicitly set: Always use that calendar type
/// 
/// **Usage:**
/// ```dart
/// SmartDateDisplay(
///   date: DateTime(2025, 1, 15),  // Always pass GC DateTime
/// )
/// ```
class SmartDateDisplay extends ConsumerWidget {
  /// The actual date value (always stored as Gregorian)
  final DateTime date;
  
  /// Text style for the date
  final TextStyle? style;
  
  /// Whether to show full date or short format
  final bool shortFormat;

  const SmartDateDisplay({
    super.key,
    required this.date,
    this.style,
    this.shortFormat = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = Localizations.localeOf(context);
    final l10n = AppLocalizations.of(context);
    final settingsState = ref.watch(settingsProvider);
    
    // Get effective display calendar type based on user preference
    final effectiveCalendarType = settingsState.getEffectiveDisplayCalendarType(
      locale.languageCode,
    );
    
    String displayText;
    
    if (effectiveCalendarType == CalendarType.ethiopian) {
      // Convert to Ethiopian calendar
      final etDate = CalendarConverter.toEthiopian(date);
      displayText = CalendarConverter.formatEthiopianDate(etDate, l10n);
    } else {
      // Show Gregorian calendar
      displayText = CalendarConverter.formatGregorianDate(date, context);
    }
    
    return Text(displayText, style: style);
  }
}

/// Date display with calendar type indicator
/// Shows both the date and which calendar it's using
class SmartDateDisplayWithLabel extends ConsumerWidget {
  final DateTime date;
  final TextStyle? dateStyle;
  final TextStyle? labelStyle;

  const SmartDateDisplayWithLabel({
    super.key,
    required this.date,
    this.dateStyle,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = Localizations.localeOf(context);
    final l10n = AppLocalizations.of(context);
    final settingsState = ref.watch(settingsProvider);
    
    // Get effective display calendar type
    final effectiveCalendarType = settingsState.getEffectiveDisplayCalendarType(
      locale.languageCode,
    );
    
    String displayText;
    String calendarType;
    
    if (effectiveCalendarType == CalendarType.ethiopian) {
      final etDate = CalendarConverter.toEthiopian(date);
      displayText = CalendarConverter.formatEthiopianDate(etDate, l10n);
      calendarType = l10n.ethiopianCalendar;
    } else {
      displayText = CalendarConverter.formatGregorianDate(date, context);
      calendarType = l10n.gregorianCalendar;
    }
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          displayText,
          style: dateStyle ?? context.title(bold: true),
        ),
        Text(
          calendarType,
          style: labelStyle ?? context.small(color: BrandColors.textSecondary),
        ),
      ],
    );
  }
}

/// Dual date display - shows both GC and EC simultaneously
/// Useful for admin panels or when users need to see both formats
class DualDateDisplay extends ConsumerWidget {
  /// The actual date value (always stored as Gregorian)
  final DateTime date;
  
  /// Whether to highlight one format over the other
  final bool highlightEthiopian;

  const DualDateDisplay({
    super.key,
    required this.date,
    this.highlightEthiopian = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    
    final etDate = CalendarConverter.toEthiopian(date);
    final gcDisplay = CalendarConverter.formatGregorianDate(date, context);
    final etDisplay = CalendarConverter.formatEthiopianDate(etDate, l10n);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _DateRow(
          icon: Icons.calendar_today,
          label: l10n.gregorianCalendar,
          value: gcDisplay,
          isHighlighted: !highlightEthiopian,
        ),
        const SizedBox(height: AppSizes.sm),
        _DateRow(
          icon: Icons.calendar_month,
          label: l10n.ethiopianCalendar,
          value: etDisplay,
          isHighlighted: highlightEthiopian,
        ),
      ],
    );
  }
}

class _DateRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool isHighlighted;

  const _DateRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.isHighlighted,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: AppSizes.iconSize,
          color: isHighlighted
              ? BrandColors.primary
              : BrandColors.textSecondary,
        ),
        const SizedBox(width: AppSizes.sm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: context.small(color: BrandColors.textSecondary),
              ),
              Text(
                value,
                style: context.body(
                  bold: isHighlighted,
                  color: isHighlighted
                      ? BrandColors.textPrimary
                      : BrandColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Form field for date selection with smart display
/// Shows the date in the appropriate calendar based on language
class SmartDateFormField extends ConsumerWidget {
  final DateTime? date;
  final String label;
  final Function(DateTime) onDateSelected;
  final String? Function(DateTime?)? validator;

  const SmartDateFormField({
    super.key,
    required this.date,
    required this.label,
    required this.onDateSelected,
    this.validator,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    
    return InkWell(
      onTap: () async {
        // Import dual calendar picker
        final result = await showDatePicker(
          context: context,
          initialDate: date ?? DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
        );
        
        if (result != null) {
          onDateSelected(result);
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          suffixIcon: const Icon(Icons.calendar_month),
        ),
        child: date != null
            ? SmartDateDisplay(date: date!)
            : Text(
                l10n.selectDate,
                style: TextStyle(
                  color: BrandColors.textSecondary,
                ),
              ),
      ),
    );
  }
}

