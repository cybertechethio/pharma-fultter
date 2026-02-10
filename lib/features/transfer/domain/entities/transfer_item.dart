import 'package:freezed_annotation/freezed_annotation.dart';
import 'transfer_item_batch.dart';

part 'transfer_item.freezed.dart';

@freezed
sealed class TransferItem with _$TransferItem {
  const factory TransferItem({
    required int id,
    String? itemName,
    String? itemCode,
    required int quantity,
    @Default([]) List<TransferItemBatch> transferItemBatches,
  }) = _TransferItem;
}
