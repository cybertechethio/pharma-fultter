// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/utils/json_type_converters.dart';
part 'annual_month_data_model.freezed.dart';
part 'annual_month_data_model.g.dart';

@freezed
sealed class AnnualMonthDataModel with _$AnnualMonthDataModel {
  const factory AnnualMonthDataModel({
    required String month,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double sales,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double profit,
  }) = _AnnualMonthDataModel;

  factory AnnualMonthDataModel.fromJson(Map<String, dynamic> json) =>
      _$AnnualMonthDataModelFromJson(json);
}

