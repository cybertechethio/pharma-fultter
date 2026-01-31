// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'branch_model.freezed.dart';
part 'branch_model.g.dart';

@freezed
sealed class BranchModel with _$BranchModel {
  const factory BranchModel({
    @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required String id,
    required String name,
    @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required String companyId,
    @Default(true) bool isActive,
    DateTime? createdAt,
    @JsonKey(fromJson: JsonTypeConverters.stringFromDynamicNullable) String? createdBy,
    @JsonKey(fromJson: JsonTypeConverters.stringFromDynamicNullable) String? updatedBy,
  }) = _BranchModel;

  factory BranchModel.fromJson(Map<String, dynamic> json) =>
      _$BranchModelFromJson(json);
}
