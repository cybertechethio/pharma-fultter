import 'package:freezed_annotation/freezed_annotation.dart';
import 'transfer_batch.dart';

part 'transfer_item.freezed.dart';

@freezed
sealed class TransferItem with _$TransferItem {
  const factory TransferItem({
    required int itemId,
    required List<TransferBatch> batches,
  }) = _TransferItem;
}













