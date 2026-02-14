import 'package:flutter/material.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/brand_colors.dart';
import '../../../app/theme/text_styles.dart';

/// Gregorian calendar range picker with visual range highlighting
class GregorianRangePicker extends StatefulWidget {
  final DateTime startDate;
  final DateTime endDate;
  final Function(DateTime startDate, DateTime endDate) onRangeSelected;
  final DateTime? minDate;
  final DateTime? maxDate;

  const GregorianRangePicker({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.onRangeSelected,
    this.minDate,
    this.maxDate,
  });

  @override
  State<GregorianRangePicker> createState() => _GregorianRangePickerState();
}

class _GregorianRangePickerState extends State<GregorianRangePicker> {
  late DateTime _startDate;
  late DateTime _endDate;
  late int _currentMonth;
  late int _currentYear;
  bool _isSelectingStart = true;

  @override
  void initState() {
    super.initState();
    _startDate = widget.startDate;
    _endDate = widget.endDate;
    _currentMonth = _endDate.month;
    _currentYear = _endDate.year;
  }

  @override
  void didUpdateWidget(GregorianRangePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.startDate != widget.startDate ||
        oldWidget.endDate != widget.endDate) {
      setState(() {
        _startDate = widget.startDate;
        _endDate = widget.endDate;
      });
    }
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
    final selectedDate = DateTime(_currentYear, _currentMonth, day);
    final today = DateTime.now();
    final todayOnly = DateTime(today.year, today.month, today.day);

    // Don't allow future dates
    if (selectedDate.isAfter(todayOnly)) {
      return;
    }

    setState(() {
      if (_isSelectingStart) {
        _startDate = selectedDate;
        _endDate = selectedDate;
        _isSelectingStart = false;
      } else {
        if (selectedDate.isBefore(_startDate)) {
          // If selected date is before start, make it the new start
          _startDate = selectedDate;
        } else {
          _endDate = selectedDate;
        }
        _isSelectingStart = true;
      }
    });

    widget.onRangeSelected(_startDate, _endDate);
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
        'ጃንዋሪ',
        'ፌብሯሪ',
        'ማርች',
        'ኤፕሪል',
        'ሜይ',
        'ጁን',
        'ጁላይ',
        'ኦገስት',
        'ሴፕቴምበር',
        'ኦክቶበር',
        'ኖቬምበር',
        'ዲሴምበር'
      ];
    } else {
      return [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December'
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

  bool _isInRange(DateTime date) {
    final dateOnly = DateTime(date.year, date.month, date.day);
    final startOnly = DateTime(_startDate.year, _startDate.month, _startDate.day);
    final endOnly = DateTime(_endDate.year, _endDate.month, _endDate.day);

    return dateOnly.isAfter(startOnly) && dateOnly.isBefore(endOnly);
  }

  bool _isStartDate(DateTime date) {
    return date.year == _startDate.year &&
        date.month == _startDate.month &&
        date.day == _startDate.day;
  }

  bool _isEndDate(DateTime date) {
    return date.year == _endDate.year &&
        date.month == _endDate.month &&
        date.day == _endDate.day;
  }

  @override
  Widget build(BuildContext context) {
    final daysInMonth = _getDaysInMonth(_currentYear, _currentMonth);
    final firstDayOfWeek = _getFirstDayOfWeek(_currentYear, _currentMonth);
    final monthNames = _getMonthNames();
    final dayNames = _getDayNames();

    return SingleChildScrollView(
      child: Column(
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
                    monthNames[_currentMonth - 1],
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
                  style: context.small(
                    color: BrandColors.textSecondary,
                    bold: true,
                  ),
                ),
              );
            }).toList(),
          ),
        ),

        // Calendar grid
        Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            itemCount: 42, // 6 weeks
            itemBuilder: (context, index) {
              final dayOffset = index - (firstDayOfWeek % 7);

              if (dayOffset < 0 || dayOffset >= daysInMonth) {
                return const SizedBox.shrink();
              }

              final day = dayOffset + 1;
              final currentDate = DateTime(_currentYear, _currentMonth, day);
              final isStart = _isStartDate(currentDate);
              final isEnd = _isEndDate(currentDate);
              final isInRange = _isInRange(currentDate);

              final today = DateTime.now();
              final isToday = today.day == day &&
                  today.month == _currentMonth &&
                  today.year == _currentYear;

              // Check if date is in future
              final isFuture = currentDate.isAfter(DateTime.now());

              return _buildDayCell(
                context,
                day: day,
                isStart: isStart,
                isEnd: isEnd,
                isInRange: isInRange,
                isToday: isToday,
                isFuture: isFuture,
                onTap: isFuture ? null : () => _selectDate(day),
              );
            },
          ),
        ),

        ],
      ),
    );
  }

  Widget _buildDayCell(
    BuildContext context, {
    required int day,
    required bool isStart,
    required bool isEnd,
    required bool isInRange,
    required bool isToday,
    required bool isFuture,
    required VoidCallback? onTap,
  }) {
    final isSelected = isStart || isEnd;

    // Determine background decoration
    BoxDecoration? decoration;
    Color? textColor;

    if (isFuture) {
      textColor = BrandColors.textPrimary.withValues(alpha: 0.3);
    } else if (isSelected) {
      decoration = BoxDecoration(
        color: BrandColors.primary,
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
      );
      textColor = BrandColors.buttonText;
    } else if (isInRange) {
      decoration = BoxDecoration(
        color: BrandColors.primary.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(AppSizes.radiusXs),
      );
      textColor = BrandColors.primary;
    } else if (isToday) {
      decoration = BoxDecoration(
        border: Border.all(
          color: BrandColors.primary,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
      );
      textColor = BrandColors.primary;
    }

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.radiusSm),
      child: Container(
        decoration: decoration,
        alignment: Alignment.center,
        child: Text(
          day.toString(),
          style: context.body(
            color: textColor ?? BrandColors.textPrimary,
            bold: isSelected || isToday,
          ),
        ),
      ),
    );
  }
}

