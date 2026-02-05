// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChartCustomerModel _$ChartCustomerModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ChartCustomerModel', json, ($checkedConvert) {
      final val = _ChartCustomerModel(
        firstTime: $checkedConvert(
          'firstTime',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        returning: $checkedConvert(
          'returning',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        firstTimePercentage: $checkedConvert(
          'firstTimePercentage',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        returningPercentage: $checkedConvert(
          'returningPercentage',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ChartCustomerModelToJson(_ChartCustomerModel instance) =>
    <String, dynamic>{
      'firstTime': instance.firstTime,
      'returning': instance.returning,
      'firstTimePercentage': instance.firstTimePercentage,
      'returningPercentage': instance.returningPercentage,
    };
