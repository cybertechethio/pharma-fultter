import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_item.freezed.dart';

@freezed
sealed class StockItem with _$StockItem {
  const factory StockItem({
    required int id,
    required String name,
    String? code,
    String? categories,
    String? subCategories,
    String? brands,
    String? units,
    String? models,
    String? color,
    String? size,
    String? material,
    String? weight,
    String? unitPrice,
  }) = _StockItem;
}

