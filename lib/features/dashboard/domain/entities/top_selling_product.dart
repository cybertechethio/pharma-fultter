import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_selling_product.freezed.dart';

@freezed
sealed class TopSellingProduct with _$TopSellingProduct {
  const factory TopSellingProduct({
    required int id,
    required String name,
    String? imageUrl,
    required double price,
    required int sales,
    required double growth,
  }) = _TopSellingProduct;
}

