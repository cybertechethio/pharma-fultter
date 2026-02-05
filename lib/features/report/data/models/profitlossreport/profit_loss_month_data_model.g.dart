// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profit_loss_month_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfitLossMonthDataModel _$ProfitLossMonthDataModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ProfitLossMonthDataModel', json, ($checkedConvert) {
  final val = _ProfitLossMonthDataModel(
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

Map<String, dynamic> _$ProfitLossMonthDataModelToJson(
  _ProfitLossMonthDataModel instance,
) => <String, dynamic>{
  'month': instance.month,
  'sales': instance.sales,
  'profit': instance.profit,
};
