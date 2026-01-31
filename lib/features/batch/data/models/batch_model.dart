// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'batch_model.freezed.dart';
part 'batch_model.g.dart';

@freezed
sealed class BatchModel with _$BatchModel {
  const factory BatchModel({
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required int id,
    required int companyId,
    required int itemId,
    @Default('') String batchNumber,
    required String batchName,
    @Default('N/A') String itemName,
    DateTime? expirationDate,
    DateTime? manufacturingDate,
    String? costPrice,
    String? supplierBatchNumber,
    String? notes,
    @Default(true) bool isActive,
    required DateTime createdAt,
    DateTime? updatedAt,
    int? createdBy,
    int? updatedBy,
  }) = _BatchModel;

  factory BatchModel.fromJson(Map<String, dynamic> json) =>
      _$BatchModelFromJson(json);
}

