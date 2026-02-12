import 'package:freezed_annotation/freezed_annotation.dart';
  part 'trans_item_batch.freezed.dart';

@freezed
sealed class TransItemBatch with _$TransItemBatch {
  const factory TransItemBatch({
    required int id,
    int? transactionItemId,
    required String batchNumber,
    required double quantity,
    double? costPrice,
    double? unitPrice,
    DateTime? expirationDate,
  }) = _TransItemBatch;
}
