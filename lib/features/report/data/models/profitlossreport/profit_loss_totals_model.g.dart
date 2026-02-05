// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profit_loss_totals_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfitLossTotalsModel _$ProfitLossTotalsModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ProfitLossTotalsModel', json, ($checkedConvert) {
  final val = _ProfitLossTotalsModel(
    sales: $checkedConvert(
      'sales',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
    cost: $checkedConvert(
      'cost',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
    vat: $checkedConvert('vat', (v) => JsonTypeConverters.doubleFromDynamic(v)),
    grossProfit: $checkedConvert(
      'grossProfit',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
  );
  return val;
});

Map<String, dynamic> _$ProfitLossTotalsModelToJson(
  _ProfitLossTotalsModel instance,
) => <String, dynamic>{
  'sales': instance.sales,
  'cost': instance.cost,
  'vat': instance.vat,
  'grossProfit': instance.grossProfit,
};
