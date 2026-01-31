import 'package:freezed_annotation/freezed_annotation.dart';
import 'transaction_batch.dart';

part 'transaction_item.freezed.dart';

@freezed
sealed class TransactionItem with _$TransactionItem {
  const factory TransactionItem({
    required int itemId,
    required double taxRate,
    required List<TransactionBatch> batches,
  }) = _TransactionItem;
}

