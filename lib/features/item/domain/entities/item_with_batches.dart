import 'package:freezed_annotation/freezed_annotation.dart';
import 'item_batch_summary.dart';

part 'item_with_batches.freezed.dart';

@freezed
sealed class ItemWithBatches with _$ItemWithBatches {
  const factory ItemWithBatches({
    required int id,
    required String name,
    String? code,
    @Default([]) List<ItemBatchSummary> batches,
  }) = _ItemWithBatches;
}
