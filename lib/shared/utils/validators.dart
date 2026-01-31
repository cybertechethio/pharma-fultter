import 'package:flutter/material.dart';
import '../../app/theme/brand_colors.dart';

/// Password strength levels
enum PasswordStrength {
  weak,
  fair,
  good,
  strong,
}

/// Comprehensive validation utilities for form inputs
/// 
/// This class provides reusable validation methods for common input types
/// including email, phone, password, names, and other form fields.
class Validators {
  // Private constructor to prevent instantiation
  Validators._();

  // ==================== REGEX PATTERNS ====================
  
  /// Email validation regex pattern
  static const String _emailPattern = 
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  
  /// Ethiopian phone number pattern (international format: +251 followed by 9 digits)
  static const String _ethiopianPhonePattern = r'^\+251[0-9]{9}$';
  
  /// Local Ethiopian phone number pattern (10 digits starting with 0)
  static const String _localEthiopianPhonePattern = r'^0[0-9]{9}$';
  
  /// Password pattern (at least 8 characters, 1 uppercase, 1 lowercase, 1 number)
  static const String _passwordPattern = 
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d@$!%*?&]{8,}$';
  
  /// Name pattern (letters, spaces, hyphens, apostrophes)
  static const String _namePattern = r"^[a-zA-Z\s\-']+$";
  
  /// Username pattern (alphanumeric, underscore, hyphen)
  static const String _usernamePattern = r'^[a-zA-Z0-9_-]{3,20}$';
  
  /// URL pattern
  static const String _urlPattern = 
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$';

  // ==================== VALIDATION METHODS ====================

  /// Validate email address
  /// 
  /// Returns null if valid, error message if invalid
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
  
    if (value.length > 254) {
      return 'Email address is too long';
    }
    
    return null;
  }

  /// Validate phone number (accepts local format: 0930312864 or international: +251930312864)
  /// 
  /// Returns null if valid, error message if invalid
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    
    final cleanValue = value.trim().replaceAll(RegExp(r'[\s\-\(\)]'), '');
    
    // Check for local format (10 digits starting with 0)
    final localRegex = RegExp(_localEthiopianPhonePattern);
    if (localRegex.hasMatch(cleanValue)) {
      return null;
    }
    
    // Check for international format (+251 followed by 9 digits)
    final internationalRegex = RegExp(_ethiopianPhonePattern);
    if (internationalRegex.hasMatch(cleanValue)) {
      return null;
    }
    
    // If neither format matches, return error
    return 'Please enter a valid phone number (e.g., 09xxxxxxxx or +2519xxxxxxxx)';
  }

  /// Validate Ethiopian phone number specifically
  /// 
  /// Returns null if valid, error message if invalid
  static String? validateEthiopianPhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    
    final cleanValue = value.trim().replaceAll(RegExp(r'[\s\-\(\)]'), '');
    
    if (!cleanValue.startsWith('+251')) {
      return 'Ethiopian phone number must start with +251';
    }
    
    final phoneRegex = RegExp(_ethiopianPhonePattern);
    if (!phoneRegex.hasMatch(cleanValue)) {
      return 'Please enter a valid Ethiopian phone number (e.g., +251912345678)';
    }
    
    return null;
  }

  /// Validate password with strength requirements
  /// 
  /// Returns null if valid, error message if invalid
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    
    if (value.length > 128) {
      return 'Password is too long';
    }
    
    final passwordRegex = RegExp(_passwordPattern);
    if (!passwordRegex.hasMatch(value)) {
      return 'Password must contain at least one uppercase letter, one lowercase letter, and one number';
    }
    
    return null;
  }

  /// Validate password confirmation
  /// 
  /// Returns null if valid, error message if invalid
  static String? validatePasswordConfirmation(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    
    if (value != password) {
      return 'Passwords do not match';
    }
    
    return null;
  }

  /// Validate full name (for single name field)
  /// 
  /// Returns null if valid, error message if invalid
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    
    final trimmedValue = value.trim();
    if (trimmedValue.length < 2) {
      return 'Name must be at least 2 characters long';
    }
    
    if (trimmedValue.length > 100) {
      return 'Name is too long';
    }
    
    final nameRegex = RegExp(_namePattern);
    if (!nameRegex.hasMatch(trimmedValue)) {
      return 'Name can only contain letters, spaces, hyphens, and apostrophes';
    }
    
    return null;
  }

  /// Simple email validation (returns boolean)
  /// 
  /// Returns true if email is valid, false otherwise
  static bool isValidEmail(String? value) {
    if (value == null || value.isEmpty) return false;
    final emailRegex = RegExp(_emailPattern);
    return emailRegex.hasMatch(value.trim());
  }

  /// Simple password validation (returns boolean)
  /// 
  /// Returns true if password meets minimum requirements, false otherwise
  static bool isValidPassword(String? value) {
    if (value == null || value.isEmpty) return false;
    return value.length >= 6; // Minimum 6 characters for simple validation
  }

  /// Simple phone validation (returns boolean)
  /// 
  /// Returns true if phone number is valid, false otherwise
  static bool isValidPhone(String? value) {
  if (value == null || value.isEmpty) return false;

  // Remove all non-digit characters
  final cleanValue = value.replaceAll(RegExp(r'\D'), '');

  // Must be exactly 10 digits and start with 09 or 07
  final phoneRegex = RegExp(r'^(09|07)\d{8}$');

  return phoneRegex.hasMatch(cleanValue);
}


  /// Confirm password validation (returns boolean)
  /// 
  /// Returns true if passwords match, false otherwise
  static String? confirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    
    if (value != password) {
      return 'Passwords do not match';
    }
    
    return null;
  }

  /// Validate first name
  /// 
  /// Returns null if valid, error message if invalid
  static String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return 'First name is required';
    }
    
    final trimmedValue = value.trim();
    if (trimmedValue.length < 2) {
      return 'First name must be at least 2 characters long';
    }
    
    if (trimmedValue.length > 50) {
      return 'First name is too long';
    }
    
    final nameRegex = RegExp(_namePattern);
    if (!nameRegex.hasMatch(trimmedValue)) {
      return 'First name can only contain letters, spaces, hyphens, and apostrophes';
    }
    
    return null;
  }

  /// Validate last name
  /// 
  /// Returns null if valid, error message if invalid
  static String? validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Last name is required';
    }
    
    final trimmedValue = value.trim();
    if (trimmedValue.length < 2) {
      return 'Last name must be at least 2 characters long';
    }
    
    if (trimmedValue.length > 50) {
      return 'Last name is too long';
    }
    
    final nameRegex = RegExp(_namePattern);
    if (!nameRegex.hasMatch(trimmedValue)) {
      return 'Last name can only contain letters, spaces, hyphens, and apostrophes';
    }
    
    return null;
  }

  /// Validate company name
  /// 
  /// Returns null if valid, error message if invalid
  static String? validateCompanyName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Company name is required';
    }
    
    final trimmedValue = value.trim();
    if (trimmedValue.length < 3) {
      return 'Company name must be at least 3 characters long';
    }
    
    if (trimmedValue.length > 50) {
      return 'Company name must be at most 50 characters long';
    }
    
    // Allow letters, numbers, spaces, hyphens, apostrophes, and common business characters
    final companyNameRegex = RegExp(r"^[a-zA-Z0-9\s\-'&.,()]+$");
    if (!companyNameRegex.hasMatch(trimmedValue)) {
      return 'Company name can only contain letters, numbers, spaces, and common business characters';
    }
    
    return null;
  }

  /// Validate username
  /// 
  /// Returns null if valid, error message if invalid
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    
    final trimmedValue = value.trim();
    if (trimmedValue.length < 3) {
      return 'Username must be at least 3 characters long';
    }
    
    if (trimmedValue.length > 20) {
      return 'Username is too long';
    }
    
    final usernameRegex = RegExp(_usernamePattern);
    if (!usernameRegex.hasMatch(trimmedValue)) {
      return 'Username can only contain letters, numbers, underscores, and hyphens';
    }
    
    return null;
  }

  /// Validate required field
  /// 
  /// Returns null if valid, error message if invalid
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  /// Validate minimum length
  /// 
  /// Returns null if valid, error message if invalid
  static String? validateMinLength(String? value, int minLength, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    
    if (value.length < minLength) {
      return '$fieldName must be at least $minLength characters long';
    }
    
    return null;
  }

  /// Validate maximum length
  /// 
  /// Returns null if valid, error message if invalid
  static String? validateMaxLength(String? value, int maxLength, String fieldName) {
    if (value != null && value.length > maxLength) {
      return '$fieldName must be no more than $maxLength characters long';
    }
    return null;
  }

  /// Validate numeric input
  /// 
  /// Returns null if valid, error message if invalid
  static String? validateNumeric(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    
    if (double.tryParse(value) == null) {
      return '$fieldName must be a valid number';
    }
    
    return null;
  }

  /// Validate integer input
  /// 
  /// Returns null if valid, error message if invalid
  static String? validateInteger(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    
    if (int.tryParse(value) == null) {
      return '$fieldName must be a valid integer';
    }
    
    return null;
  }

  /// Validate URL
  /// 
  /// Returns null if valid, error message if invalid
  static String? validateUrl(String? value) {
    if (value == null || value.isEmpty) {
      return 'URL is required';
    }
    
    final urlRegex = RegExp(_urlPattern);
    if (!urlRegex.hasMatch(value.trim())) {
      return 'Please enter a valid URL';
    }
    
    return null;
  }

  /// Validate age (must be between min and max)
  /// 
  /// Returns null if valid, error message if invalid
  static String? validateAge(String? value, {int minAge = 13, int maxAge = 120}) {
    if (value == null || value.isEmpty) {
      return 'Age is required';
    }
    
    final age = int.tryParse(value);
    if (age == null) {
      return 'Please enter a valid age';
    }
    
    if (age < minAge) {
      return 'You must be at least $minAge years old';
    }
    
    if (age > maxAge) {
      return 'Please enter a valid age';
    }
    
    return null;
  }

  // ==================== PASSWORD STRENGTH ANALYSIS ====================

  /// Analyze password strength
  /// 
  /// Returns the strength level of the password
  static PasswordStrength analyzePasswordStrength(String password) {
    int score = 0;
    
    // Length check
    if (password.length >= 8) score += 1;
    if (password.length >= 12) score += 1;
    
    // Character variety checks
    if (RegExp(r'[a-z]').hasMatch(password)) score += 1;
    if (RegExp(r'[A-Z]').hasMatch(password)) score += 1;
    if (RegExp(r'[0-9]').hasMatch(password)) score += 1;
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) score += 1;
    
    // Determine strength level
    if (score < 3) return PasswordStrength.weak;
    if (score < 4) return PasswordStrength.fair;
    if (score < 6) return PasswordStrength.good;
    return PasswordStrength.strong;
  }

  /// Get password strength message
  /// 
  /// Returns a user-friendly message about password strength
  static String getPasswordStrengthMessage(PasswordStrength strength) {
    switch (strength) {
      case PasswordStrength.weak:
        return 'Weak password';
      case PasswordStrength.fair:
        return 'Fair password';
      case PasswordStrength.good:
        return 'Good password';
      case PasswordStrength.strong:
        return 'Strong password';
    }
  }

  /// Get password strength color
  /// 
  /// Returns a color representing the password strength
  static Color getPasswordStrengthColor(PasswordStrength strength) {
    switch (strength) {
      case PasswordStrength.weak:
        return BrandColors.error;
      case PasswordStrength.fair:
        return BrandColors.warning;
      case PasswordStrength.good:
        return BrandColors.info;
      case PasswordStrength.strong:
        return BrandColors.success;
    }
  }

  // ==================== FORM VALIDATION HELPERS ====================

  /// Validate multiple fields at once
  /// 
  /// Returns a map of field names to error messages
  static Map<String, String?> validateForm(Map<String, String?> fields) {
    final errors = <String, String?>{};
    
    for (final entry in fields.entries) {
      final fieldName = entry.key;
      final value = entry.value;
      
      // Apply appropriate validation based on field name
      switch (fieldName.toLowerCase()) {
        case 'email':
          errors[fieldName] = validateEmail(value);
          break;
        case 'phone':
          errors[fieldName] = validatePhone(value);
          break;
        case 'ethiopian_phone':
          errors[fieldName] = validateEthiopianPhone(value);
          break;
        case 'password':
          errors[fieldName] = validatePassword(value);
          break;
        case 'firstname':
        case 'first_name':
          errors[fieldName] = validateFirstName(value);
          break;
        case 'lastname':
        case 'last_name':
          errors[fieldName] = validateLastName(value);
          break;
        case 'username':
          errors[fieldName] = validateUsername(value);
          break;
        default:
          errors[fieldName] = validateRequired(value, fieldName);
      }
    }
    
    return errors;
  }

  /// Check if form is valid
  /// 
  /// Returns true if all fields are valid, false otherwise
  static bool isFormValid(Map<String, String?> errors) {
    return errors.values.every((error) => error == null);
  }

  /// Get first error message from form validation
  /// 
  /// Returns the first error message found, or null if form is valid
  static String? getFirstError(Map<String, String?> errors) {
    for (final error in errors.values) {
      if (error != null) return error;
    }
    return null;
  }

  // ==================== UTILITY METHODS ====================

  /// Format phone number for display
  /// 
  /// Formats phone number with proper spacing
  static String formatPhoneNumber(String phone) {
    final cleanPhone = phone.replaceAll(RegExp(r'[\s\-\(\)]'), '');
    
    if (cleanPhone.startsWith('+251')) {
      // Ethiopian phone format: +251 XX XXX XXXX
      if (cleanPhone.length == 13) {
        return '${cleanPhone.substring(0, 4)} ${cleanPhone.substring(4, 6)} ${cleanPhone.substring(6, 9)} ${cleanPhone.substring(9)}';
      }
    }
    
    return phone; // Return original if can't format
  }

  /// Clean phone number for API calls
  /// 
  /// Removes all formatting characters
  static String cleanPhoneNumber(String phone) {
    return phone.replaceAll(RegExp(r'[\s\-\(\)]'), '');
  }

  /// Sanitize input string
  /// 
  /// Removes leading/trailing whitespace and normalizes
  static String sanitizeInput(String? input) {
    if (input == null) return '';
    return input.trim();
  }
}
