// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_item_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExpenseItemDataModel _$ExpenseItemDataModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ExpenseItemDataModel', json, ($checkedConvert) {
  final val = _ExpenseItemDataModel(
    id: $checkedConvert('id', (v) => JsonTypeConverters.intFromDynamic(v)),
    expenseName: $checkedConvert('expenseName', (v) => v as String),
    category: $checkedConvert('category', (v) => v as String?),
    description: $checkedConvert('description', (v) => v as String?),
    date: $checkedConvert('date', (v) => DateTime.parse(v as String)),
    amount: $checkedConvert(
      'amount',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
    paymentMethod: $checkedConvert('paymentMethod', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$ExpenseItemDataModelToJson(
  _ExpenseItemDataModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'expenseName': instance.expenseName,
  'category': ?instance.category,
  'description': ?instance.description,
  'date': instance.date.toIso8601String(),
  'amount': instance.amount,
  'paymentMethod': ?instance.paymentMethod,
};
