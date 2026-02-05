// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'low_stock_product_model.freezed.dart';
part 'low_stock_product_model.g.dart';

@freezed
sealed class LowStockProductModel with _$LowStockProductModel {
  const factory LowStockProductModel({
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
    required int id,
    required String name,
    String? imageUrl,
    String? code,
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
    required int stock,
  }) = _LowStockProductModel;

  factory LowStockProductModel.fromJson(Map<String, dynamic> json) =>
      _$LowStockProductModelFromJson(json);
}

