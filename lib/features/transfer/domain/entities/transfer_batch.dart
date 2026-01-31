import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer_batch.freezed.dart';

@freezed
sealed class TransferBatch with _$TransferBatch {
  const factory TransferBatch({
    required String batchNumber,
    required double quantity,
    required double costPrice,
    required double unitPrice,
    DateTime? expirationDate,
    String? allocatedFrom,
  }) = _TransferBatch;
}













