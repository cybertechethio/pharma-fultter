// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/utils/json_type_converters.dart';

part 'profit_loss_month_data_model.freezed.dart';
part 'profit_loss_month_data_model.g.dart';

@freezed
sealed class ProfitLossMonthDataModel with _$ProfitLossMonthDataModel {
  const factory ProfitLossMonthDataModel({
    required String month,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double sales,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double profit,
  }) = _ProfitLossMonthDataModel;

  factory ProfitLossMonthDataModel.fromJson(Map<String, dynamic> json) =>
      _$ProfitLossMonthDataModelFromJson(json);
}

