/// JSON Type Converters
/// 
/// Reusable utility functions for handling type conversions in JSON serialization.
/// These converters help handle cases where the backend might return different
/// data types for the same field (e.g., int vs String for IDs).
/// 
/// Usage:
/// ```dart
/// @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)
/// required String id,
/// 
/// @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
/// required int count,
/// ```

class JsonTypeConverters {
  JsonTypeConverters._();

  /// Converts dynamic value to String, handling both int and String inputs
  /// 
  /// This is useful for ID fields that might come as either int or String
  /// from the backend API.
  /// 
  /// Throws [ArgumentError] if the value is neither int nor String.
  static String stringFromDynamic(dynamic value) {
    if (value is int) {
      return value.toString();
    } else if (value is String) {
      return value;
    } else {
      throw ArgumentError(
        'Expected int or String, got ${value.runtimeType}. Value: $value',
      );
    }
  }

  /// Converts dynamic value to int, handling both int and String inputs
  /// 
  /// This is useful for numeric fields that might come as either int or String
  /// from the backend API.
  /// 
  /// Throws [ArgumentError] if the value cannot be converted to int.
  static int intFromDynamic(dynamic value) {
    if (value is int) {
      return value;
    } else if (value is String) {
      final parsed = int.tryParse(value);
      if (parsed != null) {
        return parsed;
      }
      return 0;
    }else if (value is double) {
      return value.toInt();
    } else {
      return 0;
    }
  }

  /// Converts dynamic value to double, handling int, double, and String inputs
  /// 
  /// This is useful for decimal fields that might come as different numeric types
  /// from the backend API.
  /// 
  /// Throws [ArgumentError] if the value cannot be converted to double.
  static double doubleFromDynamic(dynamic value) {
    if (value is double) {
      return value;
    } else if (value is int) {
      return value.toDouble();
    } else if (value is String) {
      final parsed = double.tryParse(value);
      if (parsed != null) {
        return parsed;
      }
     return 0.0;
    } else {
      return 0.0;
    }
  }

  /// Converts dynamic value to bool, handling bool, int, and String inputs
  /// 
  /// This is useful for boolean fields that might come as different types
  /// from the backend API.
  /// 
  /// Throws [ArgumentError] if the value cannot be converted to bool.
  static bool boolFromDynamic(dynamic value) {
    if (value is bool) {
      return value;
    } else if (value is int) {
      return value != 0;
    } else if (value is String) {
      final lowerValue = value.toLowerCase();
      if (lowerValue == 'true' || lowerValue == '1') {
        return true;
      } else if (lowerValue == 'false' || lowerValue == '0') {
        return false;
      }
      throw ArgumentError(
        'Cannot convert String "$value" to bool',
      );
    } else {
      throw ArgumentError(
        'Expected bool, int, or String, got ${value.runtimeType}. Value: $value',
      );
    }
  }

  /// Converts dynamic value to DateTime, handling String and int inputs
  /// 
  /// This is useful for date fields that might come as either ISO string
  /// or Unix timestamp from the backend API.
  /// 
  /// Throws [ArgumentError] if the value cannot be converted to DateTime.
  static DateTime dateTimeFromDynamic(dynamic value) {
    if (value is String) {
      try {
        return DateTime.parse(value);
      } catch (e) {
        throw ArgumentError(
          'Cannot parse String "$value" as DateTime: $e',
        );
      }
    } else if (value is int) {
      // Handle Unix timestamp (seconds)
      return DateTime.fromMillisecondsSinceEpoch(value * 1000);
    } else {
      throw ArgumentError(
        'Expected String or int, got ${value.runtimeType}. Value: $value',
      );
    }
  }

  /// Converts dynamic value to DateTime from milliseconds timestamp
  /// 
  /// This is useful for date fields that come as Unix timestamp in milliseconds
  /// from the backend API.
  /// 
  /// Throws [ArgumentError] if the value cannot be converted to DateTime.
  static DateTime dateTimeFromMilliseconds(dynamic value) {
    if (value is int) {
      return DateTime.fromMillisecondsSinceEpoch(value);
    } else if (value is String) {
      final parsed = int.tryParse(value);
      if (parsed != null) {
        return DateTime.fromMillisecondsSinceEpoch(parsed);
      }
      throw ArgumentError(
        'Cannot convert String "$value" to int for DateTime conversion',
      );
    } else {
      throw ArgumentError(
        'Expected int or String, got ${value.runtimeType}. Value: $value',
      );
    }
  }

  /// Converts dynamic value to nullable String, handling both int and String inputs
  /// 
  /// This is useful for optional ID fields that might come as either int or String
  /// from the backend API, or might be null.
  /// 
  /// Returns null if the value is null.
  /// Throws [ArgumentError] if the value is neither int nor String.
  static String? stringFromDynamicNullable(dynamic value) {
    if (value == null) {
      return null;
    }
    
    if (value is int) {
      return value.toString();
    } else if (value is String) {
      return value;
    } else {
      throw ArgumentError(
        'Expected int or String, got ${value.runtimeType}. Value: $value',
      );
    }
  }

  /// Converts dynamic value to nullable DateTime, handling String and int inputs
  /// 
  /// This is useful for optional date fields that might come as either ISO string
  /// or Unix timestamp from the backend API, or might be null.
  /// 
  /// Returns null if the value is null.
  /// Throws [ArgumentError] if the value cannot be converted to DateTime.
  static DateTime? dateTimeFromDynamicNullable(dynamic value) {
    if (value == null) {
      return null;
    }
    return dateTimeFromDynamic(value);
  }

  /// Converts dynamic value to nullable int, handling both int and String inputs
  /// 
  /// This is useful for optional numeric fields that might come as either int or String
  /// from the backend API, or might be null.
  /// 
  /// Returns null if the value is null.
  /// Throws [ArgumentError] if the value cannot be converted to int.
  static int? intFromDynamicNullable(dynamic value) {
    if (value == null) {
      return null;
    }
    return intFromDynamic(value);
  }

  /// Converts dynamic value to nullable double, handling int, double, and String inputs
  ///
  /// This is useful for optional decimal fields that might come as different numeric types
  /// from the backend API, or might be null.
  ///
  /// Returns null if the value is null.
  /// Throws [ArgumentError] if the value cannot be converted to double.
  static double? doubleFromDynamicNullable(dynamic value) {
    if (value == null) {
      return null;
    }
    return doubleFromDynamic(value);
  }

  /// Converts dynamic value to double, returning 0.0 for null values
  ///
  /// This is useful for decimal fields that might be null from the backend
  /// but should default to 0.0 in the app.
  ///
  /// Returns 0.0 if the value is null.
  /// Throws [ArgumentError] if the value cannot be converted to double.
  static double doubleFromDynamicOrZero(dynamic value) {
    if (value == null) {
      return 0.0;
    }
    return doubleFromDynamic(value);
  }

  /// Converts dynamic value to String? by extracting bank name from bank object
  ///
  /// This is useful for bank fields that come as either a bank object with 'name' property
  /// or as a direct string from the backend API.
  ///
  /// Returns null if the value is null.
  static String? bankNameFromDynamic(dynamic value) {
    if (value == null) return null;
    if (value is Map<String, dynamic>) {
      return value['name'] as String?;
    }
    if (value is String) return value;
    if (value is int) return value.toString();
    return null;
  }
}

