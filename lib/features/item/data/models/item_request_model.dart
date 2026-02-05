import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_request_model.freezed.dart';
part 'item_request_model.g.dart';

@freezed
sealed class ItemRequestModel with _$ItemRequestModel {
  const factory ItemRequestModel({
    required String name,
    String? description,
    int? categoryId,
    int? subCategoryId,
    int? brandId,
    int? unitId,
    int? modelId,
    String? sku,
    required String code,
    String? barcode,
    String? color,
    String? size,
    String? material,
    double? weight,
    required bool isTaxable,
    @Default(0) int taxRate,
    required bool isActive,
    String? imageUrl,
    required double costPrice,
    required double unitPrice,
    String? expirationDate,
    String? manufacturingDate,
  }) = _ItemRequestModel;

  factory ItemRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ItemRequestModelFromJson(json);
}

/// Extension for validation
extension ItemRequestModelX on ItemRequestModel {
  /// Validate the request model
  String? validate() {
    if (name.trim().isEmpty) {
      return 'Name is required';
    }

    if (code.trim().isEmpty) {
      return 'Code is required';
    }

    if (costPrice <= 0) {
      return 'Cost price must be greater than 0';
    }

    if (unitPrice <= 0) {
      return 'Unit price must be greater than 0';
    }

    if (unitPrice < costPrice) {
      return 'Unit price must be greater than or equal to cost price';
    }

    if (taxRate < 0 || taxRate > 100) {
      return 'Tax rate must be between 0 and 100';
    }

    if (weight != null && weight! < 0) {
      return 'Weight cannot be negative';
    }

    return null;
  }
}

