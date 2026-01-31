import 'package:flutter/material.dart';
import 'package:abushakir/abushakir.dart';
import 'package:cyber_pos/l10n/app_localizations.dart';
import '../../utils/calendar_converter.dart';
import '../../models/calendar_type.dart';

enum _SelectionMode { selectingStart, selectingEnd }

/// Date range picker with dual calendar support (Gregorian & Ethiopian)
/// 
/// **Usage:**
/// ```dart
/// DateRangePicker.show(
///   context: context,
///   onRangeSelected: (startGC, endGC, startET, endET) {
///     // Always store startGC and endGC
///     saveRange(startGC, endGC);
///   },
/// );
/// ```
class DateRangePicker {
  /// Show date range picker as a bottom sheet
  static Future<void> show({
    required BuildContext context,
    DateTime? initialStartDate,
    DateTime? initialEndDate,
    CalendarType? initialCalendarType,
    required Function(
      DateTime startGC,
      DateTime endGC,
      EtDatetime startET,
      EtDatetime endET,
    ) onRangeSelected,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _DateRangePickerSheet(
        initialStartDate: initialStartDate,
        initialEndDate: initialEndDate,
        initialCalendarType: initialCalendarType,
        onRangeSelected: onRangeSelected,
      ),
    );
  }
}

class _DateRangePickerSheet extends StatefulWidget {
  final DateTime? initialStartDate;
  final DateTime? initialEndDate;
  final CalendarType? initialCalendarType;
  final Function(DateTime, DateTime, EtDatetime, EtDatetime) onRangeSelected;

  const _DateRangePickerSheet({
    this.initialStartDate,
    this.initialEndDate,
    this.initialCalendarType,
    required this.onRangeSelected,
  });

  @override
  State<_DateRangePickerSheet> createState() => _DateRangePickerSheetState();
}

class _DateRangePickerSheetState extends State<_DateRangePickerSheet> {
  late CalendarType _calendarType;
  DateTime? _startGC;
  DateTime? _endGC;
  _SelectionMode _mode = _SelectionMode.selectingStart;

  @override
  void initState() {
    super.initState();
    
    // Auto-select today as start date if no initial dates provided
    if (widget.initialStartDate != null) {
      _startGC = widget.initialStartDate;
    } else {
      _startGC = DateTime.now();
    }
    
    _endGC = widget.initialEndDate;
    
    // Default calendar type based on locale
    if (widget.initialCalendarType != null) {
      _calendarType = widget.initialCalendarType!;
    } else {
      final locale = WidgetsBinding.instance.platformDispatcher.locale;
      _calendarType = locale.languageCode == 'am' 
          ? CalendarType.ethiopian 
          : CalendarType.gregorian;
    }
  }

  void _handleDateSelected(DateTime date) {
    setState(() {
      if (_mode == _SelectionMode.selectingStart) {
        _startGC = date;
        _endGC = null; // Reset end date
        _mode = _SelectionMode.selectingEnd;
      } else {
        // Ensure end is after start
        if (_startGC != null && date.isAfter(_startGC!)) {
          _endGC = date;
        } else {
          // If end is before start, swap them
          _endGC = _startGC;
          _startGC = date;
        }
      }
    });
  }

  void _clearSelection() {
    setState(() {
      _startGC = null;
      _endGC = null;
      _mode = _SelectionMode.selectingStart;
    });
  }

  void _confirmSelection() {
    if (_startGC != null && _endGC != null) {
      final startET = CalendarConverter.toEthiopian(_startGC!);
      final endET = CalendarConverter.toEthiopian(_endGC!);
      widget.onRangeSelected(_startGC!, _endGC!, startET, endET);
      Navigator.pop(context);
    }
  }

