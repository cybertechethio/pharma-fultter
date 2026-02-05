// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'annual_month_data_model.dart';

part 'annual_months_model.freezed.dart';
part 'annual_months_model.g.dart';

@freezed
sealed class AnnualMonthsModel with _$AnnualMonthsModel {
  const factory AnnualMonthsModel({
    required List<AnnualMonthDataModel> months,
  }) = _AnnualMonthsModel;

  factory AnnualMonthsModel.fromJson(Map<String, dynamic> json) =>
      _$AnnualMonthsModelFromJson(json);
}

