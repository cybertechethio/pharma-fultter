import 'package:freezed_annotation/freezed_annotation.dart';

part 'batch_request_model.freezed.dart';
part 'batch_request_model.g.dart';

@freezed
sealed class BatchRequestModel with _$BatchRequestModel {
  const factory BatchRequestModel({
    required int itemId,
    required String batchName,
    required double costPrice,
    required double unitPrice,
    String? expirationDate,
    String? manufacturingDate,
    String? supplierBatchNumber,
    String? notes,
  }) = _BatchRequestModel;

  factory BatchRequestModel.fromJson(Map<String, dynamic> json) =>
      _$BatchRequestModelFromJson(json);
}

/// Extension for validation
extension BatchRequestModelX on BatchRequestModel {
  /// Validate for create.
  String? validateForCreate() {
    if (itemId < 1) {
      return 'Item is required';
    }
    if (batchName.trim().isEmpty) {
      return 'Batch name is required';
    }
    if (costPrice < 0) {
      return 'Cost price cannot be negative';
    }
    if (unitPrice < 0) {
      return 'Unit price cannot be negative';
    }
    if (unitPrice < costPrice) {
      return 'Unit price must be greater than or equal to cost price';
    }
    return null;
  }

  /// Validate for update (price rules).
  String? validateForUpdate() {
    if (costPrice < 0) {
      return 'Cost price cannot be negative';
    }
    if (unitPrice < 0) {
      return 'Unit price cannot be negative';
    }
    if (unitPrice < costPrice) {
      return 'Unit price must be greater than or equal to cost price';
    }
    return null;
  }
}
