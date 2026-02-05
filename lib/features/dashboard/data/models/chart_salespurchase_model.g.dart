// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_salespurchase_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChartSalesPerchaseModel _$ChartSalesPerchaseModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ChartSalesPerchaseModel', json, ($checkedConvert) {
  final val = _ChartSalesPerchaseModel(
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>)
          .map(
            (e) => SalesPurchaseDataModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    ),
    totalSales: $checkedConvert(
      'totalSales',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
    totalPurchase: $checkedConvert(
      'totalPurchase',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
  );
  return val;
});

Map<String, dynamic> _$ChartSalesPerchaseModelToJson(
  _ChartSalesPerchaseModel instance,
) => <String, dynamic>{
  'data': instance.data.map((e) => e.toJson()).toList(),
  'totalSales': instance.totalSales,
  'totalPurchase': instance.totalPurchase,
};
