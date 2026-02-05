import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/models/calendar_type.dart';
import '../../../../../shared/utils/calendar_converter.dart';
import '../../../../../shared/components/date_picker/dual_calendar_picker.dart';

/// Simple date selector for annual report (single date picker)
class AnnualDateSelector extends ConsumerWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateChanged;

  const AnnualDateSelector({
    super.key,
    required this.selectedDate,
    required this.onDateChanged,
  });

  Future<void> _selectDate(BuildContext context, WidgetRef ref) async {
    const calendarType = CalendarType.gregorian;

    await DualCalendarPicker.show(
      context: context,
      initialDate: selectedDate,
      initialCalendarType: calendarType,
      onDateSelected: (gregorianDate, ethiopianDate, activeCalendarType) {
        // Always use gregorian date for API calls
        onDateChanged(gregorianDate);
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    const calendarType = CalendarType.gregorian;

    // Format date based on calendar type
    String formattedDate;
    if (calendarType == CalendarType.ethiopian) {
      final etDate = CalendarConverter.toEthiopian(selectedDate);
      formattedDate = CalendarConverter.formatEthiopianDate(etDate, l10n);
    } else {
      final dateFormat = DateFormat('MMM d, yyyy');
      formattedDate = dateFormat.format(selectedDate);
    }

    return InkWell(
      onTap: () => _selectDate(context, ref),
      borderRadius: BorderRadius.circular(AppSizes.radiusSm),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.md,
          vertical: AppSizes.sm,
        ),
        decoration: BoxDecoration(
          color: BrandColors.cardBackground,
          borderRadius: BorderRadius.circular(AppSizes.radiusSm),
          border: Border.all(
            color: BrandColors.divider,
            width: AppSizes.br,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              formattedDate,
              style: context.body(),
            ),
            const SizedBox(width: AppSizes.xs),
            Icon(
              Icons.arrow_drop_down,
              size: AppSizes.iconSize,
              color: BrandColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}

