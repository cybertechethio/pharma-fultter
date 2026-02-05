// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/utils/json_type_converters.dart';

part 'annual_item_type_data_model.freezed.dart';
part 'annual_item_type_data_model.g.dart';

@freezed
sealed class AnnualItemTypeDataModel with _$AnnualItemTypeDataModel {
  const factory AnnualItemTypeDataModel({
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double sales,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double cost,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double grossProfit,
  }) = _AnnualItemTypeDataModel;

  factory AnnualItemTypeDataModel.fromJson(Map<String, dynamic> json) =>
      _$AnnualItemTypeDataModelFromJson(json);
}

