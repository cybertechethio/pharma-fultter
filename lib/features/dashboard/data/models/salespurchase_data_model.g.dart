// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salespurchase_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SalesPurchaseDataModel _$SalesPurchaseDataModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_SalesPurchaseDataModel', json, ($checkedConvert) {
  final val = _SalesPurchaseDataModel(
    date: $checkedConvert('date', (v) => DateTime.parse(v as String)),
    sales: $checkedConvert(
      'sales',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
    purchase: $checkedConvert(
      'purchase',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
  );
  return val;
});

Map<String, dynamic> _$SalesPurchaseDataModelToJson(
  _SalesPurchaseDataModel instance,
) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'sales': instance.sales,
  'purchase': instance.purchase,
};
