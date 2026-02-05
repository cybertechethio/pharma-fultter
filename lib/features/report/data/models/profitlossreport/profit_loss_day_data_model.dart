// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/utils/json_type_converters.dart';

part 'profit_loss_day_data_model.freezed.dart';
part 'profit_loss_day_data_model.g.dart';

@freezed
sealed class ProfitLossDayDataModel with _$ProfitLossDayDataModel {
  const factory ProfitLossDayDataModel({
    required DateTime date,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double sales,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double profit,
  }) = _ProfitLossDayDataModel;

  factory ProfitLossDayDataModel.fromJson(Map<String, dynamic> json) =>
      _$ProfitLossDayDataModelFromJson(json);
}

