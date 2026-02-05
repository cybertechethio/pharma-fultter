// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/utils/json_type_converters.dart';

part 'customer_summary_model.freezed.dart';
part 'customer_summary_model.g.dart';

@freezed
sealed class CustomerSummaryModel with _$CustomerSummaryModel {
  const factory CustomerSummaryModel({
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
    required int totalCustomers,
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
    required int totalOrders,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double totalAmount,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double totalPaid,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double totalUnpaid,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double totalToPayCustomers,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double totalCustomersOweUs,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double netBalance,
  }) = _CustomerSummaryModel;

  factory CustomerSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerSummaryModelFromJson(json);
}

