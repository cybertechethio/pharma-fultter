import 'package:freezed_annotation/freezed_annotation.dart';

part 'low_stock_product.freezed.dart';

@freezed
sealed class LowStockProduct with _$LowStockProduct {
  const factory LowStockProduct({
    required int id,
    required String name,
    String? imageUrl,
    String? code,
    required int stock,
  }) = _LowStockProduct;
}

