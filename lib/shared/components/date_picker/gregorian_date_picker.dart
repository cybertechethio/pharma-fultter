import 'package:flutter/material.dart';
import 'package:cyber_pos/l10n/app_localizations.dart';

/// Gregorian calendar date picker
class GregorianDatePicker extends StatefulWidget {
  final DateTime initialDate;
  final Function(DateTime) onDateSelected;
  final DateTime? minDate;
  final DateTime? maxDate;

  const GregorianDatePicker({
    super.key,
    required this.initialDate,
    required this.onDateSelected,
    this.minDate,
    this.maxDate,
  });

  @override
  State<GregorianDatePicker> createState() => _GregorianDatePickerState();
}

class _GregorianDatePickerState extends State<GregorianDatePicker> {
  late DateTime _selectedDate;
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
        _currentMonth = 12;
        _currentYear--;
      } else {
        _currentMonth--;
      }
    });
  }

  void _nextMonth() {
    setState(() {
      if (_currentMonth == 12) {
        _currentMonth = 1;
        _currentYear++;
      } else {
        _currentMonth++;
      }
    });
  }

  void _selectDate(int day) {
    final newDate = DateTime(_currentYear, _currentMonth, day);
    setState(() {
      _selectedDate = newDate;
    });
    widget.onDateSelected(newDate);
  }

  void _selectToday() {
    final today = DateTime.now();
    setState(() {
      _selectedDate = today;
      _currentMonth = today.month;
      _currentYear = today.year;
    });
    widget.onDateSelected(today);
  }

  int _getDaysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }

  int _getFirstDayOfWeek(int year, int month) {
    return DateTime(year, month, 1).weekday;
  }

  List<String> _getMonthNames() {
    final locale = Localizations.localeOf(context);
    
    if (locale.languageCode == 'am') {
      return [
        'ጃንዋሪ', 'ፌብሯሪ', 'ማርች', 'ኤፕሪል', 'ሜይ', 'ጁን',
        'ጁላይ', 'ኦገስት', 'ሴፕቴምበር', 'ኦክቶበር', 'ኖቬምበር', 'ዲሴምበር'
      ];
    } else {
      return [
        'January', 'February', 'March', 'April', 'May', 'June',
        'July', 'August', 'September', 'October', 'November', 'December'
      ];
    }
  }

  List<String> _getDayNames() {
    final locale = Localizations.localeOf(context);
    
    if (locale.languageCode == 'am') {
      return ['እሑድ', 'ሰኞ', 'ማክሰኞ', 'ረቡዕ', 'ሐሙስ', 'ዓርብ', 'ቅዳሜ'];
    } else {
      return ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final daysInMonth = _getDaysInMonth(_currentYear, _currentMonth);
    final firstDayOfWeek = _getFirstDayOfWeek(_currentYear, _currentMonth);
    final monthNames = _getMonthNames();
    final dayNames = _getDayNames();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Month/Year header with navigation
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: _previousMonth,
                color: theme.colorScheme.onPrimaryContainer,
              ),
              Column(
                children: [
                  Text(
                    monthNames[_currentMonth - 1],
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _currentYear.toString(),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: _nextMonth,
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ],
          ),
        ),

        // Day names header
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: dayNames.map((day) {
              return Expanded(
                child: Text(
                  day,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              );
            }).toList(),
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
            itemCount: 42, // 6 weeks
            itemBuilder: (context, index) {
              final dayOffset = index - (firstDayOfWeek % 7);
              
              if (dayOffset < 0 || dayOffset >= daysInMonth) {
                return const SizedBox.shrink();
              }
              
              final day = dayOffset + 1;
              final isSelected = _selectedDate.day == day &&
                  _selectedDate.month == _currentMonth &&
                  _selectedDate.year == _currentYear;
              
              final today = DateTime.now();
              final isToday = today.day == day &&
                  today.month == _currentMonth &&
                  today.year == _currentYear;

              return InkWell(
                onTap: () => _selectDate(day),
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected
                        ? theme.colorScheme.primary
                        : isToday
                            ? theme.colorScheme.primaryContainer
                            : null,
                    borderRadius: BorderRadius.circular(8),
                    border: isToday && !isSelected
                        ? Border.all(
                            color: theme.colorScheme.primary,
                            width: 2,
                          )
                        : null,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    day.toString(),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: isSelected
                          ? theme.colorScheme.onPrimary
                          : isToday
                              ? theme.colorScheme.primary
                              : theme.colorScheme.onSurface,
                      fontWeight: isSelected || isToday
                          ? FontWeight.bold
                          : FontWeight.normal,
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

