// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'annual_item_type_data_model.dart';

part 'annual_item_types_breakdown_model.freezed.dart';
part 'annual_item_types_breakdown_model.g.dart';

@freezed
sealed class AnnualItemTypesBreakdownModel with _$AnnualItemTypesBreakdownModel {
  const factory AnnualItemTypesBreakdownModel({
    required AnnualItemTypeDataModel direct,
    required AnnualItemTypeDataModel processed,
  }) = _AnnualItemTypesBreakdownModel;

  factory AnnualItemTypesBreakdownModel.fromJson(Map<String, dynamic> json) =>
      _$AnnualItemTypesBreakdownModelFromJson(json);
}

