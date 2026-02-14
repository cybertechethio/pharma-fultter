// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profit_loss_item_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfitLossItemDataModel _$ProfitLossItemDataModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ProfitLossItemDataModel', json, ($checkedConvert) {
  final val = _ProfitLossItemDataModel(
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

Map<String, dynamic> _$ProfitLossItemDataModelToJson(
  _ProfitLossItemDataModel instance,
) => <String, dynamic>{
  'sales': instance.sales,
  'cost': instance.cost,
  'vat': instance.vat,
  'grossProfit': instance.grossProfit,
};
