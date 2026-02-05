// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'trans_item_model.freezed.dart';
part 'trans_item_model.g.dart';

@freezed
sealed class TransItemModel with _$TransItemModel {
  const factory TransItemModel({
    required int id,
    required int itemId,
    required String itemName,
    required String itemCode,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double quantity,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicOrZero)
    required double unitPrice,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicOrZero)
    required double costPrice,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)
    double? taxRate,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)
    double? taxableAmount,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)
    double? taxAmount,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double total,
  }) = _TransItemModel;

  factory TransItemModel.fromJson(Map<String, dynamic> json) =>
      _$TransItemModelFromJson(json);
}

