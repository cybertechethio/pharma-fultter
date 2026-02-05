// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/utils/json_type_converters.dart';

part 'profit_loss_totals_model.freezed.dart';
part 'profit_loss_totals_model.g.dart';

@freezed
sealed class ProfitLossTotalsModel with _$ProfitLossTotalsModel {
  const factory ProfitLossTotalsModel({
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double sales,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double cost,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double vat,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double grossProfit,
  }) = _ProfitLossTotalsModel;

  factory ProfitLossTotalsModel.fromJson(Map<String, dynamic> json) =>
      _$ProfitLossTotalsModelFromJson(json);
}

