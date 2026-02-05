// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salesstatistics_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SalesStatisticsDataModel _$SalesStatisticsDataModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_SalesStatisticsDataModel', json, ($checkedConvert) {
  final val = _SalesStatisticsDataModel(
    date: $checkedConvert('date', (v) => v as String),
    revenue: $checkedConvert(
      'revenue',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
    expense: $checkedConvert(
      'expense',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
  );
  return val;
});

Map<String, dynamic> _$SalesStatisticsDataModelToJson(
  _SalesStatisticsDataModel instance,
) => <String, dynamic>{
  'date': instance.date,
  'revenue': instance.revenue,
  'expense': instance.expense,
};
