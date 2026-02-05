import 'package:freezed_annotation/freezed_annotation.dart';

part 'batch_transfer_request_model.freezed.dart';
part 'batch_transfer_request_model.g.dart';

@freezed
sealed class BatchTransferRequestModel with _$BatchTransferRequestModel {
  const factory BatchTransferRequestModel({
    required int itemId,
    required String sourceBatchNumber,
    required String destinationBatchNumber,
    required int quantity,
    double? costPrice,
    double? unitPrice,
    String? expirationDate,
    String? notes,
  }) = _BatchTransferRequestModel;

  factory BatchTransferRequestModel.fromJson(Map<String, dynamic> json) =>
      _$BatchTransferRequestModelFromJson(json);
}

/// Extension for validation
extension BatchTransferRequestModelX on BatchTransferRequestModel {
  /// Validate transfer request (mandatory: itemId, sourceBatchNumber, destinationBatchNumber, quantity).
  String? validate() {
    if (itemId < 1) {
      return 'Item is required';
    }
    if (sourceBatchNumber.trim().isEmpty) {
      return 'Source batch number is required';
    }
    if (destinationBatchNumber.trim().isEmpty) {
      return 'Destination batch number is required';
    }
    if (sourceBatchNumber.trim() == destinationBatchNumber.trim()) {
      return 'Source and destination must be different';
    }
    if (quantity < 1) {
      return 'Quantity must be at least 1';
    }
    if (costPrice != null && costPrice! < 0) {
      return 'Cost price cannot be negative';
    }
    if (unitPrice != null && unitPrice! < 0) {
      return 'Unit price cannot be negative';
    }
    return null;
  }
}
