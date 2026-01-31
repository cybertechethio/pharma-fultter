import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_item_batch_detail.freezed.dart';

@freezed
sealed class TransactionItemBatchDetail with _$TransactionItemBatchDetail {
  const factory TransactionItemBatchDetail({
    required int id,
    required String batchNumber,
    required double quantity,
    required double costPrice,
    required double unitPrice,
    required double taxableAmount,
    required double taxAmount,
    required double total,
    DateTime? expirationDate,
    required String allocatedFrom,
    required DateTime createdAt,
  }) = _TransactionItemBatchDetail;
}

