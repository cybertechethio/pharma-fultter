// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExpenseSummaryModel _$ExpenseSummaryModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ExpenseSummaryModel', json, ($checkedConvert) {
      final val = _ExpenseSummaryModel(
        totalExpenses: $checkedConvert(
          'totalExpenses',
          (v) => JsonTypeConverters.intFromDynamic(v),
        ),
        totalAmount: $checkedConvert(
          'totalAmount',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        averageExpense: $checkedConvert(
          'averageExpense',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        largestExpense: $checkedConvert(
          'largestExpense',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ExpenseSummaryModelToJson(
  _ExpenseSummaryModel instance,
) => <String, dynamic>{
  'totalExpenses': instance.totalExpenses,
  'totalAmount': instance.totalAmount,
  'averageExpense': instance.averageExpense,
  'largestExpense': instance.largestExpense,
};
