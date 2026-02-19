// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annual_item_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnnualItemDataModel _$AnnualItemDataModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_AnnualItemDataModel', json, ($checkedConvert) {
      final val = _AnnualItemDataModel(
        sales: $checkedConvert(
          'sales',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        cost: $checkedConvert(
          'cost',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        vat: $checkedConvert(
          'vat',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        grossProfit: $checkedConvert(
          'grossProfit',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$AnnualItemDataModelToJson(
  _AnnualItemDataModel instance,
) => <String, dynamic>{
  'sales': instance.sales,
  'cost': instance.cost,
  'vat': instance.vat,
  'grossProfit': instance.grossProfit,
};
