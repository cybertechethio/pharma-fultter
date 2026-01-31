import 'package:freezed_annotation/freezed_annotation.dart';

part 'batch.freezed.dart';

@freezed
sealed class BatchEntity with _$BatchEntity {
  const factory BatchEntity({
    required int id,
    required int companyId,
    required int itemId,
    required String batchNumber,
    required String batchName,
    required String itemName,
    DateTime? expirationDate,
    DateTime? manufacturingDate,
    String? costPrice,
    String? supplierBatchNumber,
    String? notes,
    required bool isActive,
    required DateTime createdAt,
    DateTime? updatedAt,
    int? createdBy,
    int? updatedBy,
  }) = _BatchEntity;
}

