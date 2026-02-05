import 'package:freezed_annotation/freezed_annotation.dart';

part 'batch.freezed.dart';

@freezed
sealed class BatchEntity with _$BatchEntity {
  const factory BatchEntity({
    required int id,
    required int itemId,
    required String batchNumber,
    required String batchName,
    required String itemName,
    required String itemCode,
    DateTime? expirationDate,
    DateTime? manufacturingDate,
    double? costPrice,
    double? unitPrice,
    String? supplierBatchNumber,
    String? notes,
    required bool isActive,
    required int quantity,
    required DateTime createdAt,
    String? createdBy,
    String? updatedBy,
  }) = _BatchEntity;
}

