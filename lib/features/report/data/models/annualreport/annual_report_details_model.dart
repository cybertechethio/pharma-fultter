// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/utils/json_type_converters.dart';
import 'annual_item_data_model.dart';
import 'annual_totals_model.dart';

part 'annual_report_details_model.freezed.dart';
part 'annual_report_details_model.g.dart';

@freezed
sealed class AnnualReportDetailsModel with _$AnnualReportDetailsModel {
  const factory AnnualReportDetailsModel({
    required DateTime startDate,
    required DateTime endDate,
    required List<AnnualItemDataModel> items,
    required AnnualTotalsModel totals,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double expenses,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double netProfit,
  }) = _AnnualReportDetailsModel;

  factory AnnualReportDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$AnnualReportDetailsModelFromJson(json);
}

