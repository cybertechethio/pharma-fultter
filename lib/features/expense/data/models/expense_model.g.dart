// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExpenseModel _$ExpenseModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ExpenseModel', json, ($checkedConvert) {
  final val = _ExpenseModel(
    id: $checkedConvert('id', (v) => JsonTypeConverters.stringFromDynamic(v)),
    amount: $checkedConvert('amount', (v) => v as String),
    expenseDate: $checkedConvert(
      'expenseDate',
      (v) => DateTime.parse(v as String),
    ),
    name: $checkedConvert('name', (v) => v as String),
    createdAt: $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
    createdBy: $checkedConvert('createdBy', (v) => (v as num?)?.toInt()),
  );
  return val;
});

Map<String, dynamic> _$ExpenseModelToJson(_ExpenseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'expenseDate': instance.expenseDate.toIso8601String(),
      'name': instance.name,
      'createdAt': instance.createdAt.toIso8601String(),
      'createdBy': ?instance.createdBy,
    };
