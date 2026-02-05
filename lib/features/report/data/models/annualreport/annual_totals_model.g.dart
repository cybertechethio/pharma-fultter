// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annual_totals_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnnualTotalsModel _$AnnualTotalsModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_AnnualTotalsModel', json, ($checkedConvert) {
      final val = _AnnualTotalsModel(
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

Map<String, dynamic> _$AnnualTotalsModelToJson(_AnnualTotalsModel instance) =>
    <String, dynamic>{
      'sales': instance.sales,
      'cost': instance.cost,
      'vat': instance.vat,
      'grossProfit': instance.grossProfit,
    };
