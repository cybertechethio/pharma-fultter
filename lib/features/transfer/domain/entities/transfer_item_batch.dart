import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer_item_batch.freezed.dart';

@freezed
sealed class TransferItemBatch with _$TransferItemBatch {
  const factory TransferItemBatch({
    required int id,
    int? transferItemId,
    required String batchNumber,
    required int quantity,
    double? costPrice,
    double? unitPrice,
    DateTime? expirationDate,
  }) = _TransferItemBatch;
}
