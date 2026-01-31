import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_batch_model.freezed.dart';
part 'transaction_batch_model.g.dart';

@freezed
sealed class TransactionBatchModel with _$TransactionBatchModel {
  const factory TransactionBatchModel({
    required String batchNumber,
    required double quantity,
    required double costPrice,
    required double unitPrice,
  }) = _TransactionBatchModel;

  factory TransactionBatchModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionBatchModelFromJson(json);
}

