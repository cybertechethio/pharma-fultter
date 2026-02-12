// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'trans_item_batch_model.freezed.dart';
part 'trans_item_batch_model.g.dart';

@freezed
sealed class TransItemBatchModel with _$TransItemBatchModel {
  const factory TransItemBatchModel({
    required int id,
    required int transactionItemId,
    required String batchNumber,
     @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double quantity,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) double? costPrice,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) double? unitPrice,
    DateTime? expirationDate,
  }) = _TransItemBatchModel;

  factory TransItemBatchModel.fromJson(Map<String, dynamic> json) =>
      _$TransItemBatchModelFromJson(json);
}
