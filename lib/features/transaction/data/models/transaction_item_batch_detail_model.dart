// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'transaction_item_batch_detail_model.freezed.dart';
part 'transaction_item_batch_detail_model.g.dart';

@freezed
sealed class TransactionItemBatchDetailModel with _$TransactionItemBatchDetailModel {
  const factory TransactionItemBatchDetailModel({
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required int id,
    required String batchNumber,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required double quantity,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double costPrice,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double unitPrice,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double taxableAmount,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double taxAmount,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required double total,
    @JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamicNullable)
    DateTime? expirationDate,
    required String allocatedFrom,
    @JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic)
    required DateTime createdAt,
  }) = _TransactionItemBatchDetailModel;

  factory TransactionItemBatchDetailModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionItemBatchDetailModelFromJson(json);
}

