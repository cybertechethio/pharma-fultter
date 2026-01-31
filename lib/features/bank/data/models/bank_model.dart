// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'bank_model.freezed.dart';
part 'bank_model.g.dart';

@freezed
sealed class BankModel with _$BankModel {
  const factory BankModel({
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required int id,
    required int companyId,
    required String name,
    required DateTime createdAt,
    DateTime? updatedAt,
    int? createdBy,
    int? updatedBy,
  }) = _BankModel;

  factory BankModel.fromJson(Map<String, dynamic> json) =>
      _$BankModelFromJson(json);
}

