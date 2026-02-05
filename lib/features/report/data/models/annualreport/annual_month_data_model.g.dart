// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annual_month_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnnualMonthDataModel _$AnnualMonthDataModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_AnnualMonthDataModel', json, ($checkedConvert) {
  final val = _AnnualMonthDataModel(
    month: $checkedConvert('month', (v) => v as String),
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

Map<String, dynamic> _$AnnualMonthDataModelToJson(
  _AnnualMonthDataModel instance,
) => <String, dynamic>{
  'month': instance.month,
  'sales': instance.sales,
  'profit': instance.profit,
};
