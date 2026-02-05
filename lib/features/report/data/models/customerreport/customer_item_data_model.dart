// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/utils/json_type_converters.dart';

part 'customer_item_data_model.freezed.dart';
part 'customer_item_data_model.g.dart';

@freezed
sealed class CustomerItemDataModel with _$CustomerItemDataModel {
  const factory CustomerItemDataModel({
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
    required int id,
    required String reference,
    String? code,
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
    required int customerId,
    required String customerName,
    String? customerImageUrl,
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
    required int totalOrders,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double totalAmount,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double paidAmount,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double dueAmount,
    @JsonKey(fromJson: JsonTypeConverters.boolFromDynamic)
    required bool hasDiscrepancy,
  }) = _CustomerItemDataModel;

  factory CustomerItemDataModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerItemDataModelFromJson(json);
}

