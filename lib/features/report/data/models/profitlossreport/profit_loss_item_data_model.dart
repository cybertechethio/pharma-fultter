// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/utils/json_type_converters.dart';

part 'profit_loss_item_data_model.freezed.dart';
part 'profit_loss_item_data_model.g.dart';

@freezed
sealed class ProfitLossItemDataModel with _$ProfitLossItemDataModel {
  const factory ProfitLossItemDataModel({
    required String itemType,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double sales,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double cost,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double vat,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double grossProfit,
  }) = _ProfitLossItemDataModel;

  factory ProfitLossItemDataModel.fromJson(Map<String, dynamic> json) =>
      _$ProfitLossItemDataModelFromJson(json);
}

