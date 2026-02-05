// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExpenseReportModel _$ExpenseReportModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ExpenseReportModel', json, ($checkedConvert) {
      final val = _ExpenseReportModel(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map(
                (e) => ExpenseItemDataModel.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
        summary: $checkedConvert(
          'summary',
          (v) => ExpenseSummaryModel.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ExpenseReportModelToJson(_ExpenseReportModel instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'summary': instance.summary.toJson(),
    };
