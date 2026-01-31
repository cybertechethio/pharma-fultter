import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer_batch_model.freezed.dart';
part 'transfer_batch_model.g.dart';

@freezed
sealed class TransferBatchModel with _$TransferBatchModel {
  const factory TransferBatchModel({
    required String batchNumber,
    required double quantity,
    required double costPrice,
    required double unitPrice,
    DateTime? expirationDate,
    String? allocatedFrom,
  }) = _TransferBatchModel;

  factory TransferBatchModel.fromJson(Map<String, dynamic> json) =>
      _$TransferBatchModelFromJson(json);
}













