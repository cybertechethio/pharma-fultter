import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/calendar_type.dart';

/// State for app settings
class SettingsState {
  final DateTime? defaultDate;
  final CalendarType defaultDateCalendarType;
  final CalendarType? displayCalendarType; // null means auto-detect based on language
  
  const SettingsState({
    this.defaultDate,
    this.defaultDateCalendarType = CalendarType.gregorian,
    this.displayCalendarType,
  });
  
  /// Get formatted default date string
  String? get defaultDateFormatted {
    if (defaultDate == null) return null;
    return '${defaultDate!.year}-${defaultDate!.month.toString().padLeft(2, '0')}-${defaultDate!.day.toString().padLeft(2, '0')}';
  }
  
  /// Get calendar type as string for API calls
  String get calendarTypeString => defaultDateCalendarType.name;
  
  /// Check if display calendar type is set to auto-detect
  bool get isDisplayCalendarAuto => displayCalendarType == null;
  
  /// Get effective display calendar type based on current language
  /// 
  /// If user hasn't set a preference (auto mode), returns calendar based on language
  /// Otherwise returns the user's explicit choice
  CalendarType getEffectiveDisplayCalendarType(String languageCode) {
    if (displayCalendarType != null) {
      // User has explicitly chosen a calendar type
      return displayCalendarType!;
    }
    
    // Auto-detect based on language
    return languageCode == 'am' 
        ? CalendarType.ethiopian 
        : CalendarType.gregorian;
  }
  
  SettingsState copyWith({
    DateTime? defaultDate,
    CalendarType? defaultDateCalendarType,
    CalendarType? displayCalendarType,
  }) {
    return SettingsState(
      defaultDate: defaultDate ?? this.defaultDate,
      defaultDateCalendarType: defaultDateCalendarType ?? this.defaultDateCalendarType,
      displayCalendarType: displayCalendarType ?? this.displayCalendarType,
    );
  }
}

/// Notifier for managing app settings
class SettingsNotifier extends Notifier<SettingsState> {
  static const String _defaultDateKey = 'default_date';
  static const String _defaultDateCalendarTypeKey = 'default_date_calendar_type';
  static const String _displayCalendarTypeKey = 'display_calendar_type';
  
  @override
  SettingsState build() {
    _loadSettings();
    return const SettingsState();
  }
  
  /// Load settings from shared preferences
  Future<void> _loadSettings() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      
      DateTime? defaultDate;
      CalendarType defaultDateCalendarType = CalendarType.gregorian;
      CalendarType? displayCalendarType;
      
      // Load default date
      final dateString = prefs.getString(_defaultDateKey);
      if (dateString != null) {
        defaultDate = DateTime.tryParse(dateString);
      }
      
      // Load calendar type for default date
      final calendarTypeString = prefs.getString(_defaultDateCalendarTypeKey);
      if (calendarTypeString != null) {
        defaultDateCalendarType = CalendarType.fromString(calendarTypeString);
      }
      
      // Load display calendar type (null = auto-detect)
      final displayCalendarString = prefs.getString(_displayCalendarTypeKey);
      if (displayCalendarString != null) {
        if (displayCalendarString == 'auto') {
          displayCalendarType = null; // Auto-detect
        } else {
          displayCalendarType = CalendarType.fromString(displayCalendarString);
        }
      }
      
      state = SettingsState(
        defaultDate: defaultDate,
        defaultDateCalendarType: defaultDateCalendarType,
        displayCalendarType: displayCalendarType,
      );
    } catch (e) {
      debugPrint('Error loading settings: $e');
    }
  }
  
  /// Set calendar type for default date
  Future<void> setDefaultDateCalendarType(CalendarType calendarType) async {
    if (state.defaultDateCalendarType == calendarType) return;
    
    state = state.copyWith(defaultDateCalendarType: calendarType);
    
    // Save to shared preferences
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_defaultDateCalendarTypeKey, calendarType.name);
    } catch (e) {
      debugPrint('Error saving calendar type: $e');
    }
  }
  
  /// Set default date and persist to storage
  /// The calendar type should be set before calling this method
  Future<void> setDefaultDate(DateTime? date) async {
    if (state.defaultDate == date) return;
    
    state = state.copyWith(defaultDate: date);
    
    // Save to shared preferences
    try {
      final prefs = await SharedPreferences.getInstance();
      
      if (date == null) {
        await prefs.remove(_defaultDateKey);
        await prefs.remove(_defaultDateCalendarTypeKey);
      } else {
        // Store as ISO 8601 string
        await prefs.setString(_defaultDateKey, date.toIso8601String());
        // Also save the calendar type
        await prefs.setString(_defaultDateCalendarTypeKey, state.defaultDateCalendarType.name);
      }
    } catch (e) {
      debugPrint('Error saving default date: $e');
    }
  }
  
  /// Clear default date
  Future<void> clearDefaultDate() async {
    await setDefaultDate(null);
  }
  
  /// Set display calendar type (null = auto-detect based on language)
  Future<void> setDisplayCalendarType(CalendarType? calendarType) async {
    if (state.displayCalendarType == calendarType) return;
    
    state = state.copyWith(displayCalendarType: calendarType);
    
    // Save to shared preferences
    try {
      final prefs = await SharedPreferences.getInstance();
      
      if (calendarType == null) {
        await prefs.setString(_displayCalendarTypeKey, 'auto');
      } else {
        await prefs.setString(_displayCalendarTypeKey, calendarType.name);
      }
    } catch (e) {
      debugPrint('Error saving display calendar type: $e');
    }
  }
  
  /// Reset all settings to defaults
  Future<void> resetToDefaults() async {
    state = const SettingsState();
    
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_defaultDateKey);
      await prefs.remove(_defaultDateCalendarTypeKey);
      await prefs.remove(_displayCalendarTypeKey);
    } catch (e) {
      debugPrint('Error resetting settings: $e');
    }
  }
}

/// Provider for app settings state
final settingsProvider = NotifierProvider<SettingsNotifier, SettingsState>(
  SettingsNotifier.new,
);

