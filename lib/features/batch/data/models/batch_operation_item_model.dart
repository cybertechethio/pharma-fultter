import 'package:freezed_annotation/freezed_annotation.dart';

part 'batch_operation_item_model.freezed.dart';
part 'batch_operation_item_model.g.dart';

/// Reusable item for batch consolidation sources and batch split destinations.
/// - Consolidation: [quantity] is optional (null = transfer all from source).
/// - Split: [quantity] is required per destination.
@freezed
sealed class BatchOperationItemModel with _$BatchOperationItemModel {
  const factory BatchOperationItemModel({
    required String batchNumber,
    int? quantity,
    double? costPrice,
    double? unitPrice,
    String? expirationDate,
  }) = _BatchOperationItemModel;

  factory BatchOperationItemModel.fromJson(Map<String, dynamic> json) =>
      _$BatchOperationItemModelFromJson(json);
}

extension BatchOperationItemModelX on BatchOperationItemModel {
  /// Validate item. Use [quantityRequired] true for split destinations, false for consolidation sources (quantity optional, null = all).
  String? validate({required bool quantityRequired}) {
    if (batchNumber.trim().isEmpty) return 'Batch number is required';
    if (quantityRequired) {
      if (quantity == null || quantity! < 1) return 'Quantity is required and must be at least 1';
    } else if (quantity != null && quantity! < 1) {
      return 'Quantity must be at least 1 when set';
    }
    if (costPrice != null && costPrice! < 0) return 'Cost price cannot be negative';
    if (unitPrice != null && unitPrice! < 0) return 'Unit price cannot be negative';
    return null;
  }
}
