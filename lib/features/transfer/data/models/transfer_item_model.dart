import 'package:freezed_annotation/freezed_annotation.dart';
import 'transfer_batch_model.dart';

part 'transfer_item_model.freezed.dart';
part 'transfer_item_model.g.dart';

@freezed
sealed class TransferItemModel with _$TransferItemModel {
  const factory TransferItemModel({
    required int itemId,
    required List<TransferBatchModel> batches,
  }) = _TransferItemModel;

  factory TransferItemModel.fromJson(Map<String, dynamic> json) =>
      _$TransferItemModelFromJson(json);
}













