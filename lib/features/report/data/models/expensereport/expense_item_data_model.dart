// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/utils/json_type_converters.dart';

part 'expense_item_data_model.freezed.dart';
part 'expense_item_data_model.g.dart';

@freezed
sealed class ExpenseItemDataModel with _$ExpenseItemDataModel {
  const factory ExpenseItemDataModel({
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
    required int id,
    required String expenseName,
    String? category,
    String? description,
    required DateTime date,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double amount,
    String? paymentMethod,
  }) = _ExpenseItemDataModel;

  factory ExpenseItemDataModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseItemDataModelFromJson(json);
}

