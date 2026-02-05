// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/utils/json_type_converters.dart';

part 'best_seller_model.freezed.dart';
part 'best_seller_model.g.dart';

@freezed
sealed class BestSellerModel with _$BestSellerModel {
  const factory BestSellerModel({
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
    required int id,
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
    required int itemId,
    required String itemName,
    String? itemCode,
    String? sku,
    String? category,
    String? brand,
    String? imageUrl,
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
    required int soldQty,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double soldAmount,
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
    required int instockQty,
  }) = _BestSellerModel;

  factory BestSellerModel.fromJson(Map<String, dynamic> json) =>
      _$BestSellerModelFromJson(json);
}

