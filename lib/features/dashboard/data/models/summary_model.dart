// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'summary_model.freezed.dart';
part 'summary_model.g.dart';

@freezed
sealed class SummaryModel with _$SummaryModel {
  const factory SummaryModel({
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double totalSales,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double totalSalesReturn,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double totalPurchase,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double totalPurchaseReturn,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double profit,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double invoiceDue,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double invoiceDuePercentageChange,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double totalExpenses,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double totalExpensesPercentageChange,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double totalPaymentReturns,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double totalPaymentReturnsPercentageChange,
  }) = _SummaryModel;

  factory SummaryModel.fromJson(Map<String, dynamic> json) =>
      _$SummaryModelFromJson(json);
}

