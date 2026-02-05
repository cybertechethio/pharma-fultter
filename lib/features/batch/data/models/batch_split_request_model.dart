import 'package:freezed_annotation/freezed_annotation.dart';
import 'batch_operation_item_model.dart';

part 'batch_split_request_model.freezed.dart';
part 'batch_split_request_model.g.dart';

@freezed
sealed class BatchSplitRequestModel with _$BatchSplitRequestModel {
  const factory BatchSplitRequestModel({
    required int itemId,
    required String sourceBatchNumber,
    required List<BatchOperationItemModel> destinations,
    String? notes,
  }) = _BatchSplitRequestModel;

  factory BatchSplitRequestModel.fromJson(Map<String, dynamic> json) =>
      _$BatchSplitRequestModelFromJson(json);
}

extension BatchSplitRequestModelX on BatchSplitRequestModel {
  /// Validate split request (min 1 destination; each has batchNumber and quantity).
  String? validate() {
    if (itemId < 1) return 'Item is required';
    if (sourceBatchNumber.trim().isEmpty) {
      return 'Source batch number is required';
    }
    if (destinations.isEmpty) return 'At least one destination batch is required';
    for (var i = 0; i < destinations.length; i++) {
      final err = destinations[i].validate(quantityRequired: true);
      if (err != null) return 'Destination ${i + 1}: $err';
    }
    return null;
  }
}
