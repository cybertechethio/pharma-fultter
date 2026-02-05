// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/utils/json_type_converters.dart';

part 'sales_summary_model.freezed.dart';
part 'sales_summary_model.g.dart';

@freezed
sealed class SalesSummaryModel with _$SalesSummaryModel {
  const factory SalesSummaryModel({
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double totalSales,
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
    required int totalQuantity,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double totalTax,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double totalDiscount,
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
    required int transactionCount,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double averageTransactionValue,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double totalAmount,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double totalPaid,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double totalUnpaid,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double overdue,
  }) = _SalesSummaryModel;

  factory SalesSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$SalesSummaryModelFromJson(json);
}

