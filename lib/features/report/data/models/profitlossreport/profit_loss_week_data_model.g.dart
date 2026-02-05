// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profit_loss_week_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfitLossWeekDataModel _$ProfitLossWeekDataModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ProfitLossWeekDataModel', json, ($checkedConvert) {
  final val = _ProfitLossWeekDataModel(
    week: $checkedConvert('week', (v) => v as String),
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

Map<String, dynamic> _$ProfitLossWeekDataModelToJson(
  _ProfitLossWeekDataModel instance,
) => <String, dynamic>{
  'week': instance.week,
  'sales': instance.sales,
  'profit': instance.profit,
};
