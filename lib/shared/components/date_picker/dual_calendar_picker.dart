import 'package:flutter/material.dart';
import 'package:abushakir/abushakir.dart';
import 'package:cyber_pos/l10n/app_localizations.dart';
import '../../utils/calendar_converter.dart';
import '../../models/calendar_type.dart';
import 'ethiopian_date_picker.dart';
import 'gregorian_date_picker.dart';

/// Dual calendar picker that allows switching between Gregorian and Ethiopian calendars
class DualCalendarPicker extends StatefulWidget {
  final DateTime? initialGregorianDate;
  final Function(DateTime gregorianDate, EtDatetime ethiopianDate, CalendarType activeCalendarType) onDateSelected;
  final CalendarType? initialCalendarType;

  const DualCalendarPicker({
    super.key,
    this.initialGregorianDate,
    required this.onDateSelected,
    this.initialCalendarType,
  });

  /// Show dual calendar picker as a bottom sheet
  static Future<void> show({
    required BuildContext context,
    DateTime? initialDate,
    CalendarType? initialCalendarType,
    required Function(DateTime gregorianDate, EtDatetime ethiopianDate, CalendarType activeCalendarType) onDateSelected,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DualCalendarPickerSheet(
        initialGregorianDate: initialDate ?? DateTime.now(),
        onDateSelected: onDateSelected,
        initialCalendarType: initialCalendarType,
      ),
    );
  }

  @override
  State<DualCalendarPicker> createState() => _DualCalendarPickerState();
}

class _DualCalendarPickerState extends State<DualCalendarPicker> {
  late CalendarType _calendarType;
  late DateTime _gregorianDate;
  late EtDatetime _ethiopianDate;

  @override
  void initState() {
    super.initState();
    _gregorianDate = widget.initialGregorianDate ?? DateTime.now();
    _ethiopianDate = CalendarConverter.toEthiopian(_gregorianDate);
    
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

  void _onGregorianDateSelected(DateTime date) {
    setState(() {
      _gregorianDate = date;
      _ethiopianDate = CalendarConverter.toEthiopian(date);
    });
    widget.onDateSelected(_gregorianDate, _ethiopianDate, _calendarType);
  }

  void _onEthiopianDateSelected(EtDatetime date) {
    setState(() {
      _ethiopianDate = date;
      _gregorianDate = CalendarConverter.toGregorian(date);
    });
    widget.onDateSelected(_gregorianDate, _ethiopianDate, _calendarType);
  }

  void _switchCalendar() {
    setState(() {
      _calendarType = _calendarType == CalendarType.gregorian
          ? CalendarType.ethiopian
          : CalendarType.gregorian;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Calendar type selector
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
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
              ],
            ),
          ),

          // Calendar widget
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _calendarType == CalendarType.gregorian
                ? GregorianDatePicker(
                    key: const ValueKey('gregorian'),
                    initialDate: _gregorianDate,
                    onDateSelected: _onGregorianDateSelected,
                  )
                : EthiopianDatePicker(
                    key: const ValueKey('ethiopian'),
                    initialDate: _ethiopianDate,
                    onDateSelected: _onEthiopianDateSelected,
                  ),
          ),
        ],
      ),
    );
  }
}

/// Bottom sheet wrapper for dual calendar picker
class DualCalendarPickerSheet extends StatefulWidget {
  final DateTime initialGregorianDate;
  final Function(DateTime gregorianDate, EtDatetime ethiopianDate, CalendarType activeCalendarType) onDateSelected;
  final CalendarType? initialCalendarType;

  const DualCalendarPickerSheet({
    super.key,
    required this.initialGregorianDate,
    required this.onDateSelected,
    this.initialCalendarType,
  });

  @override
  State<DualCalendarPickerSheet> createState() => _DualCalendarPickerSheetState();
}

class _DualCalendarPickerSheetState extends State<DualCalendarPickerSheet> {
  late DateTime _selectedGregorianDate;
  late EtDatetime _selectedEthiopianDate;
  late CalendarType _activeCalendarType;

  @override
  void initState() {
    super.initState();
    _selectedGregorianDate = widget.initialGregorianDate;
    _selectedEthiopianDate = CalendarConverter.toEthiopian(widget.initialGregorianDate);
    
    // Initialize active calendar type
    if (widget.initialCalendarType != null) {
      _activeCalendarType = widget.initialCalendarType!;
    } else {
      final locale = WidgetsBinding.instance.platformDispatcher.locale;
      _activeCalendarType = locale.languageCode == 'am'
          ? CalendarType.ethiopian
          : CalendarType.gregorian;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
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

          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.selectDate,
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

          // Calendar picker
          Flexible(
            child: SingleChildScrollView(
              child: DualCalendarPicker(
                initialGregorianDate: widget.initialGregorianDate,
                initialCalendarType: widget.initialCalendarType,
                onDateSelected: (gregorian, ethiopian, activeCalendarType) {
                  setState(() {
                    _selectedGregorianDate = gregorian;
                    _selectedEthiopianDate = ethiopian;
                    _activeCalendarType = activeCalendarType;
                  });
                },
              ),
            ),
          ),

          // Confirm button
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  widget.onDateSelected(_selectedGregorianDate, _selectedEthiopianDate, _activeCalendarType);
                  Navigator.pop(context);
                },
                child: Text(
                  l10n.ok,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

