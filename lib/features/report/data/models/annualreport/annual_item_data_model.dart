// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/utils/json_type_converters.dart';

part 'annual_item_data_model.freezed.dart';
part 'annual_item_data_model.g.dart';

@freezed
sealed class AnnualItemDataModel with _$AnnualItemDataModel {
  const factory AnnualItemDataModel({
    required String itemType,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double sales,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double cost,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double vat,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double grossProfit,
  }) = _AnnualItemDataModel;

  factory AnnualItemDataModel.fromJson(Map<String, dynamic> json) =>
      _$AnnualItemDataModelFromJson(json);
}

