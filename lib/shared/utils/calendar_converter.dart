import 'package:abushakir/abushakir.dart';
import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

/// Utility class for calendar conversion and localization
class CalendarConverter {
  /// Convert Gregorian DateTime to Ethiopian calendar
  /// Uses Unix epoch time for accurate conversion
  /// Normalizes to UTC to avoid timezone offset issues
  static EtDatetime toEthiopian(DateTime gregorianDate) {
    // Convert to UTC date at midnight to avoid timezone issues
    final utcDate = DateTime.utc(
      gregorianDate.year,
      gregorianDate.month,
      gregorianDate.day,
    );
    return EtDatetime.fromMillisecondsSinceEpoch(
      utcDate.millisecondsSinceEpoch,
    );
  }

  /// Convert Ethiopian calendar to Gregorian DateTime
  /// Uses Unix epoch time for accurate conversion
  /// Returns local DateTime
  static DateTime toGregorian(EtDatetime ethiopianDate) {
    final utcDate = DateTime.fromMillisecondsSinceEpoch(
      ethiopianDate.moment,
      isUtc: true,
    );
    // Return as local date (just the date components, not time)
    return DateTime(
      utcDate.year,
      utcDate.month,
      utcDate.day,
    );
  }

  /// Get localized Ethiopian month name
  static String getEthiopianMonthName(int month, AppLocalizations l10n) {
    switch (month) {
      case 1:
        return l10n.ethiopianMonthMeskerem;
      case 2:
        return l10n.ethiopianMonthTikimt;
      case 3:
        return l10n.ethiopianMonthHidar;
      case 4:
        return l10n.ethiopianMonthTahsas;
      case 5:
        return l10n.ethiopianMonthTir;
      case 6:
        return l10n.ethiopianMonthYekatit;
      case 7:
        return l10n.ethiopianMonthMegabit;
      case 8:
        return l10n.ethiopianMonthMiazia;
      case 9:
        return l10n.ethiopianMonthGenbot;
      case 10:
        return l10n.ethiopianMonthSene;
      case 11:
        return l10n.ethiopianMonthHamle;
      case 12:
        return l10n.ethiopianMonthNehasse;
      case 13:
        return l10n.ethiopianMonthPagumen;
      default:
        return '';
    }
  }

  /// Get all Ethiopian month names (localized)
  static List<String> getAllEthiopianMonthNames(AppLocalizations l10n) {
    return [
      l10n.ethiopianMonthMeskerem,
      l10n.ethiopianMonthTikimt,
      l10n.ethiopianMonthHidar,
      l10n.ethiopianMonthTahsas,
      l10n.ethiopianMonthTir,
      l10n.ethiopianMonthYekatit,
      l10n.ethiopianMonthMegabit,
      l10n.ethiopianMonthMiazia,
      l10n.ethiopianMonthGenbot,
      l10n.ethiopianMonthSene,
      l10n.ethiopianMonthHamle,
      l10n.ethiopianMonthNehasse,
      l10n.ethiopianMonthPagumen,
    ];
  }

  /// Format Ethiopian date as string
  static String formatEthiopianDate(EtDatetime date, AppLocalizations l10n) {
    final monthName = getEthiopianMonthName(date.month, l10n);
    return '$monthName ${date.day}, ${date.year}';
  }

  /// Format Gregorian date as string (localized)
  static String formatGregorianDate(DateTime date, BuildContext context) {
    final months = _getGregorianMonthNames(context);
    
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  /// Get Gregorian month names (localized based on current locale)
  static List<String> _getGregorianMonthNames(BuildContext context) {
    final locale = Localizations.localeOf(context);
    
    if (locale.languageCode == 'am') {
      // Amharic transliteration of Gregorian months
      return [
        'ጃንዋሪ', // January
        'ፌብሯሪ', // February
        'ማርች', // March
        'ኤፕሪል', // April
        'ሜይ', // May
        'ጁን', // June
        'ጁላይ', // July
        'ኦገስት', // August
        'ሴፕቴምበር', // September
        'ኦክቶበር', // October
        'ኖቬምበር', // November
        'ዲሴምበር', // December
      ];
    } else {
      // English month names
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
        'December',
      ];
    }
  }

  /// Get number of days in Ethiopian month
  static int getDaysInEthiopianMonth(int year, int month) {
    if (month == 13) {
      // Pagumen has 5 or 6 days depending on leap year
      // Ethiopian leap year calculation: year % 4 == 3
      return (year % 4 == 3) ? 6 : 5;
    }
    // All other months have 30 days
    return 30;
  }

  /// Get today's date in Ethiopian calendar
  static EtDatetime getEthiopianToday() {
    return EtDatetime.now();
  }

  /// Get today's date in Gregorian calendar
  static DateTime getGregorianToday() {
    return DateTime.now();
  }

