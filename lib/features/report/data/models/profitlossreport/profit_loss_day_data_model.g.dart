// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profit_loss_day_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfitLossDayDataModel _$ProfitLossDayDataModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ProfitLossDayDataModel', json, ($checkedConvert) {
  final val = _ProfitLossDayDataModel(
    date: $checkedConvert('date', (v) => DateTime.parse(v as String)),
    sales: $checkedConvert(
      'sales',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
    profit: $checkedConvert(
      'profit',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
  );
  return val;
});

Map<String, dynamic> _$ProfitLossDayDataModelToJson(
  _ProfitLossDayDataModel instance,
) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'sales': instance.sales,
  'profit': instance.profit,
};
