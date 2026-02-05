// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annual_chart_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnnualChartDataModel _$AnnualChartDataModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_AnnualChartDataModel', json, ($checkedConvert) {
  final val = _AnnualChartDataModel(
    salesProfitTrend: $checkedConvert(
      'salesProfitTrend',
      (v) => AnnualMonthsModel.fromJson(v as Map<String, dynamic>),
    ),
    itemTypesBreakdown: $checkedConvert(
      'itemTypesBreakdown',
      (v) => AnnualItemTypesBreakdownModel.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$AnnualChartDataModelToJson(
  _AnnualChartDataModel instance,
) => <String, dynamic>{
  'salesProfitTrend': instance.salesProfitTrend.toJson(),
  'itemTypesBreakdown': instance.itemTypesBreakdown.toJson(),
};
