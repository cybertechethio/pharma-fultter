import 'package:freezed_annotation/freezed_annotation.dart';
import 'transfer_item_model.dart';

part 'transfer_model.freezed.dart';
part 'transfer_model.g.dart';

/// Model for creating a transfer (always transfer_out)
@freezed
sealed class TransferModel with _$TransferModel {
  const factory TransferModel({
    required int destinationBranchId,
    int? relatedTransferId,
    String? notes,
    required List<TransferItemModel> items,
  }) = _TransferModel;

  factory TransferModel.fromJson(Map<String, dynamic> json) =>
      _$TransferModelFromJson(json);
}













