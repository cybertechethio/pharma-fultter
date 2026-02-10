// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'item_batch_summary_model.freezed.dart';
part 'item_batch_summary_model.g.dart';

@freezed
sealed class ItemBatchSummaryModel with _$ItemBatchSummaryModel {
  const factory ItemBatchSummaryModel({
    required int id,
    required String batchNumber,
    String? batchName,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)
    double? costPrice,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)
    double? unitPrice,
    required int quantity,
  }) = _ItemBatchSummaryModel;

  factory ItemBatchSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$ItemBatchSummaryModelFromJson(json);
}
