// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'expense_model.freezed.dart';
part 'expense_model.g.dart';

@freezed
sealed class ExpenseModel with _$ExpenseModel {
  const factory ExpenseModel({
    @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required String id,
    required String amount,
    required DateTime expenseDate,
    required String name,
    required DateTime createdAt,
    int? createdBy,
  }) = _ExpenseModel;

  factory ExpenseModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseModelFromJson(json);
}
