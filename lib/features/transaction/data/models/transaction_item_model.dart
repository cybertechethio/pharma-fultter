import 'package:freezed_annotation/freezed_annotation.dart';
import 'transaction_batch_model.dart';

part 'transaction_item_model.freezed.dart';
part 'transaction_item_model.g.dart';

@freezed
sealed class TransactionItemModel with _$TransactionItemModel {
  const factory TransactionItemModel({
    required int itemId,
    required int taxRate,
    required List<TransactionBatchModel> batches,
  }) = _TransactionItemModel;

  factory TransactionItemModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionItemModelFromJson(json);
}

