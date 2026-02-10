// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'transfer_item_batch_model.dart';

part 'transfer_item_model.freezed.dart';
part 'transfer_item_model.g.dart';

@freezed
sealed class TransferItemModel with _$TransferItemModel {
  const factory TransferItemModel({
    required int id,
    String? itemName,
    String? itemCode,
    required int quantity,
    @Default([]) List<TransferItemBatchModel> transferItemBatches,
  }) = _TransferItemModel;

  factory TransferItemModel.fromJson(Map<String, dynamic> json) =>
      _$TransferItemModelFromJson(json);
}
