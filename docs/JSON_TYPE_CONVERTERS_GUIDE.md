# JSON Type Converters Guide

## Overview

The `JsonTypeConverters` utility provides reusable type conversion functions for handling inconsistent data types from backend APIs. This prevents type casting errors when the backend returns different data types for the same field.

## Location

```
lib/core/utils/json_type_converters.dart
```

## Problem Solved

**Before**: Direct type casting errors like:
```
type 'int' is not a subtype of type 'String' in type cast
```

**After**: Robust type conversion that handles multiple input types gracefully.

## Available Converters

### 1. `stringFromDynamic(dynamic value)`
Converts dynamic value to String, handling both int and String inputs.

**Use Case**: ID fields that might come as either int or String from backend.

```dart
@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)
required String id,
```

### 2. `intFromDynamic(dynamic value)`
Converts dynamic value to int, handling both int and String inputs.

**Use Case**: Numeric fields that might come as either int or String from backend.

```dart
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
required int count,
```

### 3. `doubleFromDynamic(dynamic value)`
Converts dynamic value to double, handling int, double, and String inputs.

**Use Case**: Decimal fields that might come as different numeric types.

```dart
@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
required double price,
```

### 4. `boolFromDynamic(dynamic value)`
Converts dynamic value to bool, handling bool, int, and String inputs.

**Use Case**: Boolean fields that might come as different types.

```dart
@JsonKey(fromJson: JsonTypeConverters.boolFromDynamic)
required bool isActive,
```

### 5. `dateTimeFromDynamic(dynamic value)`
Converts dynamic value to DateTime, handling String and int inputs.

**Use Case**: Date fields that might come as either ISO string or Unix timestamp.

```dart
@JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic)
required DateTime createdAt,
```

### 6. `dateTimeFromMilliseconds(dynamic value)`
Converts dynamic value to DateTime from milliseconds timestamp.

**Use Case**: Date fields that come as Unix timestamp in milliseconds.

```dart
@JsonKey(fromJson: JsonTypeConverters.dateTimeFromMilliseconds)
required DateTime updatedAt,
```

## Usage Examples

### Basic Model with Type-Safe Converters

```dart
@freezed
sealed class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required String id,
    required String name,
    @JsonKey(name: 'user_id', fromJson: JsonTypeConverters.stringFromDynamic) required String userId,
    @JsonKey(name: 'is_active', fromJson: JsonTypeConverters.boolFromDynamic) required bool isActive,
    @JsonKey(name: 'created_at', fromJson: JsonTypeConverters.dateTimeFromDynamic) required DateTime createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
```

### Advanced Model with Multiple Converters

```dart
@freezed
sealed class ProductModel with _$ProductModel {
  const factory ProductModel({
    @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required String id,
    required String name,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required double price,
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required int stock,
    @JsonKey(name: 'is_available', fromJson: JsonTypeConverters.boolFromDynamic) required bool isAvailable,
    @JsonKey(name: 'category_id', fromJson: JsonTypeConverters.stringFromDynamic) required String categoryId,
    @JsonKey(name: 'created_at', fromJson: JsonTypeConverters.dateTimeFromDynamic) required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: JsonTypeConverters.dateTimeFromMilliseconds) required DateTime updatedAt,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}
```

## Error Handling

All converters provide detailed error messages when conversion fails:

```dart
// Example error messages:
"Expected int or String, got double. Value: 3.14"
"Cannot convert String 'invalid' to int"
"Cannot parse String 'not-a-date' as DateTime: FormatException: Invalid date format"
```

## Best Practices

### 1. Always Use Converters for ID Fields
```dart
// ✅ GOOD - Handles both int and String from backend
@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)
required String id,

// ❌ BAD - Will fail if backend returns int
required String id,
```

### 2. Use Appropriate Converters for Data Types
```dart
// ✅ GOOD - Use specific converter for the expected type
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
required int count,

// ✅ GOOD - Use string converter for IDs
@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)
required String userId,
```

### 3. Handle Date Fields Correctly
```dart
// ✅ GOOD - For ISO string dates
@JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic)
required DateTime createdAt,

// ✅ GOOD - For Unix timestamp in milliseconds
@JsonKey(fromJson: JsonTypeConverters.dateTimeFromMilliseconds)
required DateTime updatedAt,
```

### 4. Import the Converters
```dart
import '../../../../core/utils/json_type_converters.dart';
```

## Migration Guide

### From Custom Converters
**Before:**
```dart
String _idFromJson(dynamic value) {
  if (value is int) {
    return value.toString();
  } else if (value is String) {
    return value;
  } else {
    throw ArgumentError('Expected int or String for id, got ${value.runtimeType}');
  }
}

@JsonKey(fromJson: _idFromJson) required String id,
```

**After:**
```dart
@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required String id,
```

### Benefits of Migration
1. **Consistency**: Same conversion logic across all models
2. **Maintainability**: Single place to update conversion logic
3. **Testing**: Centralized testing of conversion logic
4. **Documentation**: Clear documentation of available converters
5. **Error Handling**: Consistent error messages across the app

## Testing

### Unit Test Example
```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:cyber_pos/core/utils/json_type_converters.dart';

void main() {
  group('JsonTypeConverters', () {
    group('stringFromDynamic', () {
      test('converts int to string', () {
        expect(JsonTypeConverters.stringFromDynamic(123), '123');
      });

      test('returns string as is', () {
        expect(JsonTypeConverters.stringFromDynamic('hello'), 'hello');
      });

      test('throws error for invalid type', () {
        expect(
          () => JsonTypeConverters.stringFromDynamic(3.14),
          throwsA(isA<ArgumentError>()),
        );
      });
    });
  });
}
```

## Integration with Build Runner

After updating models to use `JsonTypeConverters`, always regenerate code:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Troubleshooting

### Common Issues

1. **Import Error**: Make sure to import the converters:
   ```dart
   import '../../../../core/utils/json_type_converters.dart';
   ```

2. **Build Runner Error**: Regenerate code after changes:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

3. **Type Mismatch**: Ensure you're using the correct converter for your expected type.

### Debug Tips

1. **Check Backend Response**: Verify what data types your backend actually returns
2. **Test with Different Types**: Use the converters in isolation to test edge cases
3. **Monitor Logs**: Check error messages for specific type mismatches

## Future Enhancements

- [ ] Add support for List type conversions
- [ ] Add support for Map type conversions
- [ ] Add support for custom enum conversions
- [ ] Add support for nullable type conversions
- [ ] Add performance optimizations for large datasets

---

**Remember**: Always use these converters for fields that might come as different types from the backend. This prevents runtime type casting errors and provides better error messages for debugging.

