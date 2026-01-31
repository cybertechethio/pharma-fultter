# JSON Type Converters - Usage Examples

## Quick Reference

### Import Statement
```dart
import '../../../../core/utils/json_type_converters.dart';
```

### Common Patterns

#### 1. User Model Example
```dart
@freezed
sealed class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required String id,
    required String name,
    required String email,
    @JsonKey(name: 'user_id', fromJson: JsonTypeConverters.stringFromDynamic) required String userId,
    @JsonKey(name: 'is_verified', fromJson: JsonTypeConverters.boolFromDynamic) required bool isVerified,
    @JsonKey(name: 'created_at', fromJson: JsonTypeConverters.dateTimeFromDynamic) required DateTime createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
```

#### 2. Product Model Example
```dart
@freezed
sealed class ProductModel with _$ProductModel {
  const factory ProductModel({
    @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required String id,
    required String name,
    required String description,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required double price,
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required int stock,
    @JsonKey(name: 'category_id', fromJson: JsonTypeConverters.stringFromDynamic) required String categoryId,
    @JsonKey(name: 'is_available', fromJson: JsonTypeConverters.boolFromDynamic) required bool isAvailable,
    @JsonKey(name: 'created_at', fromJson: JsonTypeConverters.dateTimeFromDynamic) required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: JsonTypeConverters.dateTimeFromMilliseconds) required DateTime updatedAt,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}
```

#### 3. Order Model Example
```dart
@freezed
sealed class OrderModel with _$OrderModel {
  const factory OrderModel({
    @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required String id,
    @JsonKey(name: 'user_id', fromJson: JsonTypeConverters.stringFromDynamic) required String userId,
    @JsonKey(name: 'product_id', fromJson: JsonTypeConverters.stringFromDynamic) required String productId,
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required int quantity,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required double totalPrice,
    @JsonKey(name: 'is_paid', fromJson: JsonTypeConverters.boolFromDynamic) required bool isPaid,
    @JsonKey(name: 'order_date', fromJson: JsonTypeConverters.dateTimeFromDynamic) required DateTime orderDate,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);
}
```

## Field-Specific Examples

### ID Fields (Always use stringFromDynamic)
```dart
// Primary key
@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required String id,

// Foreign keys
@JsonKey(name: 'user_id', fromJson: JsonTypeConverters.stringFromDynamic) required String userId,
@JsonKey(name: 'company_id', fromJson: JsonTypeConverters.stringFromDynamic) required String companyId,
```

### Numeric Fields
```dart
// Integer fields
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required int count,
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required int age,

// Double fields
@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required double price,
@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required double rating,
```

### Boolean Fields
```dart
@JsonKey(name: 'is_active', fromJson: JsonTypeConverters.boolFromDynamic) required bool isActive,
@JsonKey(name: 'is_verified', fromJson: JsonTypeConverters.boolFromDynamic) required bool isVerified,
@JsonKey(name: 'is_published', fromJson: JsonTypeConverters.boolFromDynamic) required bool isPublished,
```

### Date Fields
```dart
// ISO string dates
@JsonKey(name: 'created_at', fromJson: JsonTypeConverters.dateTimeFromDynamic) required DateTime createdAt,
@JsonKey(name: 'updated_at', fromJson: JsonTypeConverters.dateTimeFromDynamic) required DateTime updatedAt,

// Unix timestamp in milliseconds
@JsonKey(name: 'last_login', fromJson: JsonTypeConverters.dateTimeFromMilliseconds) required DateTime lastLogin,
```

## Migration Examples

### Before and After

#### Before (Custom Converter)
```dart
// Custom converter function
String _idFromJson(dynamic value) {
  if (value is int) {
    return value.toString();
  } else if (value is String) {
    return value;
  } else {
    throw ArgumentError('Expected int or String for id, got ${value.runtimeType}');
  }
}

// Usage
@JsonKey(fromJson: _idFromJson) required String id,
```

