// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';
import 'transaction_item_batch_detail_model.dart';

part 'transaction_item_detail_model.freezed.dart';
part 'transaction_item_detail_model.g.dart';

@freezed
sealed class TransactionItemDetailModel with _$TransactionItemDetailModel {
  const factory TransactionItemDetailModel({
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required int id,
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required int itemId,
    required String itemName,
    required String itemCode,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required double quantity,
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required int taxRate,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required double total,
    @JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic)
    required DateTime createdAt,
    @JsonKey(name: 'transactionItemBatches', fromJson: _batchesFromJson)
    required List<TransactionItemBatchDetailModel> batches,
  }) = _TransactionItemDetailModel;

  factory TransactionItemDetailModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionItemDetailModelFromJson(json);
}

/// Helper function to convert transactionItemBatches from JSON, handling null values
List<TransactionItemBatchDetailModel> _batchesFromJson(dynamic json) {
  // Handle null case
  if (json == null) {
    return [];
  }
  
  // Handle list case
  if (json is List) {
    return json
        .map((e) {
          if (e is Map<String, dynamic>) {
            return TransactionItemBatchDetailModel.fromJson(e);
          }
          throw FormatException('Expected Map<String, dynamic> in batches list, got ${e.runtimeType}');
        })
        .toList();
  }
  
  // If it's not null and not a list, return empty list (defensive)
  return [];
}

