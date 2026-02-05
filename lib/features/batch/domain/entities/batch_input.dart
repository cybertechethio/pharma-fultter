import 'package:freezed_annotation/freezed_annotation.dart';

part 'batch_input.freezed.dart';

/// Domain-level input for create/update batch. Used by repository and use cases.
/// [itemId] is required for create; for update it is ignored by the API.
@freezed
sealed class BatchInput with _$BatchInput {
  const factory BatchInput({
    int? itemId,
    required String batchName,
    required double costPrice,
    required double unitPrice,
    String? expirationDate,
    String? manufacturingDate,
    String? supplierBatchNumber,
    String? notes,
  }) = _BatchInput;
}