#### After (Reusable Converter)
```dart
// Import the utility
import '../../../../core/utils/json_type_converters.dart';

// Usage
@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required String id,
```

## Error Handling Examples

### What the Converters Handle
```dart
// These will all work with stringFromDynamic:
JsonTypeConverters.stringFromDynamic(123);        // Returns "123"
JsonTypeConverters.stringFromDynamic("456");      // Returns "456"
JsonTypeConverters.stringFromDynamic("hello");    // Returns "hello"

// This will throw an error:
JsonTypeConverters.stringFromDynamic(3.14);       // Throws ArgumentError
```

### Error Messages
```dart
// Clear error messages for debugging:
"Expected int or String, got double. Value: 3.14"
"Cannot convert String 'invalid' to int"
"Cannot parse String 'not-a-date' as DateTime: FormatException: Invalid date format"
```

## Testing Examples

### Unit Test for Converters
```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:cyber_pos/core/utils/json_type_converters.dart';

void main() {
  group('JsonTypeConverters.stringFromDynamic', () {
    test('converts int to string', () {
      expect(JsonTypeConverters.stringFromDynamic(123), '123');
    });

    test('returns string as is', () {
      expect(JsonTypeConverters.stringFromDynamic('hello'), 'hello');
    });

    test('throws error for double', () {
      expect(
        () => JsonTypeConverters.stringFromDynamic(3.14),
        throwsA(isA<ArgumentError>()),
      );
    });
  });

  group('JsonTypeConverters.intFromDynamic', () {
    test('returns int as is', () {
      expect(JsonTypeConverters.intFromDynamic(123), 123);
    });

    test('converts string to int', () {
      expect(JsonTypeConverters.intFromDynamic('456'), 456);
    });

    test('throws error for invalid string', () {
      expect(
        () => JsonTypeConverters.intFromDynamic('invalid'),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
}
```

## Best Practices

### 1. Always Use Converters for ID Fields
```dart
// ✅ GOOD
@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required String id,

// ❌ BAD - Will fail if backend returns int
required String id,
```

### 2. Use Appropriate Converters
```dart
// ✅ GOOD - Use int converter for numeric fields
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required int count,

// ✅ GOOD - Use string converter for ID fields
@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required String userId,
```

### 3. Handle Date Fields Correctly
```dart
// ✅ GOOD - For ISO string dates
@JsonKey(name: 'created_at', fromJson: JsonTypeConverters.dateTimeFromDynamic) required DateTime createdAt,

// ✅ GOOD - For Unix timestamp in milliseconds
@JsonKey(name: 'last_login', fromJson: JsonTypeConverters.dateTimeFromMilliseconds) required DateTime lastLogin,
```

### 4. Import Statement
```dart
// Always import at the top of your model file
import '../../../../core/utils/json_type_converters.dart';
```

## Common Mistakes to Avoid

### 1. Don't Use Direct Casting
```dart
// ❌ BAD - Will fail if backend returns int
@JsonKey(name: 'user_id') required String userId,

// ✅ GOOD - Handles both int and String
@JsonKey(name: 'user_id', fromJson: JsonTypeConverters.stringFromDynamic) required String userId,
```

### 2. Don't Forget to Import
```dart
// ❌ BAD - Missing import
@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required String id,

// ✅ GOOD - With proper import
import '../../../../core/utils/json_type_converters.dart';
@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required String id,
```

### 3. Don't Use Wrong Converter
```dart
// ❌ BAD - Using string converter for int field
@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required int count,

// ✅ GOOD - Using int converter for int field
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required int count,
```

## Summary

- **Always use `JsonTypeConverters.stringFromDynamic` for ID fields**
- **Use appropriate converters for each data type**
- **Import the utility in your model files**
- **Test your converters with different input types**
- **Regenerate code after making changes**

This approach ensures type safety and prevents runtime errors when the backend returns inconsistent data types.

