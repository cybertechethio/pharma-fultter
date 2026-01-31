import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_batch.freezed.dart';

@freezed
sealed class TransactionBatch with _$TransactionBatch {
  const factory TransactionBatch({
    required String batchNumber,
    required double quantity,
    required double costPrice,
    required double unitPrice,
    DateTime? expirationDate,
  }) = _TransactionBatch;
}

