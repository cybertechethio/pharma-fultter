import 'package:flutter/material.dart';
import 'package:abushakir/abushakir.dart';
import 'package:cyber_pos/l10n/app_localizations.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/brand_colors.dart';
import '../../../app/theme/text_styles.dart';
import '../../utils/calendar_converter.dart';

/// Ethiopian calendar date picker
class EthiopianDatePicker extends StatefulWidget {
  final EtDatetime initialDate;
  final Function(EtDatetime) onDateSelected;
  final EtDatetime? minDate;
  final EtDatetime? maxDate;

  const EthiopianDatePicker({
    super.key,
    required this.initialDate,
    required this.onDateSelected,
    this.minDate,
    this.maxDate,
  });

  @override
  State<EthiopianDatePicker> createState() => _EthiopianDatePickerState();
}

class _EthiopianDatePickerState extends State<EthiopianDatePicker> {
  late EtDatetime _selectedDate;
  late int _currentMonth;
  late int _currentYear;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
    _currentMonth = widget.initialDate.month;
    _currentYear = widget.initialDate.year;
  }

  void _previousMonth() {
    setState(() {
      if (_currentMonth == 1) {
        _currentMonth = 13;
        _currentYear--;
      } else {
        _currentMonth--;
      }
    });
  }

  void _nextMonth() {
    setState(() {
      if (_currentMonth == 13) {
        _currentMonth = 1;
        _currentYear++;
      } else {
        _currentMonth++;
      }
    });
  }

  void _selectDate(int day) {
    final newDate = CalendarConverter.createEthiopianDate(
      _currentYear,
      _currentMonth,
      day,
    );
    setState(() {
      _selectedDate = newDate;
    });
    widget.onDateSelected(newDate);
  }

  void _selectToday() {
    final today = CalendarConverter.getEthiopianToday();
    setState(() {
      _selectedDate = today;
      _currentMonth = today.month;
      _currentYear = today.year;
    });
    widget.onDateSelected(today);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final daysInMonth = CalendarConverter.getDaysInEthiopianMonth(
      _currentYear,
      _currentMonth,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Month/Year header with navigation
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: BrandColors.primaryContainer,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: _previousMonth,
                color: BrandColors.onPrimaryContainer,
              ),
              Column(
                children: [
                  Text(
                    CalendarConverter.getEthiopianMonthName(_currentMonth, l10n),
                    style: context.title(
                      color: BrandColors.onPrimaryContainer,
                      bold: true,
                    ),
                  ),
                  Text(
                    _currentYear.toString(),
                    style: context.body(color: BrandColors.onPrimaryContainer),
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: _nextMonth,
                color: BrandColors.onPrimaryContainer,
              ),
            ],
          ),
        ),

        // Calendar grid
        Container(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemCount: daysInMonth,
            itemBuilder: (context, index) {
              final day = index + 1;
              final isSelected = _selectedDate.day == day &&
                  _selectedDate.month == _currentMonth &&
                  _selectedDate.year == _currentYear;

              final today = CalendarConverter.getEthiopianToday();
              final isToday = today.day == day &&
                  today.month == _currentMonth &&
                  today.year == _currentYear;

              return InkWell(
                onTap: () => _selectDate(day),
                borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected
                        ? BrandColors.primary
                        : isToday
                            ? BrandColors.primaryContainer
                            : null,
                    borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                    border: isToday && !isSelected
                        ? Border.all(
                            color: BrandColors.primary,
                            width: 2,
                          )
                        : null,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    day.toString(),
                    style: context.body(
                      color: isSelected
                          ? BrandColors.buttonText
                          : isToday
                              ? BrandColors.primary
                              : BrandColors.textPrimary,
                      bold: isSelected || isToday,
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        // Today button
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: _selectToday,
              icon: const Icon(Icons.today),
              label: Text(l10n.today),
            ),
          ),
        ),
      ],
    );
  }
}

