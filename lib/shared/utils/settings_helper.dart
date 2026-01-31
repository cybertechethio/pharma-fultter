import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/settings_provider.dart';
import '../models/calendar_type.dart';

/// Helper utilities for accessing app settings
/// 
/// Use these helper functions to easily access settings throughout the app
class SettingsHelper {
  /// Get the calendar type used for the default date
  /// 
  /// Returns 'gregorian' or 'ethiopian'
  /// 
  /// Usage:
  /// ```dart
  /// final calendarType = SettingsHelper.getCalendarType(context);
  /// print('Calendar type: $calendarType'); // 'gregorian' or 'ethiopian'
  /// ```
  static CalendarType getCalendarType(WidgetRef ref) {
    final settingsState = ref.read(settingsProvider);
    return settingsState.defaultDateCalendarType;
  }
  
  /// Get the calendar type as string for API calls
  /// 
  /// Returns 'gregorian' or 'ethiopian' as lowercase string
  /// 
  /// Usage:
  /// ```dart
  /// final calendarTypeStr = SettingsHelper.getCalendarTypeString(context);
  /// // Send to backend: calendarType: 'gregorian'
  /// ```
  static String getCalendarTypeString(WidgetRef ref) {
    final settingsState = ref.read(settingsProvider);
    return settingsState.calendarTypeString;
  }
  /// Get the default date from settings
  /// 
  /// Usage in your widgets:
  /// ```dart
  /// final defaultDate = SettingsHelper.getDefaultDate(context);
  /// if (defaultDate != null) {
  ///   // Use the default date for filtering
  ///   print('Default date: $defaultDate');
  /// }
  /// ```
  static DateTime? getDefaultDate(WidgetRef ref) {
    final settingsState = ref.read(settingsProvider);
    return settingsState.defaultDate;
  }
  
  /// Get the default date formatted as string (ISO 8601)
  /// 
  /// Returns format: YYYY-MM-DD
  /// 
  /// Usage:
  /// ```dart
  /// final dateString = SettingsHelper.getDefaultDateFormatted(context);
  /// // Send to backend: "2024-10-14"
  /// ```
  static String? getDefaultDateFormatted(WidgetRef ref) {
    final settingsState = ref.read(settingsProvider);
    return settingsState.defaultDateFormatted;
  }
  
  /// Get the default date or fallback to today
  /// 
  /// This is useful when you always need a date
  /// 
  /// Usage:
  /// ```dart
  /// final date = SettingsHelper.getDefaultDateOrToday(context);
  /// // Always returns a valid date
  /// ```
  static DateTime getDefaultDateOrToday(WidgetRef ref) {
    final settingsState = ref.read(settingsProvider);
    return settingsState.defaultDate ?? DateTime.now();
  }
  
  /// Listen to default date changes
  /// 
  /// Usage in widgets that need to rebuild when default date changes:
  /// ```dart
  /// Widget build(WidgetRef ref) {
  ///   final defaultDate = SettingsHelper.watchDefaultDate(context);
  ///   
  ///   return Text('Default date: ${defaultDate ?? "Not set"}');
  /// }
  /// ```
  static DateTime? watchDefaultDate(WidgetRef ref) {
    final settingsState = ref.watch(settingsProvider);
    return settingsState.defaultDate;
  }
}

// Extension removed - use SettingsHelper static methods with WidgetRef instead

