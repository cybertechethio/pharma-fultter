// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/json_type_converters.dart';

part 'batch_model.freezed.dart';
part 'batch_model.g.dart';

@freezed
sealed class BatchModel with _$BatchModel {
  const factory BatchModel({
    required int id,
    required int itemId,
    @Default('') String batchNumber,
    @Default('N/A') String batchName,
    @Default('N/A') String itemName,
    @Default('N/A') String itemCode,
    DateTime? expirationDate,
    DateTime? manufacturingDate,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)
    double? costPrice,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)
    double? unitPrice,
    String? supplierBatchNumber,
    String? notes,
    @Default(true) bool isActive,
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
    @Default(0)
    int quantity,
    required DateTime createdAt,
    String? createdBy,
    String? updatedBy,
  }) = _BatchModel;

  factory BatchModel.fromJson(Map<String, dynamic> json) =>
      _$BatchModelFromJson(json);
}

