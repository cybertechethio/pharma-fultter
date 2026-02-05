// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/utils/json_type_converters.dart';

part 'expense_summary_model.freezed.dart';
part 'expense_summary_model.g.dart';

@freezed
sealed class ExpenseSummaryModel with _$ExpenseSummaryModel {
  const factory ExpenseSummaryModel({
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
    required int totalExpenses,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double totalAmount,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double averageExpense,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double largestExpense,
  }) = _ExpenseSummaryModel;

  factory ExpenseSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseSummaryModelFromJson(json);
}

