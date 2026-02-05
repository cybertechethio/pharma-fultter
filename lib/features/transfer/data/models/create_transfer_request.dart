// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/enums/transfer_type_enum.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'create_transfer_request.freezed.dart';
part 'create_transfer_request.g.dart';

/// Request model for creating a transfer item
@freezed
sealed class CreateTransferItemRequest with _$CreateTransferItemRequest {
  const factory CreateTransferItemRequest({
    required int itemId,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double quantity,
  }) = _CreateTransferItemRequest;

  factory CreateTransferItemRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTransferItemRequestFromJson(json);
}

/// Request model for creating a transfer
@freezed
sealed class CreateTransferRequest with _$CreateTransferRequest {
  const factory CreateTransferRequest({
    required TransferType transferType,
    int? destinationBranchId,
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
    if (items.isEmpty) {
      return 'At least one item is required';
    }

    // Validate items
    for (var item in items) {
      if (item.quantity <= 0) {
        return 'Item quantity must be greater than 0';
      }
    }

    return null;
  }
}

