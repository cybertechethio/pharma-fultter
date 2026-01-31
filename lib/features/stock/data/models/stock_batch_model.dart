// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'stock_batch_model.freezed.dart';
part 'stock_batch_model.g.dart';

@freezed
sealed class StockBatchModel with _$StockBatchModel {
  const factory StockBatchModel({
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required int id,
    required int batchId,
    @Default('0') String quantity,
    @Default('0') String costPrice,
    @Default('0') String unitPrice,
    DateTime? lastUsedAt,
    @Default('') String batchNumber,
    @Default('') String batchName,
    DateTime? expirationDate,
  }) = _StockBatchModel;

  factory StockBatchModel.fromJson(Map<String, dynamic> json) =>
      _$StockBatchModelFromJson(json);
}

