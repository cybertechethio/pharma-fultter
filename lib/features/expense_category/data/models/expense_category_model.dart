// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'expense_category_model.freezed.dart';
part 'expense_category_model.g.dart';

@freezed
sealed class ExpenseCategoryModel with _$ExpenseCategoryModel {
  const factory ExpenseCategoryModel({
    @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required String id,
    required int companyId,
    required String name,
    required String description,
    required DateTime createdAt,
    DateTime? updatedAt,
    int? createdBy,
    int? updatedBy,
  }) = _ExpenseCategoryModel;

  factory ExpenseCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseCategoryModelFromJson(json);
}
