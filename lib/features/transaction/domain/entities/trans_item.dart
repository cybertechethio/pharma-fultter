import 'package:freezed_annotation/freezed_annotation.dart';

import 'trans_item_batch.dart';

part 'trans_item.freezed.dart';

@freezed
sealed class TransItem with _$TransItem {
  const factory TransItem({
    required int id,
    required String itemName,
    required String itemCode,
    required double quantity,
    @Default([]) List<TransItemBatch> batches,
  }) = _TransItem;
}

