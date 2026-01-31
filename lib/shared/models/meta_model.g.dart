// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MetaModel _$MetaModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_MetaModel', json, ($checkedConvert) {
      final val = _MetaModel(
        requestId: $checkedConvert('requestId', (v) => v as String?),
        timestamp: $checkedConvert('timestamp', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$MetaModelToJson(_MetaModel instance) =>
    <String, dynamic>{
      'requestId': ?instance.requestId,
      'timestamp': instance.timestamp,
    };
