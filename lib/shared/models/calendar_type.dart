/// Calendar type enumeration
/// 
/// Defines the supported calendar systems in the application
enum CalendarType {
  /// Gregorian calendar (international standard)
  gregorian,
  
  /// Ethiopian calendar
  ethiopian;
  
  /// Get display name for the calendar type
  String get displayName {
    switch (this) {
      case CalendarType.gregorian:
        return 'Gregorian';
      case CalendarType.ethiopian:
        return 'Ethiopian';
    }
  }
  
  /// Parse calendar type from string
  /// 
  /// Returns [CalendarType.gregorian] as default if string doesn't match
  static CalendarType fromString(String value) {
    switch (value.toLowerCase()) {
      case 'ethiopian':
      case 'ec':
        return CalendarType.ethiopian;
      case 'gregorian':
      case 'gc':
      default:
        return CalendarType.gregorian;
    }
  }

  /// Convert to API format string ("EC" or "GC")
  String toApiString() {
    switch (this) {
      case CalendarType.ethiopian:
        return 'EC';
      case CalendarType.gregorian:
        return 'GC';
    }
  }
}

