// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/utils/json_type_converters.dart';
part 'annual_totals_model.freezed.dart';
part 'annual_totals_model.g.dart';

@freezed
sealed class AnnualTotalsModel with _$AnnualTotalsModel {
  const factory AnnualTotalsModel({
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double sales,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double cost,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double vat,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double grossProfit,
  }) = _AnnualTotalsModel;

  factory AnnualTotalsModel.fromJson(Map<String, dynamic> json) =>
      _$AnnualTotalsModelFromJson(json);
}

