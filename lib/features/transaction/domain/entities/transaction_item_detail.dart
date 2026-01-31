import 'package:freezed_annotation/freezed_annotation.dart';
import 'transaction_item_batch_detail.dart';

part 'transaction_item_detail.freezed.dart';

@freezed
sealed class TransactionItemDetail with _$TransactionItemDetail {
  const factory TransactionItemDetail({
    required int id,
    required int itemId,
    required String itemName,
    required String itemCode,
    required double quantity,
    required int taxRate,
    required double total,
    required DateTime createdAt,
    required List<TransactionItemBatchDetail> batches,
  }) = _TransactionItemDetail;
}

