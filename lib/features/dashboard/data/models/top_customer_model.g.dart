// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TopCustomerModel _$TopCustomerModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_TopCustomerModel', json, ($checkedConvert) {
      final val = _TopCustomerModel(
        id: $checkedConvert('id', (v) => JsonTypeConverters.intFromDynamic(v)),
        name: $checkedConvert('name', (v) => v as String),
        imageUrl: $checkedConvert('imageUrl', (v) => v as String?),
        location: $checkedConvert('location', (v) => v as String?),
        orders: $checkedConvert(
          'orders',
          (v) => JsonTypeConverters.intFromDynamic(v),
        ),
        total: $checkedConvert(
          'total',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$TopCustomerModelToJson(_TopCustomerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': ?instance.imageUrl,
      'location': ?instance.location,
      'orders': instance.orders,
      'total': instance.total,
    };
