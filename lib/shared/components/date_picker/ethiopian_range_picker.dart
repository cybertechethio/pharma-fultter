import 'package:flutter/material.dart';
import 'package:abushakir/abushakir.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/brand_colors.dart';
import '../../../app/theme/text_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../utils/calendar_converter.dart';

/// Ethiopian calendar range picker with visual range highlighting
class EthiopianRangePicker extends StatefulWidget {
  final EtDatetime startDate;
  final EtDatetime endDate;
  final Function(EtDatetime startDate, EtDatetime endDate) onRangeSelected;
  final EtDatetime? minDate;
  final EtDatetime? maxDate;

  const EthiopianRangePicker({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.onRangeSelected,
    this.minDate,
    this.maxDate,
  });

  @override
  State<EthiopianRangePicker> createState() => _EthiopianRangePickerState();
}

class _EthiopianRangePickerState extends State<EthiopianRangePicker> {
  late EtDatetime _startDate;
  late EtDatetime _endDate;
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
  void didUpdateWidget(EthiopianRangePicker oldWidget) {
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
    final selectedDate = CalendarConverter.createEthiopianDate(
      _currentYear,
      _currentMonth,
      day,
    );
    final today = CalendarConverter.getEthiopianToday();

    // Don't allow future dates
    if (selectedDate.moment > today.moment) {
      return;
    }

    setState(() {
      if (_isSelectingStart) {
        _startDate = selectedDate;
        _endDate = selectedDate;
        _isSelectingStart = false;
      } else {
        // Compare dates using moment (milliseconds since epoch)
        if (selectedDate.moment < _startDate.moment) {
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

  void _selectToday() {
    final today = CalendarConverter.getEthiopianToday();
    setState(() {
      _endDate = today;
      _currentMonth = today.month;
      _currentYear = today.year;
    });
    widget.onRangeSelected(_startDate, _endDate);
  }

  bool _isInRange(EtDatetime date) {
    return date.moment > _startDate.moment && date.moment < _endDate.moment;
  }

  bool _isStartDate(EtDatetime date) {
    return date.year == _startDate.year &&
        date.month == _startDate.month &&
        date.day == _startDate.day;
  }

  bool _isEndDate(EtDatetime date) {
    return date.year == _endDate.year &&
        date.month == _endDate.month &&
        date.day == _endDate.day;
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
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            itemCount: daysInMonth,
            itemBuilder: (context, index) {
              final day = index + 1;
              final currentDate = CalendarConverter.createEthiopianDate(
                _currentYear,
                _currentMonth,
                day,
              );
              final isStart = _isStartDate(currentDate);
              final isEnd = _isEndDate(currentDate);
              final isInRange = _isInRange(currentDate);

              final today = CalendarConverter.getEthiopianToday();
              final isToday = today.day == day &&
                  today.month == _currentMonth &&
                  today.year == _currentYear;

              // Check if date is in future
              final isFuture = currentDate.moment > today.moment;

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