  /// Compare two Ethiopian dates
  static bool isSameEthiopianDate(EtDatetime date1, EtDatetime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  /// Compare two Gregorian dates
  static bool isSameGregorianDate(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  /// Create Ethiopian date from components
  static EtDatetime createEthiopianDate(int year, int month, int day) {
    return EtDatetime(year: year, month: month, day: day);
  }

  /// Check if Ethiopian date is valid
  static bool isValidEthiopianDate(int year, int month, int day) {
    if (month < 1 || month > 13) return false;
    if (day < 1) return false;
    
    final maxDays = getDaysInEthiopianMonth(year, month);
    return day <= maxDays;
  }

  /// Get Ethiopian year from Gregorian year (approximate)
  /// Note: This is approximate because the Ethiopian New Year starts in September
  static int getEthiopianYear(int gregorianYear) {
    // For dates before Sept 11, the Ethiopian year is gregorianYear - 8
    // For dates after Sept 11, the Ethiopian year is gregorianYear - 7
    // This returns the most common case
    return gregorianYear - 7;
  }

  // ============================================================================
  // BACKEND INTEGRATION HELPERS
  // ============================================================================

  /// Convert DateTime to ISO 8601 string for backend storage
  /// 
  /// **IMPORTANT: Always store dates in Gregorian calendar**
  /// 
  /// Example:
  /// ```dart
  /// DateTime date = DateTime(2025, 1, 15);
  /// String iso = CalendarConverter.toBackendFormat(date);
  /// // Returns: "2025-01-15T00:00:00.000Z"
  /// ```
  static String toBackendFormat(DateTime date) {
    // Always send UTC to backend to avoid timezone issues
    final utcDate = DateTime.utc(date.year, date.month, date.day);
    return utcDate.toIso8601String();
  }

  /// Parse date from backend (ISO 8601 string) to DateTime
  /// 
  /// **Backend always sends Gregorian dates**
  /// 
  /// Example:
  /// ```dart
  /// String fromBackend = "2025-01-15T00:00:00.000Z";
  /// DateTime date = CalendarConverter.fromBackendFormat(fromBackend);
  /// // Returns: DateTime(2025, 1, 15)
  /// ```
  static DateTime fromBackendFormat(String isoString) {
    final parsed = DateTime.parse(isoString);
    // Return as local date (just date components)
    return DateTime(parsed.year, parsed.month, parsed.day);
  }

  /// Convert DateTime to JSON-safe format
  /// Used when serializing to JSON for API calls
  /// 
  /// Example:
  /// ```dart
  /// Map<String, dynamic> toJson() => {
  ///   'birth_date': CalendarConverter.toJsonFormat(birthDate),
  /// };
  /// ```
  static String toJsonFormat(DateTime date) {
    return toBackendFormat(date);
  }

  /// Parse date from JSON
  /// Used when deserializing from JSON responses
  /// 
  /// Example:
  /// ```dart
  /// factory User.fromJson(Map<String, dynamic> json) => User(
  ///   birthDate: CalendarConverter.fromJsonFormat(json['birth_date']),
  /// );
  /// ```
  static DateTime fromJsonFormat(String isoString) {
    return fromBackendFormat(isoString);
  }

  /// Format date for display based on current locale
  /// Automatically shows EC for Amharic, GC for English
  /// 
  /// **This is the recommended method for UI display**
  /// 
  /// Example:
  /// ```dart
  /// DateTime storedDate = DateTime(2025, 1, 15);  // Always GC
  /// String display = CalendarConverter.formatForDisplay(storedDate, context, l10n);
  /// 
  /// // If language is English: "January 15, 2025"
  /// // If language is Amharic: "ጥር 6, 2017"
  /// ```
  static String formatForDisplay(
    DateTime gregorianDate,
    BuildContext context,
    AppLocalizations l10n,
  ) {
    final locale = Localizations.localeOf(context);
    
    if (locale.languageCode == 'am') {
      // Convert to Ethiopian for Amharic users
      final etDate = toEthiopian(gregorianDate);
      return formatEthiopianDate(etDate, l10n);
    } else {
      // Show Gregorian for English users
      return formatGregorianDate(gregorianDate, context);
    }
  }

  // ============================================================================
  // DATE RANGE HELPERS
  // ============================================================================

  /// Format date range for display
  /// Shows range in appropriate calendar based on locale
  /// 
  /// Example:
  /// ```dart
  /// String range = CalendarConverter.formatRangeForDisplay(
  ///   start,
  ///   end,
  ///   context,
  ///   l10n,
  /// );
  /// // English: "January 15, 2025 - January 20, 2025"
  /// // Amharic: "ጥር 6, 2017 - ጥር 11, 2017"
  /// ```
  static String formatRangeForDisplay(
    DateTime startGC,
    DateTime endGC,
    BuildContext context,
    AppLocalizations l10n,
  ) {
    final startDisplay = formatForDisplay(startGC, context, l10n);
    final endDisplay = formatForDisplay(endGC, context, l10n);
    return '$startDisplay - $endDisplay';
  }

  /// Calculate duration in days between two dates
  /// 
  /// Example:
  /// ```dart
  /// int days = CalendarConverter.getDurationInDays(start, end);
  /// // Returns: 5
  /// ```
  static int getDurationInDays(DateTime start, DateTime end) {
    return end.difference(start).inDays;
  }

  /// Format date range for backend (ISO 8601)
  /// Returns a map with start_date and end_date
  /// 
  /// Example:
  /// ```dart
  /// Map<String, String> range = CalendarConverter.rangeToBackendFormat(
  ///   start,
  ///   end,
  /// );
  /// // Returns: {
  /// //   'start_date': '2025-01-15T00:00:00.000Z',
  /// //   'end_date': '2025-01-20T00:00:00.000Z'
  /// // }
  /// ```
  static Map<String, String> rangeToBackendFormat(
    DateTime startDate,
    DateTime endDate,
  ) {
    return {
      'startDate': toBackendFormat(startDate),
      'endDate': toBackendFormat(endDate),
    };
  }

  /// Parse date range from backend
  /// 
  /// Example:
  /// ```dart
  /// Map<String, DateTime> range = CalendarConverter.rangeFromBackendFormat({
  ///   'start_date': '2025-01-15T00:00:00.000Z',
  ///   'end_date': '2025-01-20T00:00:00.000Z',
  /// });
  /// // Returns: {'start': DateTime(...), 'end': DateTime(...)}
  /// ```
  static Map<String, DateTime> rangeFromBackendFormat(
    Map<String, dynamic> json,
  ) {
    return {
      'start': fromBackendFormat(json['start_date']),
      'end': fromBackendFormat(json['end_date']),
    };
  }
}

