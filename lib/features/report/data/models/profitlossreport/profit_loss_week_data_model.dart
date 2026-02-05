// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/utils/json_type_converters.dart';

part 'profit_loss_week_data_model.freezed.dart';
part 'profit_loss_week_data_model.g.dart';

@freezed
sealed class ProfitLossWeekDataModel with _$ProfitLossWeekDataModel {
  const factory ProfitLossWeekDataModel({
    required String week,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double sales,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double profit,
  }) = _ProfitLossWeekDataModel;

  factory ProfitLossWeekDataModel.fromJson(Map<String, dynamic> json) =>
      _$ProfitLossWeekDataModelFromJson(json);
}

