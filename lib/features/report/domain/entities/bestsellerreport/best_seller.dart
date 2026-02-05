import 'package:freezed_annotation/freezed_annotation.dart';

part 'best_seller.freezed.dart';

@freezed
sealed class BestSeller with _$BestSeller {
  const factory BestSeller({
    required int id,
    required int itemId,
    required String itemName,
    String? itemCode,
    String? sku,
    String? category,
    String? brand,
    String? imageUrl,
    required int soldQty,
    required double soldAmount,
    required int instockQty,
  }) = _BestSeller;
}

