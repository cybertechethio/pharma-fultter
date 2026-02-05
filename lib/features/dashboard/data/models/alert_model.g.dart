// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AlertModel _$AlertModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_AlertModel', json, ($checkedConvert) {
      final val = _AlertModel(
        id: $checkedConvert('id', (v) => JsonTypeConverters.intFromDynamic(v)),
        name: $checkedConvert('name', (v) => v as String),
        stock: $checkedConvert(
          'stock',
          (v) => JsonTypeConverters.intFromDynamic(v),
        ),
        threshold: $checkedConvert(
          'threshold',
          (v) => JsonTypeConverters.intFromDynamicNullable(v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$AlertModelToJson(_AlertModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'stock': instance.stock,
      'threshold': ?instance.threshold,
    };
