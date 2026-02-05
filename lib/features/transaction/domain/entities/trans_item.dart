import 'package:freezed_annotation/freezed_annotation.dart';

part 'trans_item.freezed.dart';

@freezed
sealed class TransItem with _$TransItem {
  const factory TransItem({
    required int id,
    required int itemId,
    required String itemName,
    required String itemCode,
    required double quantity,
    required double unitPrice,
    required double costPrice,
    double? taxRate,
    double? taxableAmount,
    double? taxAmount,
    required double total,
  }) = _TransItem;
}

