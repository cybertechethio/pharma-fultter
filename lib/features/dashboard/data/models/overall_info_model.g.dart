// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overall_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OverallInfoModel _$OverallInfoModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_OverallInfoModel', json, ($checkedConvert) {
      final val = _OverallInfoModel(
        suppliers: $checkedConvert(
          'suppliers',
          (v) => JsonTypeConverters.intFromDynamic(v),
        ),
        customers: $checkedConvert(
          'customers',
          (v) => JsonTypeConverters.intFromDynamic(v),
        ),
        orders: $checkedConvert(
          'orders',
          (v) => JsonTypeConverters.intFromDynamic(v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$OverallInfoModelToJson(_OverallInfoModel instance) =>
    <String, dynamic>{
      'suppliers': instance.suppliers,
      'customers': instance.customers,
      'orders': instance.orders,
    };
