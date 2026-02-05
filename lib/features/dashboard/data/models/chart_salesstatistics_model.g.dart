// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_salesstatistics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChartSalesStatisticsModel _$ChartSalesStatisticsModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ChartSalesStatisticsModel', json, ($checkedConvert) {
  final val = _ChartSalesStatisticsModel(
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>)
          .map(
            (e) => SalesStatisticsDataModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    ),
    totalRevenue: $checkedConvert(
      'totalRevenue',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
    totalExpense: $checkedConvert(
      'totalExpense',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
  );
  return val;
});

Map<String, dynamic> _$ChartSalesStatisticsModelToJson(
  _ChartSalesStatisticsModel instance,
) => <String, dynamic>{
  'data': instance.data.map((e) => e.toJson()).toList(),
  'totalRevenue': instance.totalRevenue,
  'totalExpense': instance.totalExpense,
};
