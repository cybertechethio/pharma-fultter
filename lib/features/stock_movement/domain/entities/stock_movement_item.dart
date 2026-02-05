import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_movement_item.freezed.dart';

@freezed
sealed class StockMovementItem with _$StockMovementItem {
  const factory StockMovementItem({
    required int id,
    required String name,
    String? code,
  }) = _StockMovementItem;
}

