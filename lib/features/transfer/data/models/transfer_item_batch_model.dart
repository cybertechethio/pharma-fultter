// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'transfer_item_batch_model.freezed.dart';
part 'transfer_item_batch_model.g.dart';

@freezed
sealed class TransferItemBatchModel with _$TransferItemBatchModel {
  const factory TransferItemBatchModel({
    required int id,
    int? transferItemId,
    required String batchNumber,
    required int quantity,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) double? costPrice,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) double? unitPrice,
    DateTime? expirationDate,
  }) = _TransferItemBatchModel;

  factory TransferItemBatchModel.fromJson(Map<String, dynamic> json) =>
      _$TransferItemBatchModelFromJson(json);
}
