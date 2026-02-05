import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer_item.freezed.dart';

@freezed
sealed class TransferItem with _$TransferItem {
  const factory TransferItem({
    required int id,
    required String itemName,
    String? itemCode,
    required double quantity,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _TransferItem;
}

