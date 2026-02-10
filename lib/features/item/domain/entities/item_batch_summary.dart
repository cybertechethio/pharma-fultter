import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_batch_summary.freezed.dart';

@freezed
sealed class ItemBatchSummary with _$ItemBatchSummary {
  const factory ItemBatchSummary({
    required int id,
    required String batchNumber,
    String? batchName,
    double? costPrice,
    double? unitPrice,
    required int quantity,
  }) = _ItemBatchSummary;
}
