/// Item form validation utilities
class ItemValidator {
  ItemValidator._();

  /// Validate name field
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  /// Validate code field
  static String? validateCode(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Code is required';
    }
    return null;
  }

  /// Validate cost price field
  static String? validateCostPrice(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Cost price is required';
    }
    final price = double.tryParse(value);
    if (price == null || price <= 0) {
      return 'Cost price must be greater than 0';
    }
    return null;
  }

  /// Validate unit price field
  /// Requires costPriceValue for comparison
  static String? validateUnitPrice(String? value, String? costPriceValue) {
    if (value == null || value.trim().isEmpty) {
      return 'Unit price is required';
    }
    final price = double.tryParse(value);
    if (price == null || price <= 0) {
      return 'Unit price must be greater than 0';
    }
    // Validate unit price >= cost price
    if (costPriceValue != null && costPriceValue.isNotEmpty) {
      final costPrice = double.tryParse(costPriceValue);
      if (costPrice != null && price < costPrice) {
        return 'Unit price must be greater than or equal to cost price';
      }
    }
    return null;
  }

  /// Validate tax rate field
  static String? validateTaxRate(String? value, bool isTaxable) {
    if (!isTaxable) return null;
    if (value == null || value.trim().isEmpty) {
      return 'Tax rate is required';
    }
    final rate = int.tryParse(value);
    if (rate == null || rate < 0 || rate > 100) {
      return 'Tax rate must be between 0 and 100';
    }
    return null;
  }
}

