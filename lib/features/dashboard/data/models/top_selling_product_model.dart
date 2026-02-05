// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'top_selling_product_model.freezed.dart';
part 'top_selling_product_model.g.dart';

@freezed
sealed class TopSellingProductModel with _$TopSellingProductModel {
  const factory TopSellingProductModel({
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
    required int id,
    required String name,
    String? imageUrl,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double price,
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
    required int sales,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double growth,
  }) = _TopSellingProductModel;

  factory TopSellingProductModel.fromJson(Map<String, dynamic> json) =>
      _$TopSellingProductModelFromJson(json);
}

