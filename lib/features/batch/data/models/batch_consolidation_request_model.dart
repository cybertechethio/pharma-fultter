import 'package:freezed_annotation/freezed_annotation.dart';
import 'batch_operation_item_model.dart';

part 'batch_consolidation_request_model.freezed.dart';
part 'batch_consolidation_request_model.g.dart';

@freezed
sealed class BatchConsolidationRequestModel with _$BatchConsolidationRequestModel {
  const factory BatchConsolidationRequestModel({
    required int itemId,
    required String destinationBatchNumber,
    required List<BatchOperationItemModel> sources,
    String? notes,
  }) = _BatchConsolidationRequestModel;

  factory BatchConsolidationRequestModel.fromJson(Map<String, dynamic> json) =>
      _$BatchConsolidationRequestModelFromJson(json);
}

extension BatchConsolidationRequestModelX on BatchConsolidationRequestModel {
  /// Validate consolidation request (min 1 source; each source has batchNumber).
  String? validate() {
    if (itemId < 1) return 'Item is required';
    if (destinationBatchNumber.trim().isEmpty) {
      return 'Destination batch number is required';
    }
    if (sources.isEmpty) return 'At least one source batch is required';
    for (var i = 0; i < sources.length; i++) {
      final err = sources[i].validate(quantityRequired: false);
      if (err != null) return 'Source ${i + 1}: $err';
    }
    return null;
  }
}
