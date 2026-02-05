// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annual_item_type_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnnualItemTypeDataModel _$AnnualItemTypeDataModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_AnnualItemTypeDataModel', json, ($checkedConvert) {
  final val = _AnnualItemTypeDataModel(
    sales: $checkedConvert(
      'sales',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
    cost: $checkedConvert(
      'cost',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
    grossProfit: $checkedConvert(
      'grossProfit',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
  );
  return val;
});

Map<String, dynamic> _$AnnualItemTypeDataModelToJson(
  _AnnualItemTypeDataModel instance,
) => <String, dynamic>{
  'sales': instance.sales,
  'cost': instance.cost,
  'grossProfit': instance.grossProfit,
};
