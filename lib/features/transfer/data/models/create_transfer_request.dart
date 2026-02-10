// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_transfer_request.freezed.dart';
part 'create_transfer_request.g.dart';

/// Request model for creating a transfer batch
@freezed
sealed class CreateTransferBatchRequest with _$CreateTransferBatchRequest {
  const factory CreateTransferBatchRequest({
    required String batchNumber,
    required int quantity,
  }) = _CreateTransferBatchRequest;

  factory CreateTransferBatchRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTransferBatchRequestFromJson(json);
}

/// Request model for creating a transfer item
@freezed
sealed class CreateTransferItemRequest with _$CreateTransferItemRequest {
  const factory CreateTransferItemRequest({
    required int itemId,
    required List<CreateTransferBatchRequest> batches,
  }) = _CreateTransferItemRequest;

  factory CreateTransferItemRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTransferItemRequestFromJson(json);
}

/// Request model for creating a transfer
@freezed
sealed class CreateTransferRequest with _$CreateTransferRequest {
  const factory CreateTransferRequest({
    required int destinationBranchId,
    String? notes,
    required List<CreateTransferItemRequest> items,
  }) = _CreateTransferRequest;

  factory CreateTransferRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTransferRequestFromJson(json);
}

/// Extension methods for CreateTransferRequest
extension CreateTransferRequestX on CreateTransferRequest {
  /// Validate transfer data
  String? validate() {
    //check destination branch id is not null and is greater than 0
    if (destinationBranchId <= 0) {
      return 'Destination branch id is required';
    }

    //if note is not null check it is not empty and less than 255 characters
    if (notes != null && notes!.length > 255) {
      return 'Notes must be less than 255 characters';
    }

    if (items.isEmpty) {
      return 'At least one item is required';
    }

    // Validate items and their batches
    for (var item in items) {
      if (item.batches.isEmpty) {
        return 'Each item must have at least one batch';
      }

      //check item id is not null and is greater than 0
      if (item.itemId <= 0) {
        return 'Item id is required';
      }

      // Validate batches
      for (var batch in item.batches) {
        if (batch.quantity <= 0) {
          return 'Batch quantity must be greater than 0';
        }
        //chech batch number is not empty
        if (batch.batchNumber.isEmpty) {
          return 'Batch number is required';
        }
      }
    }

    return null;
  }
}

