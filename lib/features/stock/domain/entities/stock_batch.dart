import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_batch.freezed.dart';

@freezed
sealed class StockBatch with _$StockBatch {
  const factory StockBatch({
    required int id,
    required int batchId,
    required String quantity,
    required String costPrice,
    required String unitPrice,
    DateTime? lastUsedAt,
    required String batchNumber,
    required String batchName,
    DateTime? expirationDate,
  }) = _StockBatch;
}