  int? _getDuration() {
    if (_startGC != null && _endGC != null) {
      return _endGC!.difference(_startGC!).inDays;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final size = MediaQuery.of(context).size;

    return Container(
      constraints: BoxConstraints(
        maxHeight: size.height * 0.9,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: theme.colorScheme.onSurfaceVariant.withOpacity(0.4),
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Title and close button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.selectDateRange,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),

          const Divider(height: 1),

          // Selection status
          Container(
            padding: const EdgeInsets.all(16),
            color: theme.colorScheme.primaryContainer.withOpacity(0.5),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _DateChip(
                        label: l10n.startDate,
                        date: _startGC,
                        isSelected: _mode == _SelectionMode.selectingStart,
                        theme: theme,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.arrow_forward,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _DateChip(
                        label: l10n.endDate,
                        date: _endGC,
                        isSelected: _mode == _SelectionMode.selectingEnd,
                        theme: theme,
                      ),
                    ),
                  ],
                ),
                if (_getDuration() != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    '${l10n.duration}: ${l10n.days(_getDuration()!)}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ],
            ),
          ),

          // Calendar type selector
          Padding(
            padding: const EdgeInsets.all(16),
            child: SegmentedButton<CalendarType>(
              segments: [
                ButtonSegment(
                  value: CalendarType.gregorian,
                  label: Text(l10n.gregorianCalendar),
                  icon: const Icon(Icons.calendar_today),
                ),
                ButtonSegment(
                  value: CalendarType.ethiopian,
                  label: Text(l10n.ethiopianCalendar),
                  icon: const Icon(Icons.calendar_month),
                ),
              ],
              selected: {_calendarType},
              onSelectionChanged: (Set<CalendarType> newSelection) {
                setState(() {
                  _calendarType = newSelection.first;
                });
              },
            ),
          ),

          // Calendar view
          Flexible(
            child: SingleChildScrollView(
              child: _calendarType == CalendarType.gregorian
                  ? _GregorianRangeCalendar(
                      startDate: _startGC,
                      endDate: _endGC,
                      onDateSelected: _handleDateSelected,
                    )
                  : _EthiopianRangeCalendar(
                      startDate: _startGC,
                      endDate: _endGC,
                      onDateSelected: _handleDateSelected,
                    ),
            ),
          ),

          // Action buttons
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _clearSelection,
                    child: Text(l10n.clearSelection),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: _startGC != null && _endGC != null
                        ? _confirmSelection
                        : null,
                    child: Text(l10n.ok),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DateChip extends StatelessWidget {
  final String label;
  final DateTime? date;
  final bool isSelected;
  final ThemeData theme;

  const _DateChip({
    required this.label,
    required this.date,
    required this.isSelected,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSelected
            ? theme.colorScheme.primary.withOpacity(0.1)
            : theme.colorScheme.surface,
        border: Border.all(
          color: isSelected
              ? theme.colorScheme.primary
              : theme.colorScheme.outline.withOpacity(0.5),
          width: isSelected ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            date != null
                ? '${date!.month}/${date!.day}'
                : '---',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: date != null
                  ? theme.colorScheme.onSurface
                  : theme.colorScheme.onSurfaceVariant.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}

class _GregorianRangeCalendar extends StatefulWidget {
  final DateTime? startDate;
  final DateTime? endDate;
  final Function(DateTime) onDateSelected;

  const _GregorianRangeCalendar({
    this.startDate,
    this.endDate,
    required this.onDateSelected,
  });

  @override
  State<_GregorianRangeCalendar> createState() => _GregorianRangeCalendarState();
}

class _GregorianRangeCalendarState extends State<_GregorianRangeCalendar> {
  late int _currentMonth;
  late int _currentYear;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _currentMonth = now.month;
    _currentYear = now.year;
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

  bool _isInRange(DateTime date) {
    if (widget.startDate == null || widget.endDate == null) return false;
    return date.isAfter(widget.startDate!) &&
        date.isBefore(widget.endDate!);
  }

  bool _isStartOrEnd(DateTime date) {
    if (widget.startDate != null &&
        date.year == widget.startDate!.year &&
        date.month == widget.startDate!.month &&
        date.day == widget.startDate!.day) {
      return true;
    }
    if (widget.endDate != null &&
        date.year == widget.endDate!.year &&
        date.month == widget.endDate!.month &&
        date.day == widget.endDate!.day) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = Localizations.localeOf(context);
    
    final monthNames = locale.languageCode == 'am'
        ? ['ጃንዋሪ', 'ፌብሯሪ', 'ማርች', 'ኤፕሪል', 'ሜይ', 'ጁን',
           'ጁላይ', 'ኦገስት', 'ሴፕቴምበር', 'ኦክቶበር', 'ኖቬምበር', 'ዲሴምበር']
        : ['January', 'February', 'March', 'April', 'May', 'June',
           'July', 'August', 'September', 'October', 'November', 'December'];
    
    final dayNames = locale.languageCode == 'am'
        ? ['እሑድ', 'ሰኞ', 'ማክሰኞ', 'ረቡዕ', 'ሐሙስ', 'ዓርብ', 'ቅዳሜ']
        : ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    
    final daysInMonth = DateTime(_currentYear, _currentMonth + 1, 0).day;
    final firstDayOfWeek = DateTime(_currentYear, _currentMonth, 1).weekday;

    return Column(
      children: [
        // Month/Year header
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: _previousMonth,
              ),
              Column(
                children: [
                  Text(
                    monthNames[_currentMonth - 1],
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _currentYear.toString(),
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: _nextMonth,
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Day names header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
        
        const SizedBox(height: 8),
        
        // Calendar grid
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemCount: 42,
            itemBuilder: (context, index) {
              final dayOffset = index - (firstDayOfWeek % 7);
              
              if (dayOffset < 0 || dayOffset >= daysInMonth) {
                return const SizedBox.shrink();
              }
              
              final day = dayOffset + 1;
              final date = DateTime(_currentYear, _currentMonth, day);
              final isInRange = _isInRange(date);
              final isStartOrEnd = _isStartOrEnd(date);
              final isToday = DateTime.now().year == date.year &&
                  DateTime.now().month == date.month &&
                  DateTime.now().day == date.day;

              return InkWell(
                onTap: () => widget.onDateSelected(date),
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(
                    color: isStartOrEnd
                        ? theme.colorScheme.primary
                        : isInRange
                            ? theme.colorScheme.primaryContainer
                            : null,
                    borderRadius: BorderRadius.circular(8),
                    border: isToday && !isStartOrEnd
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
                      color: isStartOrEnd
                          ? theme.colorScheme.onPrimary
                          : isInRange
                              ? theme.colorScheme.primary
                              : theme.colorScheme.onSurface,
                      fontWeight: isStartOrEnd || isToday
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _EthiopianRangeCalendar extends StatefulWidget {
  final DateTime? startDate;
  final DateTime? endDate;
  final Function(DateTime) onDateSelected;

  const _EthiopianRangeCalendar({
    this.startDate,
    this.endDate,
    required this.onDateSelected,
  });

  @override
  State<_EthiopianRangeCalendar> createState() => _EthiopianRangeCalendarState();
}

class _EthiopianRangeCalendarState extends State<_EthiopianRangeCalendar> {
  late int _currentMonth;
  late int _currentYear;

  @override
  void initState() {
    super.initState();
    final now = CalendarConverter.getEthiopianToday();
    _currentMonth = now.month;
    _currentYear = now.year;
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

  bool _isInRange(DateTime date) {
    if (widget.startDate == null || widget.endDate == null) return false;
    return date.isAfter(widget.startDate!) &&
        date.isBefore(widget.endDate!);
  }

  bool _isStartOrEnd(DateTime date) {
    if (widget.startDate != null &&
        date.year == widget.startDate!.year &&
        date.month == widget.startDate!.month &&
        date.day == widget.startDate!.day) {
      return true;
    }
    if (widget.endDate != null &&
        date.year == widget.endDate!.year &&
        date.month == widget.endDate!.month &&
        date.day == widget.endDate!.day) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    
    final daysInMonth = CalendarConverter.getDaysInEthiopianMonth(
      _currentYear,
      _currentMonth,
    );

    return Column(
      children: [
        // Month/Year header
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: _previousMonth,
              ),
              Column(
                children: [
                  Text(
                    CalendarConverter.getEthiopianMonthName(_currentMonth, l10n),
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _currentYear.toString(),
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: _nextMonth,
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Calendar grid
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
              final etDate = CalendarConverter.createEthiopianDate(
                _currentYear,
                _currentMonth,
                day,
              );
              final gcDate = CalendarConverter.toGregorian(etDate);
              final isInRange = _isInRange(gcDate);
              final isStartOrEnd = _isStartOrEnd(gcDate);

              return InkWell(
                onTap: () => widget.onDateSelected(gcDate),
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(
                    color: isStartOrEnd
                        ? theme.colorScheme.primary
                        : isInRange
                            ? theme.colorScheme.primaryContainer
                            : null,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    day.toString(),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: isStartOrEnd
                          ? theme.colorScheme.onPrimary
                          : isInRange
                              ? theme.colorScheme.primary
                              : theme.colorScheme.onSurface,
                      fontWeight: isStartOrEnd
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

