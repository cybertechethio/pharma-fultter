// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'salespurchase_data_model.freezed.dart';
part 'salespurchase_data_model.g.dart';

@freezed
sealed class SalesPurchaseDataModel with _$SalesPurchaseDataModel {
  const factory SalesPurchaseDataModel({
    required DateTime date,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double sales,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double purchase,
  }) = _SalesPurchaseDataModel;

  factory SalesPurchaseDataModel.fromJson(Map<String, dynamic> json) =>
      _$SalesPurchaseDataModelFromJson(json);
}

